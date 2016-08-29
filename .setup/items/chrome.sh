# Install and configure chrome

modules+=()
aptaddrepo+=("deb http://dl.google.com/linux/chrome/deb/ stable main")
dnfaddrepo+=()
aptinstall+=(google-chrome-stable)
dnfinstall+=()
config+=()
gsetting+=()
dconf+=()
run+=("echo Installing chrome; echo \"Test\"")
sudorun+=()
