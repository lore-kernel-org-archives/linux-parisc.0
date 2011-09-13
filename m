From: Graham Gower <graham.gower@gmail.com>
Subject: failure to link kernel 3.0.3 with cross binutils-2.21.1/gcc-4.6.1
Date: Tue, 13 Sep 2011 16:50:28 +0930
Message-ID: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Toolchain build like so:

grg@eye7:~$ cat bin/hppa64-cross.sh
#!/bin/sh

PREFIX=/tmp/hppa65
TARGET=hppa64-linux
HOST=x86_64-slackware-linux
BINUTILS=binutils-2.21.1
GCC=gcc-4.6.1
TMPDIR=/tmp
MAKEOPTS="-j 8"

PATH=$PREFIX/bin:$PATH

die() {
	echo "||||||"
	echo "ERROR: $@"
	exit 1
}

### Binutils
do_binutils() {
	cd $TMPDIR
	tar xf $BINUTILS.tar.bz2

	mkdir build-$BINUTILS
	cd build-$BINUTILS

	../$BINUTILS/configure \
		--target=$TARGET \
		--prefix=$PREFIX \
		|| return 1

	make $MAKEOPTS || return 1
	make $MAKEOPTS install || return 1
}

### GCC, initial gcc without threading or shared library support
do_gcc1() {
	cd $TMPDIR
	tar xf $GCC.tar.bz2

	mkdir build-$GCC-1
	cd build-$GCC-1

	export AR=ar

	../$GCC/configure \
		--target=$TARGET \
		--host=$HOST \
		--build=$HOST \
		--prefix=$PREFIX \
		--with-newlib \
		--disable-shared \
		--disable-threads \
		--disable-multilib \
		--disable-libmudflap \
		--disable-libssp \
		--disable-libgomp \
		--disable-libquadmath \
		--enable-languages=c \
		$GCC1_EXTRA_CONF \
		|| return 1

	make $MAKEOPTS || return 1
	make $MAKEOPTS install || return 1
}

do_clean() {
	cd $TMPDIR
	rm -fr build-$BINUTILS build-$GCC-1
	rm -fr $BINUTILS $GCC $GLIBC $LINUX
}


do_clean
do_binutils || die "do_binutils failed"
do_gcc1 || die "do_gcc1 failed"





grg@eye7:/mnt/1T/hppa/linux-3.0$ make vmlinux ARCH=parisc
CROSS_COMPILE=/tmp/hppa64/bin/hppa64-linux-
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.o
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
  KSYM    .tmp_kallsyms1.S
  AS      .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
/tmp/hppa64/bin/hppa64-linux-ld:
arch/parisc/mm/built-in.o(.init.text+0xed0): cannot reach
flush_tlb_all_local
/tmp/hppa64/bin/hppa64-linux-ld: BFD (GNU Binutils) 2.21.1 internal
error, aborting at ../../binutils-2.21.1/bfd/elf64-hppa.c line 3956 in
elf64_hppa_relocate_section

/tmp/hppa64/bin/hppa64-linux-ld: Please report this bug.

make: *** [.tmp_vmlinux2] Error 1



Any clues?
-Graham
