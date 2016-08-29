# Install and configure vim

modules+=()
aptaddrepo+=()
dnfaddrepo+=()
aptinstall+=(vim)
dnfinstall+=(vim)
config+=(.vimrc)
gsetting+=()
dconf+=()
run+=("echo Installing vim; echo \"Test\"")
sudorun+=()
