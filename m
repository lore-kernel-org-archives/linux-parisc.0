From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Thu, 8 Jun 2006 20:56:56 -0400 (EDT)
Message-ID: <200606090056.k590uuq1027262@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Jun 5, 2006 12:49:52 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> There definitely are some funky things going on in the kernel.
> For example, if I try to build GCC with 'make -j 4 bootstrap' on
> gsyprf11, about 50% of the time make dies because of a malloc data
> corruption or a shell problem.  However, I never see this with
> just 'make bootstrap'.

This is an example:

/home/dave/gcc-4.2/objdir/./prev-gcc/xgcc -B/home/dave/gcc-4.2/objdir/./prev-gcc
/ -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/bin/ -c   -g -O2 -DIN_GCC   -W -
Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -pedantic -Wno-lon
g-long -Wno-variadic-macros -Wno-overlength-strings -Wold-style-definition -Wmis
sing-format-attribute -Werror -fno-common   -DHAVE_CONFIG_H -I. -I. -I../../gcc/
gcc -I../../gcc/gcc/. -I../../gcc/gcc/../include -I../../gcc/gcc/../libcpp/inclu
de  -I../../gcc/gcc/../libdecnumber -I../libdecnumber    ../../gcc/gcc/c-typeck.
c -o c-typeck.o
/bin/sh: line 6: 24262 Segmentation fault      (core dumped) make "DESTDIR=" "RP
ATH_ENVVAR=LD_LIBRARY_PATH" "TARGET_SUBDIR=hppa-linux" "bindir=/home/dave/opt/gn
u/gcc/gcc-4.2.0/bin" "datadir=/home/dave/opt/gnu/gcc/gcc-4.2.0/share" "exec_pref
ix=/home/dave/opt/gnu/gcc/gcc-4.2.0" "includedir=/home/dave/opt/gnu/gcc/gcc-4.2.
0/include" "datarootdir=/home/dave/opt/gnu/gcc/gcc-4.2.0/share" "docdir=/home/da
ve/opt/gnu/gcc/gcc-4.2.0/share/doc" "infodir=/home/dave/opt/gnu/gcc/gcc-4.2.0/in
fo" "htmldir=/home/dave/opt/gnu/gcc/gcc-4.2.0/share/doc" "libdir=/home/dave/opt/
gnu/gcc/gcc-4.2.0/lib" "libexecdir=/home/dave/opt/gnu/gcc/gcc-4.2.0/libexec" "li
spdir=" "localstatedir=/home/dave/opt/gnu/gcc/gcc-4.2.0/var" "mandir=/home/dave/
opt/gnu/gcc/gcc-4.2.0/man" "oldincludedir=/usr/include" "prefix=/home/dave/opt/g
nu/gcc/gcc-4.2.0" "sbindir=/home/dave/opt/gnu/gcc/gcc-4.2.0/sbin" "sharedstatedi
r=/home/dave/opt/gnu/gcc/gcc-4.2.0/com" "sysconfdir=/home/dave/opt/gnu/gcc/gcc-4
.2.0/etc" "tooldir=/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux" "build_tooldir=/
home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux" "target_alias=hppa-linux" "BISON=bis
on" "CC_FOR_BUILD=gcc" "CFLAGS_FOR_BUILD=-g -O2" "CXX_FOR_BUILD=c++" "EXPECT=/ho
me/dave/opt/gnu/bin/expect" "FLEX=flex" "INSTALL=/usr/bin/install -c" "INSTALL_D
ATA=/usr/bin/install -c -m 644" "INSTALL_PROGRAM=/usr/bin/install -c" "INSTALL_S
CRIPT=/usr/bin/install -c" "LEX=flex" "M4=m4" "MAKE=make" "RUNTEST=runtest" "RUN
TESTFLAGS=" "SHELL=/bin/sh" "YACC=bison -y" "`echo 'ADAFLAGS=' | sed -e s'/[^=][
^=]*=$/XFOO=/'`" "AR_FLAGS=rc" "`echo 'BOOT_ADAFLAGS=' | sed -e s'/[^=][^=]*=$/X
FOO=/'`" "BOOT_CFLAGS=-g -O2" "BOOT_LDFLAGS=" "CFLAGS=-g -O2" "CXXFLAGS=-g -O2"
"LDFLAGS=" "LIBCFLAGS=-g -O2" "LIBCXXFLAGS=-g -O2 -fno-implicit-templates" "STAG
E1_CFLAGS=-g" "STAGE1_LANGUAGES=c,ada" "AR_FOR_TARGET=ar" "AS_FOR_TARGET=as" "CC
_FOR_TARGET=/home/dave/gcc-4.2/objdir/./gcc/xgcc -B/home/dave/gcc-4.2/objdir/./g
cc/ -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/bin/ -B/home/dave/opt/gnu/gcc/
gcc-4.2.0/hppa-linux/lib/ -isystem /home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/i
nclude -isystem /home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/sys-include" "CFLAGS
_FOR_TARGET=-O2 -g -O2 " "CPPFLAGS_FOR_TARGET=" "CXX_FOR_TARGET=/home/dave/gcc-4
.2/objdir/./gcc/g++ -B/home/dave/gcc-4.2/objdir/./gcc/ -nostdinc++  -L/home/dave
/gcc-4.2/objdir/hppa-linux/libstdc++-v3/src -L/home/dave/gcc-4.2/objdir/hppa-lin
ux/libstdc++-v3/src/.libs -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/bin/ -B/
home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/lib/ -isystem /home/dave/opt/gnu/gcc/
gcc-4.2.0/hppa-linux/include -isystem /home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linu
x/sys-include" "CXXFLAGS_FOR_TARGET=-g -O2  -D_GNU_SOURCE" "DLLTOOL_FOR_TARGET=d
lltool" "GCJ_FOR_TARGET=/home/dave/gcc-4.2/objdir/./gcc/gcj -B/home/dave/gcc-4.2
/objdir/./gcc/ -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/bin/ -B/home/dave/o
pt/gnu/gcc/gcc-4.2.0/hppa-linux/lib/ -isystem /home/dave/opt/gnu/gcc/gcc-4.2.0/h
ppa-linux/include -isystem /home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/sys-inclu
de" "GFORTRAN_FOR_TARGET=/home/dave/gcc-4.2/objdir/./gcc/gfortran -B/home/dave/g
cc-4.2/objdir/./gcc/ -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/bin/ -B/home/
dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/lib/ -isystem /home/dave/opt/gnu/gcc/gcc-4
.2.0/hppa-linux/include -isystem /home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/sys
-include" "LD_FOR_TARGET=ld" "LIPO_FOR_TARGET=lipo" "LDFLAGS_FOR_TARGET=" "LIBCF
LAGS_FOR_TARGET=-O2 -g -O2 " "LIBCXXFLAGS_FOR_TARGET=-g -O2  -D_GNU_SOURCE -fno-
implicit-templates" "NM_FOR_TARGET=nm" "OBJDUMP_FOR_TARGET=objdump" "RANLIB_FOR_
TARGET=ranlib" "STRIP_FOR_TARGET=strip" "WINDRES_FOR_TARGET=windres" "`echo 'LAN
GUAGES=' | sed -e s'/[^=][^=]*=$/XFOO=/'`" "LEAN=false" "CONFIG_SHELL=/bin/sh" "
MAKEINFO=makeinfo --split-size=5000000 --split-size=5000000 --split-size=5000000
" 'AR=ar' 'AS=as' 'CC=gcc' 'CXX=c++' 'DLLTOOL=dlltool' 'LD=ld' 'LIPO=lipo' 'NM=n
m' 'OBJDUMP=objdump' 'RANLIB=ranlib' 'STRIP=strip' 'WINDRES=windres' CC="${CC}"
CC_FOR_BUILD="${CC_FOR_BUILD}" STAGE_PREFIX=$r/prev-gcc/ CFLAGS="-g -O2" LIBCFLA
GS="-g -O2" LDFLAGS="" "`echo 'ADAFLAGS=' | sed -e s'/[^=][^=]*=$/XFOO=/'`" "GCC
_FOR_TARGET= $r/./gcc/xgcc -B$r/./gcc/ -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-l
inux/bin/ -B/home/dave/opt/gnu/gcc/gcc-4.2.0/hppa-linux/lib/ -isystem /home/dave
/opt/gnu/gcc/gcc-4.2.0/hppa-linux/include -isystem /home/dave/opt/gnu/gcc/gcc-4.
2.0/hppa-linux/sys-include" "`echo 'STMP_FIXPROTO=' | sed -e s'/[^=][^=]*=$/XFOO
=/'`" "`echo 'LIMITS_H_TEST=' | sed -e s'/[^=][^=]*=$/XFOO=/'`" "`echo 'LIBGCC2_
CFLAGS=' | sed -e s'/[^=][^=]*=$/XFOO=/'`" "`echo 'LIBGCC2_DEBUG_CFLAGS=' | sed
-e s'/[^=][^=]*=$/XFOO=/'`" "`echo 'LIBGCC2_INCLUDES=' | sed -e s'/[^=][^=]*=$/X
FOO=/'`" `if [ -f stage_last ]; then echo quickstrap ; else echo all; fi`
make[2]: *** [all-stage2-gcc] Error 139
make[2]: Leaving directory `/home/dave/gcc-4.2/objdir'
make[1]: *** [stage2-bubble] Error 2
make[1]: Leaving directory `/home/dave/gcc-4.2/objdir'
make: *** [bootstrap] Error 2
make: INTERNAL: Exiting with 1 jobserver tokens available; should be 4!
Wed Jun  7 20:19:18 PDT 2006

>>From /var/log/debug:

Jun  7 20:19:18 gsyprf11 kernel: do_page_fault() pid=24262 command='make' type=1
5 address=0x1118498f
Jun  7 20:19:18 gsyprf11 kernel: vm_start = 0x00048000, vm_end = 0x00607000
Jun  7 20:19:18 gsyprf11 kernel:
Jun  7 20:19:18 gsyprf11 kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Jun  7 20:19:18 gsyprf11 kernel: PSW: 00000000000001000000000000001111 Not taint
ed
Jun  7 20:19:18 gsyprf11 kernel: r00-03  0000000000000000 00000000000476e8 00000
00000029b03 00000000bff07800
Jun  7 20:19:18 gsyprf11 kernel: r04-07  000000000009b268 0000000000000000 00000
0000010fe80 00000000000d8680
Jun  7 20:19:18 gsyprf11 kernel: r08-11  00000000000d8680 0000000000000000 00000
0000010fe80 0000000000000000
Jun  7 20:19:18 gsyprf11 kernel: r12-15  000000000009b1f0 0000000000000000 00000
00000000014 0000000000000000
Jun  7 20:19:18 gsyprf11 kernel: r16-19  0000000000000001 0000000000000001 00000
000000476e8 0000000000000000
Jun  7 20:19:18 gsyprf11 kernel: r20-23  00000000001dfca0 0000000000000000 00000
000c0000003 0000000000000000
Jun  7 20:19:18 gsyprf11 kernel: r24-27  0000000000000001 0000000000000016 00000
000001dfca0 00000000000466e8
Jun  7 20:19:18 gsyprf11 kernel: r28-31  0000000011184943 0000000040000003 00000
00003bd6800 0000000003bd6800
Jun  7 20:19:18 gsyprf11 kernel:
Jun  7 20:19:18 gsyprf11 kernel: IASQ: 0000000003bd6800 0000000003bd6800 IAOQ: 0
000000000029aa3 0000000000029aa7
Jun  7 20:19:18 gsyprf11 kernel:  IIR: 4b930098    ISR: 0000000003bd6800  IOR: 0
00000001118498f
Jun  7 20:19:18 gsyprf11 kernel:  CPU:        1   CR30: 000000001abb0000 CR31: 0
000000000008020
Jun  7 20:19:18 gsyprf11 kernel:  ORIG_R28: 0000000000000000
Jun  7 20:19:18 gsyprf11 kernel:  IAOQ[0]: 0x29aa3
Jun  7 20:19:18 gsyprf11 kernel:  IAOQ[1]: 0x29aa7
Jun  7 20:19:18 gsyprf11 kernel:  RP(r2): 0x29b03

dave@hiauly6:~/opt/gnu/bin$ disasm 0x4b930098
   0:   4b 93 00 98     ldw 4c(ret0),r19

(gdb) disass 0x29a90 0x29ab0
Dump of assembler code from 0x29a90 to 0x29ab0:
0x00029a90 <close_stdout+25828>:        copy ret0,r20
0x00029a94 <close_stdout+25832>:        ldw 48(r20),ret0
0x00029a98 <close_stdout+25836>:        cmpiclr,<> 0,ret0,r0
0x00029a9c <close_stdout+25840>:        copy r20,ret0
0x00029aa0 <close_stdout+25844>:        ldw 4c(ret0),r19

%ret0 is both misaligned and appears outside the VM range for the application.

The backtrace isn't particularly enlightening (need debug version of make).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
