Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA09848
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Mar 2000 14:52:21 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id A8F4AE3E2
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Mar 2000 15:53:33 -0500 (EST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id MAA19735 for parisc-linux@thepuffingroup.com; Wed, 22 Mar 2000 12:55:41 -0800 (PST)
Date: Wed, 22 Mar 2000 12:55:41 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200003222055.MAA19735@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] building hppa2.0 toolchain
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I was trying to build the hppa2.0 toolchain after it was
suggested the recipe at http://www.thepuffingroup.com/parisc/recipe.html
worked (except s/hppa1.1/hppa2.0/).

I used "--prefix=/opt/puffin64" to configure and the binutils seemed
to make and install with no problem. PATH is:

    /opt/puffin64/bin:/opt/socks/bin:/opt/puffin/bin:/opt/gcc/bin: \
    /opt/binutils/bin:/home/grundler/bin:/bin:/usr/bin:/usr/contrib/bin: \
    /usr/local/bin:/usr/vue/bin:/usr/bin/X11:/usr/contrib/bin/X11: \
    /usr/local/bin/X11:/usr/local/bin/mh:/usr/local/games:/opt/wt/bin:/etc:.

I got as far as step 3. "Configure and build GCC:". The "make"
dies. Anyone trying this as well? Or know what's wrong?

thanks,
grant

grundler<509>make
[ stuff scrolled off ]

gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -W -Wall    -I. -I.. -I../../../gcc/gcc/cp -I../../../gcc/gcc/cp/.. -I../../../gcc/gcc/cp/../config -I../../../gcc/gcc/cp/../../include ../../../gcc/gcc/cp/tree.c
In file included from ../tm.h:12,
                 from ../../../gcc/gcc/cp/../config/pa/xm-pahpux.h:47,
                 from ../config.h:8,
                 from ../../../gcc/gcc/cp/tree.c:22:
../../../gcc/gcc/cp/../config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../../gcc/gcc/cp/../config/pa/linux.h:66: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../../gcc/gcc/cp/../config/svr4.h:424: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:621: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:631: warning: this is the location of the previous definition
../../../gcc/gcc/cp/tree.c: In function `init_cplus_unsave':
../../../gcc/gcc/cp/tree.c:2854: warning: assignment from incompatible pointer type
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -W -Wall    -I. -I.. -I../../../gcc/gcc/cp -I../../../gcc/gcc/cp/.. -I../../../gcc/gcc/cp/../config -I../../../gcc/gcc/cp/../../include ../../../gcc/gcc/cp/xref.c
In file included from ../tm.h:12,
                 from ../../../gcc/gcc/cp/../config/pa/xm-pahpux.h:47,
                 from ../config.h:8,
                 from ../../../gcc/gcc/cp/xref.c:23:
../../../gcc/gcc/cp/../config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../../gcc/gcc/cp/../config/pa/linux.h:66: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../../gcc/gcc/cp/../config/svr4.h:424: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:621: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -W -Wall    -I. -I.. -I../../../gcc/gcc/cp -I../../../gcc/gcc/cp/.. -I../../../gcc/gcc/cp/../config -I../../../gcc/gcc/cp/../../include ../../../gcc/gcc/cp/repo.c
In file included from ../tm.h:12,
                 from ../../../gcc/gcc/cp/../config/pa/xm-pahpux.h:47,
                 from ../config.h:8,
                 from ../../../gcc/gcc/cp/repo.c:28:
../../../gcc/gcc/cp/../config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../../gcc/gcc/cp/../config/pa/linux.h:66: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../../gcc/gcc/cp/../config/svr4.h:424: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:621: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -W -Wall    -I. -I.. -I../../../gcc/gcc/cp -I../../../gcc/gcc/cp/.. -I../../../gcc/gcc/cp/../config -I../../../gcc/gcc/cp/../../include ../../../gcc/gcc/cp/dump.c
In file included from ../tm.h:12,
                 from ../../../gcc/gcc/cp/../config/pa/xm-pahpux.h:47,
                 from ../config.h:8,
                 from ../../../gcc/gcc/cp/dump.c:25:
../../../gcc/gcc/cp/../config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../../gcc/gcc/cp/../config/pa/linux.h:66: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../../gcc/gcc/cp/../config/svr4.h:424: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:621: warning: this is the location of the previous definition
../../../gcc/gcc/cp/../config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../../gcc/gcc/cp/../config/svr4.h:631: warning: this is the location of the previous definition
gcc -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -W -Wall  -o ../cc1plus `cat ../stamp-objlist` ../c-common.o ../c-pragma.o call.o decl.o errfn.o expr.o pt.o typeck2.o class.o decl2.o error.o lex.o parse.o ptree.o rtti.o spew.o typeck.o cvt.o except.o friend.o init.o method.o search.o semantics.o tree.o xref.o repo.o dump.o  `if [ xobstack.o != x ]; then echo ../obstack.o; else true; fi` `if [ xalloca.o != x ]; then echo ../alloca.o; else true; fi` `if [ x != x ]; then echo ../; else true; fi`   ../../libiberty/libiberty.a
make[2]: Leaving directory `/linux/grundler/gcc-build/gcc/cp'
gcc -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include  \
-DTARGET_MACHINE=\"hppa2.0-linux\"  \
-c `echo ../../gcc/gcc/collect2.c | sed 's,^\./,,'`
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/collect2.c:28:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/tlink.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/tlink.c:24:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
echo "int xxy_us_dummy;" >tmp-dum.c
/linux/grundler/gcc-build/gcc/xgcc -B/linux/grundler/gcc-build/gcc/ -B/opt/puffin64/hppa2.0-linux/bin/ -I/opt/puffin64/hppa2.0-linux/include -S tmp-dum.c
echo '/*WARNING: This file is automatically generated!*/' >tmp-under.c
if grep _xxy_us_dummy tmp-dum.s > /dev/null ; then \
  echo "int prepends_underscore = 1;" >>tmp-under.c; \
else \
  echo "int prepends_underscore = 0;" >>tmp-under.c; \
fi
../../gcc/gcc/move-if-change tmp-under.c underscore.c
rm -f tmp-dum.c tmp-dum.s
touch s-under
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include underscore.c
rm -f collect2
gcc -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H  -o collect2 collect2.o tlink.o hash.o intl.o underscore.o version.o  obstack.o alloca.o       ../libiberty/libiberty.a
cp xgcc gcc-cross
/linux/grundler/gcc-build/gcc/xgcc -B/linux/grundler/gcc-build/gcc/ -B/opt/puffin64/hppa2.0-linux/bin/ -I/opt/puffin64/hppa2.0-linux/include -dumpspecs > tmp-specs
mv tmp-specs specs
touch stmp-headers
if [ -d /opt/puffin64/hppa2.0-linux/sys-include ]; \
then \
  CC="/linux/grundler/gcc-build/gcc/xgcc -B/linux/grundler/gcc-build/gcc/ -B/opt/puffin64/hppa2.0-linux/bin/ -I/opt/puffin64/hppa2.0-linux/include -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2  -I./include     -I. -I../../gcc/gcc -Iinclude -I/opt/puffin64/hppa2.0-linux/sys-include"; \
  export CC; \
  /bin/sh ../../gcc/gcc/scan-types.sh "../../gcc/gcc" >tmp-deduced.h; \
  mv tmp-deduced.h deduced.h; \
else \
  touch deduced.h; \
fi
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/gen-protos.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from hconfig.h:8,
                 from ../../gcc/gcc/gen-protos.c:18:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/scan.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from hconfig.h:8,
                 from ../../gcc/gcc/scan.c:18:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cpplib.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cpplib.c:21:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cpphash.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cpphash.c:25:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cppalloc.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cppalloc.c:25:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cpperror.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cpperror.c:26:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cppexp.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cppexp.c:27:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cppfiles.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cppfiles.c:26:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include \
  -DGCC_INCLUDE_DIR=\"/opt/puffin64/lib/gcc-lib/hppa2.0-linux/2.9-hppa-991112/include\" -DGPLUSPLUS_INCLUDE_DIR=\"/opt/puffin64/lib/gcc-lib/hppa2.0-linux/2.9-hppa-991112/../../../..`echo /opt/puffin64 | sed -e 's|^/opt/puffin64||' -e 's|/[^/]*|/..|g'`/include/g++-\" -DLOCAL_INCLUDE_DIR=\"/opt/puffin64/include\" -DCROSS_INCLUDE_DIR=\"/opt/puffin64/lib/gcc-lib/hppa2.0-linux/2.9-hppa-991112/../../../../hppa2.0-linux/sys-include\" -DTOOL_INCLUDE_DIR=\"/opt/puffin64/lib/gcc-lib/hppa2.0-linux/2.9-hppa-991112/../../../../hppa2.0-linux/include\" \
  -c `echo ../../gcc/gcc/cppinit.c | sed 's,^\./,,'`
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cppinit.c:21:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/cppulp.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from config.h:8,
                 from ../../gcc/gcc/cppulp.c:21:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
ar rc libcpp.a cpplib.o cpphash.o cppalloc.o cpperror.o cppexp.o cppfiles.o cppinit.o cppulp.o prefix.o version.o mbchar.o 
if [ -f true ] || [ -f /usr/bin/ranlib -o -f /bin/ranlib ] ; then true libcpp.a ; else true ; fi
gcc -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H  -o gen-protos \
  gen-protos.o scan.o libcpp.a ` case "obstack.o" in ?*) echo obstack.o ;; esac ` ` case "alloca.o" in ?*) echo alloca.o ;; esac ` ` case "" in ?*) echo  ;; esac `  ` case "" in ?*) echo  ;; esac ` ` case "" in ?*) echo  ;; esac ` 
cat deduced.h ../../gcc/gcc/sys-protos.h > tmp-fixtmp.c
mv tmp-fixtmp.c fixtmp.c
/linux/grundler/gcc-build/gcc/xgcc -B/linux/grundler/gcc-build/gcc/ -B/opt/puffin64/hppa2.0-linux/bin/ -I/opt/puffin64/hppa2.0-linux/include fixtmp.c -w -U__SIZE_TYPE__ -U__PTRDIFF_TYPE__ -U__WCHAR_TYPE__ -E \
  | sed -e 's/  / /g' -e 's/ *(/ (/g' -e 's/ [ ]*/ /g' -e 's/( )/()/' \
  | ./gen-protos >xsys-protos.hT
mv xsys-protos.hT xsys-protos.h
rm -rf fixtmp.c
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/fix-header.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from hconfig.h:8,
                 from ../../gcc/gcc/fix-header.c:73:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -c -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H    -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include ../../gcc/gcc/scan-decls.c
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-pahpux.h:47,
                 from hconfig.h:8,
                 from ../../gcc/gcc/scan-decls.c:20:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
gcc -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2   -DHAVE_CONFIG_H  -o fix-header fix-header.o \
   scan-decls.o scan.o libcpp.a ` case "obstack.o" in ?*) echo obstack.o ;; esac ` ` case "alloca.o" in ?*) echo alloca.o ;; esac ` ` case "" in ?*) echo  ;; esac `  ` case "" in ?*) echo  ;; esac ` ` case "" in ?*) echo  ;; esac ` 
rm -f fixproto-defines; \
    echo "#!/bin/sh" > fixproto-defines ; \
    echo "# Print FIXPROTO_DEFINES needed by fixproto." >> fixproto-defines ; \
    echo "echo '-D_HPUX_SOURCE'" >> fixproto-defines ; \
    chmod +x fixproto-defines
if [ -f fixhdr.ready ] ; then \
        true; \
else \
        touch fixhdr.ready; \
fi
Various warnings and error messages from fixproto are normal
if [ -d include ] ; then true; else mkdir include; fi
if [ -f include/fixed ] ; then true; \
else \
  : This line works around a 'make' bug in BSDI 1.1.; \
  FIXPROTO_DEFINES="-D_HPUX_SOURCE"; export FIXPROTO_DEFINES; \
  mkinstalldirs="/bin/sh ../../gcc/gcc/mkinstalldirs"; \
    export mkinstalldirs; \
  if [ -d /opt/puffin64/hppa2.0-linux/sys-include ] ; then \
    /bin/sh ../../gcc/gcc/fixproto include include /opt/puffin64/hppa2.0-linux/sys-include; \
  else true; fi; \
  touch include/fixed; \
fi
touch stmp-fixproto
echo "void __foo () {}" > dummy.c
/linux/grundler/gcc-build/gcc/xgcc -B/linux/grundler/gcc-build/gcc/ -B/opt/puffin64/hppa2.0-linux/bin/ -I/opt/puffin64/hppa2.0-linux/include -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2  -I./include  -c dummy.c
hppa2.0-linux-ar rc libgcc1.null dummy.o
rm -f dummy.o dummy.c
if [ -f libgcc2.ready ] ; then \
        true; \
else \
        touch libgcc2.ready; \
fi
rm -f lib2funcs.asm
cp ../../gcc/gcc/config/pa/lib2funcs.asm .
case " c proto gcov c++ " in \
*" "[cC]"++ "*) \
  echo tinfo.o tinfo2.o new.o opnew.o opnewnt.o opvnew.o opvnewnt.o opdel.o opdelnt.o opvdel.o opvdelnt.o exception.o > cplib2.new;; \
*) \
  echo "" > cplib2.new;; \
esac
mv -f cplib2.new cplib2.txt 
rm -f tmplibgcc2.a
for name in _muldi3 _divdi3 _moddi3 _udivdi3 _umoddi3 _negdi2 _lshrdi3 _ashldi3 _ashrdi3 _ffsdi2 _udiv_w_sdiv _udivmoddi4 _cmpdi2 _ucmpdi2 _floatdidf _floatdisf _fixunsdfsi _fixunssfsi _fixunsdfdi _fixdfdi _fixunssfdi _fixsfdi _fixxfdi _fixunsxfdi _floatdixf _fixunsxfsi _fixtfdi _fixunstfdi _floatditf __gcc_bcmp _varargs __dummy _eprintf _bb _shtab _clear_cache _trampoline __main _exit _ctors _pure; \
do \
  echo ${name}; \
  /linux/grundler/gcc-build/gcc/xgcc -B/linux/grundler/gcc-build/gcc/ -B/opt/puffin64/hppa2.0-linux/bin/ -I/opt/puffin64/hppa2.0-linux/include -O2  -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -O2  -I./include  -fPIC -g1  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED   -I. -I../../gcc/gcc -I../../gcc/gcc/config -I../../gcc/gcc/../include -c -DL${name} \
       ../../gcc/gcc/libgcc2.c -o ${name}.o; \
  if [ $? -eq 0 ] ; then true; else exit 1; fi; \
  hppa2.0-linux-ar rc tmplibgcc2.a ${name}.o; \
  rm -f ${name}.o; \
done
_muldi3
In file included from tm.h:12,
                 from ../../gcc/gcc/config/pa/xm-linux64.h:41,
                 from tconfig.h:5,
                 from ../../gcc/gcc/libgcc2.c:33:
../../gcc/gcc/config/pa/pa-64.h:173: warning: `USE_CONST_SECTION' redefined
../../gcc/gcc/config/pa/linux.h:66: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:349: warning: `INT_ASM_OP' redefined
../../gcc/gcc/config/svr4.h:424: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:358: warning: `ASM_OUTPUT_CONSTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:621: warning: this is the location of the previous definition
../../gcc/gcc/config/pa/pa-64.h:368: warning: `ASM_OUTPUT_DESTRUCTOR' redefined
../../gcc/gcc/config/svr4.h:631: warning: this is the location of the previous definition
../../gcc/gcc/libgcc2.c:41: stdlib.h: No such file or directory
../../gcc/gcc/libgcc2.c:42: unistd.h: No such file or directory
make[1]: *** [libgcc2.a] Error 1
make[1]: Leaving directory `/linux/grundler/gcc-build/gcc'
make: *** [all-gcc] Error 2
grundler <510>pwd
/linux/grundler/gcc-build
