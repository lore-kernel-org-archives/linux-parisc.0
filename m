Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A8AD4890
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 01:00:28 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali) id 1BBTWV-0004jO-00
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 08 Apr 2004 09:00:27 +0200
Date: Thu, 8 Apr 2004 09:00:27 +0200
Message-ID: <40711E550000264D@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] deb gcc_snapshot 2004 04 04 & glibc 2.3.3 cvs 2004
	04 05 pb?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

Continuing investigation on gcc >3.3 pb with glibc 2.3.3 (+ Carlos patches),
I started to rebuild toolchain as usual but with new dpkg gcc-snapshot_20040404
src and the same glibc src taht I used to test with gcc-3.3 with success.

But I encounter a new pb with this new gcc release:
[...]
mv -f /CAD/parisc-linux/build/glibc/shlib.ldsT /CAD/parisc-linux/build/glibc/shlib.lds
/CAD/parisc-linux/xc/bin/hppa-linux-gcc   -shared -static-libgcc -Wl,-O1
 -Wl,-z,defs -Wl,-dynamic-linker=/opt/palinux-3.4.0/hppa-linux/lib/ld.so.1
 -B/CAD/parisc-linux/build/glibc/csu/  -Wl,--version-script=/CAD/parisc-linux/build/glibc/libc.map
-Wl,-soname=libc.so.6  -nostdlib -nostartfiles -e __libc_main -L/CAD/parisc-linux/build/glibc
-L/CAD/parisc-linux/build/glibc/math -L/CAD/parisc-linux/build/glibc/elf
-L/CAD/parisc-linux/build/glibc/dlfcn -L/CAD/parisc-linux/build/glibc/nss
-L/CAD/parisc-linux/build/glibc/nis -L/CAD/parisc-linux/build/glibc/rt -L/CAD/parisc-linux/build/glibc/resolv
-L/CAD/parisc-linux/build/glibc/crypt -L/CAD/parisc-linux/build/glibc/linuxthreads
-Wl,-rpath-link=/CAD/parisc-linux/build/glibc:/CAD/parisc-linux/build/glibc/math:/CAD/parisc-linux/build/glibc/elf:/CAD/parisc-linux/build/glibc/dlfcn:/CAD/parisc-linux/build/glibc/nss:/CAD/parisc-linux/build/glibc/nis:/CAD/parisc-linux/build/glibc/rt:
/CAD/parisc-linux/build/glibc/resolv:/CAD/parisc-linux/build/glibc/crypt:/CAD/parisc-linux/build/glibc/linuxthreads
-o /CAD/parisc-linux/build/glibc/libc.so -T /CAD/parisc-linux/build/glibc/shlib.lds
/CAD/parisc-linux/build/glibc/csu/abi-note.o /CAD/parisc-linux/build/glibc/elf/soinit.os
/CAD/parisc-linux/build/glibc/libc_pic.os /CAD/parisc-linux/build/glibc/elf/sofini.os
/CAD/parisc-linux/build/glibc/elf/interp.os /CAD/parisc-linux/build/glibc/elf/ld.so
-lgcc -lgcc_eh
/CAD/parisc-linux/xc/lib/gcc/hppa-linux/3.4.0/../../../../hppa-linux/bin/ld:
cannot find -lgcc_eh
collect2: ld returned 1 exit status
make[1]: *** [/CAD/parisc-linux/build/glibc/libc.so] Error 1
make[1]: Leaving directory `/CAD/parisc-linux/sources/glibc-2.3.3-20040405'
make: *** [all] Error 2

### Wed Apr  7 11:06:37 2004 ###

with previous gcc_snapshot no such a pb (and the procedure a ruby script
is exactly the same) and gcc-3.3 don't need libgcc_eh?

Thanks in advance for adivse,
    Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
