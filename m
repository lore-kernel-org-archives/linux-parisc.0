Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BB004A19
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 12:52:04 -0700 (MST)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel2.hp.com (Postfix) with ESMTP id 16C254FD
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 14:52:03 -0500 (EST)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id MAA27797
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 12:52:02 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14gB7p-0003s1-00
	for <parisc-linux@parisc-linux.org>; Thu, 22 Mar 2001 12:52:01 -0700
To: parisc-linux@parisc-linux.org
Date: Thu, 22 Mar 2001 12:52:01 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14gB7p-0003s1-00@noam.fc.hp.com>
Subject: [parisc-linux] Fortran: undefined reference to `__builtin_cos'
List-ID: <linux-parisc.vger.kernel.org>

Not that it's critical, but our Fortran compiler looks like it almost
works but not quite.  Since this is probably something simple I thought
I'd post this build log which results from the compilers in
http://puffin.external.hp.com/pub/parisc/binaries/debian/newcompilers-20010321/

g77 -v -O2  -c -o neca.o neca.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 neca.f -quiet -dumpbase neca.f -O2 -version -o /tmp/ccDja2vd.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o neca.o /tmp/ccDja2vd.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necc.o necc.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necc.f -quiet -dumpbase necc.f -O2 -version -o /tmp/cc2tVv8P.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
necc.f: In subroutine `conect':
necc.f:626: warning:
        1OR PATCHES EXCEEDS LIMIT OF,I5)                                   
                                     ^
Missing comma in FORMAT statement at (^)
 as -V -o necc.o /tmp/cc2tVv8P.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necd.o necd.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necd.f -quiet -dumpbase necd.f -O2 -version -o /tmp/cckHRXbD.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necd.o /tmp/cckHRXbD.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o nece.o nece.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 nece.f -quiet -dumpbase nece.f -O2 -version -o /tmp/cckT7N4L.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o nece.o /tmp/cckT7N4L.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necf.o necf.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necf.f -quiet -dumpbase necf.f -O2 -version -o /tmp/ccsbjUSA.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necf.o /tmp/ccsbjUSA.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necg.o necg.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necg.f -quiet -dumpbase necg.f -O2 -version -o /tmp/ccIBiicz.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necg.o /tmp/ccIBiicz.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o nech.o nech.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 nech.f -quiet -dumpbase nech.f -O2 -version -o /tmp/cctgovxG.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
nech.f: In subroutine `load':
nech.f:548: warning:
    19   CALL PRNT (LDTAGS,LDTAGF(ISTEP),LDTAGT(ISTEP),ZLR(ISTEP),ZLI(ISTEP
              1
nech.f:554: (continued):
    21   CALL PRNT (LDTAGS,LDTAGF(ISTEP),LDTAGT(ISTEP),ZLR(ISTEP),ZLI(ISTEP
              2
Too few arguments for `prnt' at (2) versus invocation at (1) [info -f g77 M GLOBALS]
 as -V -o nech.o /tmp/cctgovxG.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necl.o necl.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necl.f -quiet -dumpbase necl.f -O2 -version -o /tmp/ccHyPdIP.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necl.o /tmp/ccHyPdIP.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necn.o necn.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necn.f -quiet -dumpbase necn.f -O2 -version -o /tmp/ccqxtT4S.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necn.o /tmp/ccqxtT4S.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necp.o necp.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necp.f -quiet -dumpbase necp.f -O2 -version -o /tmp/ccNXJhfH.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
necp.f: In subroutine `rdpat':
necp.f:279: warning:
         COMMON /SAVE/ IP(600),KCOM,COM(19,5),EPSR,SIG,SCRWLT,SCRWRT,FMHZ  
                 ^
Initial padding for common block `save' is 4 bytes at (^) -- consider reordering members, largest-type-size first
 as -V -o necp.o /tmp/ccNXJhfH.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necr.o necr.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necr.f -quiet -dumpbase necr.f -O2 -version -o /tmp/cc9Dqxkp.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necr.o /tmp/cc9Dqxkp.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
g77 -v -O2  -c -o necs.o necs.f
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/f771 necs.f -quiet -dumpbase necs.f -O2 -version -o /tmp/ccCfDuco.s
GNU F77 version 3.0 20010315 (prerelease) (hppa-linux)
	compiled by GNU C version 3.0 20010315 (prerelease).
 as -V -o necs.o /tmp/ccCfDuco.s
GNU assembler version 2.10.91 (hppa2.0-unknown-linux-gnu) using BFD version 2.10.91
cc    -c -o errsns.o errsns.c
g77 neca.o necc.o necd.o nece.o necf.o necg.o nech.o necl.o necn.o necp.o necr.o necs.o errsns.o -v -O2 -o nec
g77 version 3.0 20010315 (prerelease) (Fortran Frontend version 0.5.26 20010315 (experimental))
Driving: g77 neca.o necc.o necd.o nece.o necf.o necg.o nech.o necl.o necn.o necp.o necr.o necs.o errsns.o -v -O2 -o nec -lg2c -lm
Reading specs from /usr/lib/gcc-lib/hppa-linux/3.0/specs
Configured with: ../src/configure -v --enable-languages=c,c++,f77,proto,objc --prefix=/usr --infodir=/share/info --mandir=/share/man --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-threads=posix --enable-long-long --enable-nls --without-x --without-included-gettext --with-cpp-install-dir=bin --enable-objc-gc hppa-linux : (reconfigured) 
gcc version 3.0 20010315 (prerelease)
 /usr/lib/gcc-lib/hppa-linux/3.0/collect2 -dynamic-linker /lib/ld.so.1 -o nec /usr/lib/gcc-lib/hppa-linux/3.0/../../../crt1.o /usr/lib/gcc-lib/hppa-linux/3.0/../../../crti.o /usr/lib/gcc-lib/hppa-linux/3.0/crtbegin.o -L/usr/lib/gcc-lib/hppa-linux/3.0 -L/usr/lib/gcc-lib/hppa-linux/3.0/../../.. neca.o necc.o necd.o nece.o necf.o necg.o nech.o necl.o necn.o necp.o necr.o necs.o errsns.o -lg2c -lm -lgcc -lc -lgcc /usr/lib/gcc-lib/hppa-linux/3.0/crtend.o /usr/lib/gcc-lib/hppa-linux/3.0/../../../crtn.o
neca.o: In function `arc_':
neca.o(.text+0xf4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: neca.o(.text+0xf4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: neca.o(.text+0xf4): cannot handle R_PARISC_PCREL17F for __builtin_cos
neca.o(.text+0x108): undefined reference to `__builtin_sin'
/usr/local/bin/ld: neca.o(.text+0x108): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: neca.o(.text+0x108): cannot handle R_PARISC_PCREL17F for __builtin_sin
neca.o(.text+0x124): undefined reference to `__builtin_cos'
/usr/local/bin/ld: neca.o(.text+0x124): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: neca.o(.text+0x124): cannot handle R_PARISC_PCREL17F for __builtin_cos
neca.o(.text+0x130): undefined reference to `__builtin_sin'
/usr/local/bin/ld: neca.o(.text+0x130): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: neca.o(.text+0x130): cannot handle R_PARISC_PCREL17F for __builtin_sin
neca.o: In function `cabc_':
neca.o(.text+0x870): undefined reference to `__builtin_cos'
/usr/local/bin/ld: neca.o(.text+0x870): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: neca.o(.text+0x870): cannot handle R_PARISC_PCREL17F for __builtin_cos
neca.o(.text+0x884): undefined reference to `__builtin_sin'
/usr/local/bin/ld: neca.o(.text+0x884): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: neca.o(.text+0x884): cannot handle R_PARISC_PCREL17F for __builtin_sin
necc.o: In function `cmsw_':
necc.o(.text+0x4f8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necc.o(.text+0x4f8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necc.o(.text+0x4f8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necc.o(.text+0x504): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necc.o(.text+0x504): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necc.o(.text+0x504): cannot handle R_PARISC_PCREL17F for __builtin_cos
necc.o(.text+0xc78): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necc.o(.text+0xc78): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necc.o(.text+0xc78): cannot handle R_PARISC_PCREL17F for __builtin_sin
necc.o(.text+0xc84): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necc.o(.text+0xc84): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necc.o(.text+0xc84): cannot handle R_PARISC_PCREL17F for __builtin_cos
necd.o: In function `efld_':
necd.o(.text+0x20a4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necd.o(.text+0x20a4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necd.o(.text+0x20a4): cannot handle R_PARISC_PCREL17F for __builtin_cos
necd.o(.text+0x20bc): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necd.o(.text+0x20bc): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necd.o(.text+0x20bc): cannot handle R_PARISC_PCREL17F for __builtin_sin
necd.o(.text+0x2270): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necd.o(.text+0x2270): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necd.o(.text+0x2270): cannot handle R_PARISC_PCREL17F for __builtin_sin
necd.o: In function `eksc_':
necd.o(.text+0x3930): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necd.o(.text+0x3930): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necd.o(.text+0x3930): cannot handle R_PARISC_PCREL17F for __builtin_sin
necd.o(.text+0x393c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necd.o(.text+0x393c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necd.o(.text+0x393c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o: In function `ekscx_':
nece.o(.text+0x110): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x110): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x110): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x11c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x11c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x11c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o: In function `error_':
nece.o(.text+0xa38): undefined reference to `errsns_'
/usr/local/bin/ld: nece.o(.text+0xa38): cannot find stub entry 00000038_errsns_+0
/usr/local/bin/ld: nece.o(.text+0xa38): cannot handle R_PARISC_PCREL17F for errsns_
nece.o: In function `etmns_':
nece.o(.text+0xb48): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0xb48): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0xb48): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0xb68): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0xb68): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0xb68): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0xb84): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0xb84): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0xb84): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0xba0): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0xba0): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0xba0): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0xd40): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0xd40): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0xd40): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0xd4c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0xd4c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0xd4c): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x1340): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x1340): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x1340): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x134c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x134c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x134c): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x136c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x136c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x136c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x1380): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x1380): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x1380): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x139c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x139c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x139c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x13a8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x13a8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x13a8): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x1664): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x1664): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x1664): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x1670): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x1670): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x1670): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x186c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x186c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x186c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x1878): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x1878): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x1878): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x199c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x199c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x199c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x19a8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x19a8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x19a8): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x1c28): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x1c28): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x1c28): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x1c34): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x1c34): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x1c34): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x1f10): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x1f10): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x1f10): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x1f1c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x1f1c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x1f1c): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x21c8): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x21c8): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x21c8): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x21d4): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x21d4): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x21d4): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x236c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x236c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x236c): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x2378): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x2378): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x2378): cannot handle R_PARISC_PCREL17F for __builtin_sin
nece.o(.text+0x26a4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nece.o(.text+0x26a4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nece.o(.text+0x26a4): cannot handle R_PARISC_PCREL17F for __builtin_cos
nece.o(.text+0x26b0): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nece.o(.text+0x26b0): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nece.o(.text+0x26b0): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o: In function `L2':
necf.o(.text+0x2e4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x2e4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x2e4): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x2f0): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x2f0): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x2f0): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o: In function `ffld_':
necf.o(.text+0xb48): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0xb48): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0xb48): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0xb58): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0xb58): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0xb58): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0xb70): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0xb70): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0xb70): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0xb98): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0xb98): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0xb98): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x10b4): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x10b4): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x10b4): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x10e8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x10e8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x10e8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x1118): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x1118): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x1118): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x11b0): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x11b0): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x11b0): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x11bc): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x11bc): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x11bc): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x1e24): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x1e24): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x1e24): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x1e30): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x1e30): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x1e30): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o: In function `fflds_':
necf.o(.text+0x227c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x227c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x227c): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x228c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x228c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x228c): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o: In function `gf_':
necf.o(.text+0x2558): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x2558): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x2558): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x2578): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x2578): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x2578): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x25c8): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x25c8): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x25c8): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o: In function `gfld_':
necf.o(.text+0x3b9c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x3b9c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x3b9c): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x3bb4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x3bb4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x3bb4): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x3e74): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x3e74): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x3e74): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x3ea8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x3ea8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x3ea8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x3ed8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x3ed8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x3ed8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x3f60): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x3f60): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x3f60): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x3f6c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x3f6c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x3f6c): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x42c4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x42c4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x42c4): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x42d0): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x42d0): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x42d0): cannot handle R_PARISC_PCREL17F for __builtin_sin
necf.o(.text+0x45b4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necf.o(.text+0x45b4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necf.o(.text+0x45b4): cannot handle R_PARISC_PCREL17F for __builtin_cos
necf.o(.text+0x45c0): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necf.o(.text+0x45c0): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necf.o(.text+0x45c0): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o: In function `gh_':
necg.o(.text+0xf18): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0xf18): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0xf18): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0xf24): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0xf24): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0xf24): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o: In function `gx_':
necg.o(.text+0x253c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x253c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x253c): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x2548): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x2548): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x2548): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o: In function `gxx_':
necg.o(.text+0x27c0): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x27c0): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x27c0): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x27cc): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x27cc): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x27cc): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o: In function `helix_':
necg.o(.text+0x2f20): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x2f20): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x2f20): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x2f64): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x2f64): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x2f64): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o(.text+0x2fac): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x2fac): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x2fac): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x2ff4): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x2ff4): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x2ff4): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o: In function `L412':
necg.o(.text+0x3290): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x3290): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x3290): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x3300): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x3300): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x3300): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x3324): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x3324): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x3324): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o(.text+0x334c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x334c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x334c): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x3378): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x3378): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x3378): cannot handle R_PARISC_PCREL17F for __builtin_sin
necg.o: In function `hintg_':
necg.o(.text+0x3c00): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necg.o(.text+0x3c00): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necg.o(.text+0x3c00): cannot handle R_PARISC_PCREL17F for __builtin_cos
necg.o(.text+0x3c0c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necg.o(.text+0x3c0c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necg.o(.text+0x3c0c): cannot handle R_PARISC_PCREL17F for __builtin_sin
nech.o: In function `hsflx_':
nech.o(.text+0x110): undefined reference to `__builtin_cos'
/usr/local/bin/ld: nech.o(.text+0x110): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: nech.o(.text+0x110): cannot handle R_PARISC_PCREL17F for __builtin_cos
nech.o(.text+0x11c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: nech.o(.text+0x11c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: nech.o(.text+0x11c): cannot handle R_PARISC_PCREL17F for __builtin_sin
necl.o: In function `move_':
necl.o(.text+0x518): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necl.o(.text+0x518): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necl.o(.text+0x518): cannot handle R_PARISC_PCREL17F for __builtin_sin
necl.o(.text+0x524): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necl.o(.text+0x524): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necl.o(.text+0x524): cannot handle R_PARISC_PCREL17F for __builtin_cos
necl.o(.text+0x530): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necl.o(.text+0x530): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necl.o(.text+0x530): cannot handle R_PARISC_PCREL17F for __builtin_sin
necl.o(.text+0x540): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necl.o(.text+0x540): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necl.o(.text+0x540): cannot handle R_PARISC_PCREL17F for __builtin_cos
necl.o(.text+0x564): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necl.o(.text+0x564): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necl.o(.text+0x564): cannot handle R_PARISC_PCREL17F for __builtin_sin
necl.o(.text+0x574): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necl.o(.text+0x574): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necl.o(.text+0x574): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o: In function `L325':
necn.o(.text+0x1a54): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necn.o(.text+0x1a54): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necn.o(.text+0x1a54): cannot handle R_PARISC_PCREL17F for __builtin_sin
necn.o(.text+0x1a8c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necn.o(.text+0x1a8c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necn.o(.text+0x1a8c): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o: In function `L440':
necn.o(.text+0x37b8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necn.o(.text+0x37b8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necn.o(.text+0x37b8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necn.o(.text+0x37e0): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necn.o(.text+0x37e0): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necn.o(.text+0x37e0): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o: In function `L444':
necn.o(.text+0x39b8): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necn.o(.text+0x39b8): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necn.o(.text+0x39b8): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o(.text+0x39c4): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necn.o(.text+0x39c4): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necn.o(.text+0x39c4): cannot handle R_PARISC_PCREL17F for __builtin_sin
necn.o(.text+0x3a30): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necn.o(.text+0x3a30): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necn.o(.text+0x3a30): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o(.text+0x3a3c): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necn.o(.text+0x3a3c): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necn.o(.text+0x3a3c): cannot handle R_PARISC_PCREL17F for __builtin_sin
necn.o: In function `__g77_masterfun_patch':
necn.o(.text+0x4930): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necn.o(.text+0x4930): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necn.o(.text+0x4930): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o(.text+0x4944): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necn.o(.text+0x4944): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necn.o(.text+0x4944): cannot handle R_PARISC_PCREL17F for __builtin_cos
necn.o(.text+0x4954): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necn.o(.text+0x4954): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necn.o(.text+0x4954): cannot handle R_PARISC_PCREL17F for __builtin_sin
necn.o(.text+0x4964): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necn.o(.text+0x4964): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necn.o(.text+0x4964): cannot handle R_PARISC_PCREL17F for __builtin_sin
necp.o: In function `qdsrc_':
necp.o(.text+0xb0c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0xb0c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0xb0c): cannot handle R_PARISC_PCREL17F for __builtin_cos
necp.o(.text+0xb20): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necp.o(.text+0xb20): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necp.o(.text+0xb20): cannot handle R_PARISC_PCREL17F for __builtin_sin
necp.o: In function `L162':
necp.o(.text+0x20e8): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0x20e8): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0x20e8): cannot handle R_PARISC_PCREL17F for __builtin_cos
necp.o(.text+0x20fc): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0x20fc): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0x20fc): cannot handle R_PARISC_PCREL17F for __builtin_cos
necp.o: In function `L182':
necp.o(.text+0x2384): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0x2384): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0x2384): cannot handle R_PARISC_PCREL17F for __builtin_cos
necp.o(.text+0x2390): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0x2390): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0x2390): cannot handle R_PARISC_PCREL17F for __builtin_cos
necp.o: In function `L328':
necp.o(.text+0x2d40): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0x2d40): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0x2d40): cannot handle R_PARISC_PCREL17F for __builtin_cos
necp.o(.text+0x2d90): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necp.o(.text+0x2d90): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necp.o(.text+0x2d90): cannot handle R_PARISC_PCREL17F for __builtin_sin
necp.o(.text+0x2db8): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necp.o(.text+0x2db8): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necp.o(.text+0x2db8): cannot handle R_PARISC_PCREL17F for __builtin_cos
necr.o: In function `reflc_':
necr.o(.text+0xccc): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necr.o(.text+0xccc): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necr.o(.text+0xccc): cannot handle R_PARISC_PCREL17F for __builtin_cos
necr.o(.text+0xcd8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necr.o(.text+0xcd8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necr.o(.text+0xcd8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necr.o: In function `sbf_':
necr.o(.text+0x1b80): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necr.o(.text+0x1b80): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necr.o(.text+0x1b80): cannot handle R_PARISC_PCREL17F for __builtin_sin
necr.o(.text+0x1b8c): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necr.o(.text+0x1b8c): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necr.o(.text+0x1b8c): cannot handle R_PARISC_PCREL17F for __builtin_cos
necr.o(.text+0x1d38): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necr.o(.text+0x1d38): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necr.o(.text+0x1d38): cannot handle R_PARISC_PCREL17F for __builtin_sin
necr.o(.text+0x1d44): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necr.o(.text+0x1d44): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necr.o(.text+0x1d44): cannot handle R_PARISC_PCREL17F for __builtin_cos
necr.o: In function `sflds_':
necr.o(.text+0x2428): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necr.o(.text+0x2428): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necr.o(.text+0x2428): cannot handle R_PARISC_PCREL17F for __builtin_cos
necr.o(.text+0x2434): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necr.o(.text+0x2434): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necr.o(.text+0x2434): cannot handle R_PARISC_PCREL17F for __builtin_sin
necr.o(.text+0x2954): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necr.o(.text+0x2954): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necr.o(.text+0x2954): cannot handle R_PARISC_PCREL17F for __builtin_sin
necr.o(.text+0x2d24): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necr.o(.text+0x2d24): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necr.o(.text+0x2d24): cannot handle R_PARISC_PCREL17F for __builtin_sin
necr.o(.text+0x2d80): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necr.o(.text+0x2d80): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necr.o(.text+0x2d80): cannot handle R_PARISC_PCREL17F for __builtin_cos
necs.o: In function `tbf_':
necs.o(.text+0x15d8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necs.o(.text+0x15d8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necs.o(.text+0x15d8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necs.o(.text+0x15e4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necs.o(.text+0x15e4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necs.o(.text+0x15e4): cannot handle R_PARISC_PCREL17F for __builtin_cos
necs.o(.text+0x17fc): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necs.o(.text+0x17fc): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necs.o(.text+0x17fc): cannot handle R_PARISC_PCREL17F for __builtin_sin
necs.o(.text+0x1808): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necs.o(.text+0x1808): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necs.o(.text+0x1808): cannot handle R_PARISC_PCREL17F for __builtin_cos
necs.o: In function `unere_':
necs.o(.text+0x21c8): undefined reference to `__builtin_sin'
/usr/local/bin/ld: necs.o(.text+0x21c8): cannot find stub entry 00000038___builtin_sin+0
/usr/local/bin/ld: necs.o(.text+0x21c8): cannot handle R_PARISC_PCREL17F for __builtin_sin
necs.o(.text+0x21d4): undefined reference to `__builtin_cos'
/usr/local/bin/ld: necs.o(.text+0x21d4): cannot find stub entry 00000038___builtin_cos+0
/usr/local/bin/ld: necs.o(.text+0x21d4): cannot handle R_PARISC_PCREL17F for __builtin_cos
collect2: ld returned 1 exit status
make: *** [nec] Error 1
