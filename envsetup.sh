#!bash
cross_compile=`readlink -f ~/bin/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin`
current_path=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

echo buildscript_path=${current_path}
echo cross_compile_compile=${cross_compile}
export PATH=$PATH:${cross_compile}
#SET(CMAKE_C_COMPILER $ENV{HOME}/bin/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc)

function croot(){
	cd ${current_path}/../
}

function strip_tools(){
       arm-linux-gnueabihf-strip ${current_path}/../stressapptest/src/stressapptest
}

function build_iozone(){
	echo "please fix gcc in iozone makefile then run this function"
	croot
	cd iozone
	CC=arm-linux-gnueabihf-gcc make linux-arm
}

function build_stressapptest(){
	croot
	cd stressapptest
	./configure --host=arm-linux-gnueabihf  --with-static
	make
}

function build_all(){
	build_stressapptest
	strip_tools
	build_iozone
}
