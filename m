From: Meelis Roos <mroos@linux.ee>
Subject: 4.14 git: massive linker failures: cannot reach anything
Date: Mon, 11 Sep 2017 17:17:24 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1709111713220.23935@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

While compiling 4.13+git on all of my gentoo parisc machines, I get tons 
of linking failures like below. 

$ ld -v
GNU ld (Gentoo 2.26.1 p1.0) 2.26.1

$ hppa64-linux-gcc -v
Using built-in specs.
COLLECT_GCC=/usr/hppa2.0-unknown-linux-gnu/hppa64-unknown-linux-gnu/gcc-bin/5.4.0/hppa64-unknown-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/hppa64-unknown-linux-gnu/5.4.0/lto-wrapper
Target: hppa64-unknown-linux-gnu
Configured with: 
/var/tmp/portage/sys-devel/kgcc64-5.4.0/work/gcc-5.4.0/configure 
--host=hppa2.0-unknown-linux-gnu --target=hppa64-unknown-linux-gnu 
--build=hppa2.0-unknown-linux-gnu --prefix=/usr 
--bindir=/usr/hppa2.0-unknown-linux-gnu/hppa64-unknown-linux-gnu/gcc-bin/5.4.0 
--includedir=/usr/lib/gcc/hppa64-unknown-linux-gnu/5.4.0/include 
--datadir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/5.4.0 
--mandir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/5.4.0/man 
--infodir=/usr/share/gcc-data/hppa64-unknown-linux-gnu/5.4.0/info 
--with-gxx-include-dir=/usr/lib/gcc/hppa64-unknown-linux-gnu/5.4.0/include/g++-v5 
--with-python-dir=/share/gcc-data/hppa64-unknown-linux-gnu/5.4.0/python 
--enable-languages=c --enable-obsolete --enable-secureplt 
--disable-werror --with-system-zlib --enable-nls 
--without-included-gettext --enable-checking=release 
--with-bugurl=https://bugs.gentoo.org/ --with-pkgversion='Gentoo 5.4.0 p1.0' 
--enable-poison-system-directories --disable-shared 
--disable-libatomic --disable-threads --without-headers 
--disable-bootstrap --enable-__cxa_atexit --enable-clocale=gnu 
--disable-multilib --disable-altivec --disable-fixed-point 
--disable-libgcj --disable-libgomp --disable-libmudflap --disable-libssp 
--disable-libquadmath --enable-lto --without-isl --disable-libsanitizer
Thread model: single
gcc version 5.4.0 (Gentoo 5.4.0 p1.0)

hppa64-linux-ld: init/main.o(.text+0x160): cannot reach strreplace
init/main.o: In function `initcall_blacklisted':(.text+0x160): relocation truncated to fit: R_PARISC_PCREL22F against symbol `strreplace' defined in .text.strreplace section in lib/string.o
hppa64-linux-ld: init/main.o(.text+0x1a4): cannot reach strcmp
init/main.o: In function `initcall_blacklisted':(.text+0x1a4): relocation truncated to fit: R_PARISC_PCREL22F against symbol `strcmp' defined in .text.strcmp section in lib/string.o
hppa64-linux-ld: init/main.o(.text+0x22c): cannot reach __ubsan_handle_type_mismatch
init/main.o: In function `initcall_blacklisted':(.text+0x22c): relocation truncated to fit: R_PARISC_PCREL22F against symbol `__ubsan_handle_type_mismatch' defined in .text.__ubsan_handle_type_mismatch section in lib/ubsan.o

and so on for pages, more than my terminal scrollback provides.



-- 
Meelis Roos (mroos@linux.ee)
