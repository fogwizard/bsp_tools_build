#!bash
cross_compile=`readlink -f ~/bin/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin`
current_path=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

echo buildscript_path=${current_path}
echo cross_compile_compile=${cross_compile}
export PATH=$PATH:${cross_compile}

function croot(){
	cd ${current_path}/../
}

function build_stressapptest(){
	croot
	cd stressapptest
	./configure --host=arm-linux-gnueabihf  --with-static
	make
}
