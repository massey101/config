#!/bin/bash
###############################################################################
# File to aid in building with docker


get_basename() {
    basename $(readlink -f $1)
}

project=$(get_basename $(pwd))

# Docker commands
###############################################################################

docker_ver="docker_ver"

get_docker_version() {
    if [ ! -f ${docker_ver} ]; then
        echo -1
        return
    fi
    cat ${docker_ver}
}

get_new_docker_version() {
    ver=$(get_docker_version)
    ver=$(expr $ver + 1)
    echo $ver
}

save_docker_version() {
    echo $1 > ${docker_ver}
}

docker_build() {
    ver=$(get_new_docker_version)
    docker build -t "${project}:${ver}" docker/
    if [ $? -ne 0 ]; then
        echo "Build failed"
        return 2
    fi
    docker tag "${project}:${ver}" "${project}:latest"
    save_docker_version $ver
}

get_docker() {
    if [[ docker/Dockerfile -nt ${docker_ver} ]]; then
        docker_build 1>&2 || return 2
    fi
    get_docker_version
}

run_in_docker() {
    exportdir=$(pwd)/build
    dirname=$(get_basename $exportdir)
    ver=$(get_docker) || return 2

    docker run -it \
        -u "$USER:$USER" \
        -u "$(id -u):$(id -g)" \
        -v "${exportdir}:/${dirname}" \
        -w /${dirname} \
        "${project}:${ver}" \
        bash -c "$@"
}

root_in_docker() {
    exportdir=$(pwd)/build
    dirname=$(get_basename $exportdir)
    ver=$(get_docker) || return 2

    docker run -it \
        -v "${exportdir}:/${dirname}" \
        -w /${dirname} \
        "${project}:${ver}" \
        bash -c bash
}


# Command line options
###############################################################################

commands=("help" "docker" "build" "test" "run" "debug" "clean")

command_help() {
    echo "make.sh docker|build|test|run|debug|clean"
}

command_docker() {
    docker_build
}

command_build() {
    rsync -av source/ build/
    run_in_docker "mkdir build"
    cp buildscript.sh build/
    run_in_docker "./buildscript.sh"
}

command_test() {
    rsync -av source/ build/
    cp testscript.sh build/
    run_in_docker "./testscript.sh"
}

command_run() {
    rsync -av source/ build/
    run_in_docker "$@"
}

command_debug() {
    rsync -av source/ build/
    if [ "$1" == "" ]; then
        1=bash
    fi
    root_in_docker "$@"
}

command_clean() {
    rm -rf build/
}


# Command line processing
###############################################################################
main() {
    if [ "$1" == "" ]; then
        command_help
        exit 1
    fi
    to_run=$1
    shift 1
    command_$to_run $@
    retval=$?
    if [ $retval -eq 127 ]; then
        command_help
        exit 1
    fi
    return $retval
}

main $@
