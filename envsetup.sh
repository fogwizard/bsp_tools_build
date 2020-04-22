#!bash
cross_compile=`readlink -f ~/bin/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin`
echo cross_compile_compile=${cross_compile}
export PATH=$PATH:${cross_compile}

function croot(){
	return
}

function build_stressapptest(){
	croot
	cd stressapptest
	./configure --host=arm-linux-gnueabihf  --with-static
	make
}
