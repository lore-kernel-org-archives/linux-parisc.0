Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39B774829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 17:47:56 -0600 (MDT)
Received: from carlos by systemhalted with local (Exim 3.35 #1 (Debian))
	id 17m0vA-0001mW-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 02 Sep 2002 19:47:52 -0400
Date: Mon, 2 Sep 2002 19:47:52 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020902234752.GA6718@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Status update hppa - glibc 2.2.92 (Problems with __divdi3)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

p-l,

I've already posted the same thing on debian-glibc.

a. 'cvs co' from glibc upstream cvs (2.2.92)
b. Apply debian patches from 0list
c. Fix things

Preliminary modified patches for hppa are at:
http://www.baldric.uwo.ca/~carlos/glibc-2.3/glibc23-hppa-pthreads.dpatch
http://www.baldric.uwo.ca/~carlos/glibc-2.3/glibc23-hppa-rela.dpatch

These replace the previous glibc22-* patches of the same name.

Please do _NOT_ accept these as final versions, I'm presenting them
for anyone who may want to attempt to recreate or verify my problem.

Current build issues are:

gcc-3.2 -nostdlib -nostartfiles -o /mnt/flaire/src/glibc-upstream-cvs/libc-=
build/iconv/iconvconfig  -Wl,-dynamic-linker=3D/lib/ld.so.1    /mnt/flaire/=
src/glibc-upstream-cvs/libc-build/csu/crt1.o /mnt/flaire/src/glibc-upstream=
-cvs/libc-build/csu/crti.o `gcc-3.2 --print-file-name=3Dcrtbegin.o` /mnt/fl=
aire/src/glibc-upstream-cvs/libc-build/iconv/iconvconfig.o /mnt/flaire/src/=
glibc-upstream-cvs/libc-build/iconv/strtab.o /mnt/flaire/src/glibc-upstream=
-cvs/libc-build/iconv/xmalloc.o  -Wl,-rpath-link=3D/mnt/flaire/src/glibc-up=
stream-cvs/libc-build:/mnt/flaire/src/glibc-upstream-cvs/libc-build/math:/m=
nt/flaire/src/glibc-upstream-cvs/libc-build/elf:/mnt/flaire/src/glibc-upstr=
eam-cvs/libc-build/dlfcn:/mnt/flaire/src/glibc-upstream-cvs/libc-build/nss:=
/mnt/flaire/src/glibc-upstream-cvs/libc-build/nis:/mnt/flaire/src/glibc-ups=
tream-cvs/libc-build/rt:/mnt/flaire/src/glibc-upstream-cvs/libc-build/resol=
v:/mnt/flaire/src/glibc-upstream-cvs/libc-build/crypt:/mnt/flaire/src/glibc=
-upstream-cvs/libc-build/linuxthreads /mnt/flaire/src/glibc-upstream-cvs/li=
bc-build/libc.so.6 /mnt/flaire/src/glibc-upstream-cvs/libc-build/libc_nonsh=
ared.a -lgcc `gcc-3.2 --print-file-name=3Dcrtend.o` /mnt/flaire/src/glibc-u=
pstream-cvs/libc-build/csu/crtn.o
/mnt/flaire/src/glibc-upstream-cvs/libc-build/libc.so.6: undefined referenc=
e to `__divdi3_internal'
collect2: ld returned 1 exit status
make[2]: *** [/mnt/flaire/src/glibc-upstream-cvs/libc-build/iconv/iconvconf=
ig] Error 1
make[2]: Leaving directory `/mnt/flaire/src/glibc-upstream-cvs/libc/iconv'
make[1]: *** [iconv/others] Error 2
make[1]: Leaving directory `/mnt/flaire/src/glibc-upstream-cvs/libc'
make: *** [all] Error 2

I have _no_ idea what is going on here, I have to begin digging at:

http://sources.redhat.com/ml/glibc-cvs/2002-q3/msg00325.html (Shows the che=
ckin)

libc/sysdeps/wordsize-32/lldiv.c shows:
     24 #ifdef SHARED
     25 /* This is an ugly trick.  We cause the C code generated for the co=
de
     26    in lldiv.c to use __divdi3_internal instead of __divdi3 by defin=
ing
     27    an alias on the assembler level.  */
     28 asm ("__divdi3 =3D __divdi3_internal");
     29 #endif

objdump -t /mnt/flaire/src/glibc-upstream-cvs/libc-build/libc.so.6 | grep d=
ivdi3
001173d4 l     F .text  00000028              __udivdi3
00000000         *UND*  00000000              __divdi3_internal

It's clearly not there :}

If anyone understands... a hint would be most helpful=20

Cheers,
c.
