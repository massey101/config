check_dup() {
    ps $1 | grep duplicity 2>/dev/null 1>/dev/null
    return $?
}

for pid in $(pgrep python2); do
    echo -n "Found $pid ... "
    if check_dup $pid; then
        echo -n "Duplicity"
        cpulimit -b -p $pid --limit=10
        if [ $? -ne 0 ]; then
            echo " ! Error with cpulimit" >&2
            exit 1
        fi
    else
        echo -n "Not Duplicity"
    fi
    echo
done
