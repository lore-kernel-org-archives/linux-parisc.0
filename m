Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 114DC4840
	for <parisc-linux@parisc-linux.org>; Wed, 26 Nov 2003 02:23:49 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 1AOvtj-0004ih-00
	for <parisc-linux@parisc-linux.org>; Wed, 26 Nov 2003 10:23:47 +0100
Date: Wed, 26 Nov 2003 10:23:45 +0100
Message-ID: <3FB2652500007F03@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] gcc-3.3.2 - 64bit failled to build?
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

Hi all,

I am trying to rebuild gcc-3.3.2 64bits following Carlos build xc howto.

I am using gcc-3.3.2-4 debian pkg src; after the extraction of src with 'dpkg-source
-x gcc-3.3_3.3.2ds5-4.dsc', then in src tree apply debian patches (and get
the actual src by the way).

The build of the tool chain 32bit works fine as well as binutils 64bits but
the build of the patial gcc 64bit (let say kgcc) with following configure
options (the same as 32bit but the target 64bits):
../src/configure --target=hppa64-linux --host=hppa-linux --prefix=/opt/parisc
--disable-shared --disable-nls --without-libc --enable-langages=c

failled with messages:

/Develop/parisc-linux/build/gcc/gcc/xgcc -B/Develop/parisc-linux/build/gcc/gcc/
-B/opt/palinux/hppa64-linux/bin/ -B/opt/palinux/hppa64-linux/lib/ -isystem
/opt/palinux/hppa64-linux/include -O2  -DIN_GCC -DCROSS_COMPILE   -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -isystem ./include
 -fPIC -Dpa64=1 -DELF=1 -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED
-Dinhibit_libc -I. -I. -I/Develop/parisc-linux/sources/gcc/gcc -I/Develop/parisc-linux/sources/gcc/gcc/.
-I/Develop/parisc-linux/sources/gcc/gcc/config -I/Develop/parisc-linux/sources/gcc/gcc/../include
-fexceptions -c /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c -o libgcc/./unwind-dw2.o
In file included from /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c:26:
/Develop/parisc-linux/sources/gcc/gcc/unwind-pe.h: In function `size_of_encoded_value':
/Develop/parisc-linux/sources/gcc/gcc/unwind-pe.h:76: warning: implicit declaration
of function `abort'
In file included from gthr-default.h:1,
                 from /Develop/parisc-linux/sources/gcc/gcc/gthr.h:98,
                 from /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c:28:
/Develop/parisc-linux/sources/gcc/gcc/gthr-posix.h:37:21: pthread.h: No such
file or directory
/Develop/parisc-linux/sources/gcc/gcc/gthr-posix.h:38:20: unistd.h: No such
file or directory
In file included from gthr-default.h:1,
                 from /Develop/parisc-linux/sources/gcc/gcc/gthr.h:98,
                 from /Develop/parisc-linux/sources/gcc/gcc/unwind-dw2.c:28:
[blabla]

even thought i use --without-libc it seems to look for glibc header: pthread.h
& unistd.h?

Any idea?

Thanks,
    Joel

PS: still interesting to fix it in 3.3.2 or better use 3.4?

 

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
