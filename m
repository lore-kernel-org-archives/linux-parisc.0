Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C486482A
	for <parisc-linux@parisc-linux.org>; Thu, 30 May 2002 11:23:00 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17DTdb-000700-00
	for <parisc-linux@parisc-linux.org>; Thu, 30 May 2002 19:22:59 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <1022779379.3cf65ff37afdc@webmail.tiscalinet.be>
Date: Thu, 30 May 2002 19:22:59 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] gcc-cvs problem
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

I try to rebuild toolchain on my new b2000 with last binutils-cvs glic-2.2.5
(debian) and last gcc-cvs (aka 3.2?).

The procedure works fine with gcc-cvs dated 20020424 but now it failed on glibc
compile with following message:
/Develop/parisc-linux/parisc-SN32/bin/hppa-linux-gcc
../sysdeps/unix/sysv/linux/init-first.c -c -O2 -Wall -Winline
-Wstrict-prototypes -Wwrite-strings -g      -I../include -I.
-I/Develop/parisc-linux/build/glibc/csu -I.. -I../libio 
-I/Develop/parisc-linux/build/glibc -I../sysdeps/hppa/elf
-I../linuxthreads/sysdeps/unix/sysv/linux/hppa
-I../linuxthreads/sysdeps/unix/sysv/linux -I../linuxthreads/sysdeps/pthread
-I../sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv
-I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa
-I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu
-I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet
-I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix
-I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32
-I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu
-I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf
-I../sysdeps/generic  -nostdinc -isystem
/Develop/parisc-linux/parisc-SN32/lib/gcc-lib/hppa-linux/3.2/include -isystem
/Develop/parisc-linux/src/linux/include -D_LIBC_REENTRANT -include
../include/libc-symbols.h     -DHAVE_INITFINI -o
/Develop/parisc-linux/build/glibc/csu/init-first.o
In file included from ../include/pthread.h:1,
                 from ../linuxthreads/sysdeps/pthread/bits/libc-lock.h:23,
                 from ../sysdeps/generic/ldsodefs.h:34,
                 from ../sysdeps/unix/sysv/linux/ldsodefs.h:25,
                 from ../sysdeps/unix/sysv/linux/init-first.c:32:
../linuxthreads/sysdeps/pthread/pthread.h:163: parse error before "__thread"
../linuxthreads/sysdeps/pthread/pthread.h:165: `pthread_create' declared as
function returning a function
../linuxthreads/sysdeps/pthread/pthread.h:165: warning: function declaration
isn't a prototype
../linuxthreads/sysdeps/pthread/pthread.h:166: parse error before "void"
../linuxthreads/sysdeps/pthread/pthread.h:591: storage class specified for
parameter `type name'
In file included from ../linuxthreads/sysdeps/pthread/pthread.h:655,
                 from ../include/pthread.h:1,
                 from ../linuxthreads/sysdeps/pthread/bits/libc-lock.h:23,
                 from ../sysdeps/generic/ldsodefs.h:34,
                 from ../sysdeps/unix/sysv/linux/ldsodefs.h:25,
                 from ../sysdeps/unix/sysv/linux/init-first.c:32:
../linuxthreads/sysdeps/unix/sysv/linux/bits/sigthread.h:36: storage class
specified for parameter `type name'
make[2]: *** [/Develop/parisc-linux/build/glibc/csu/init-first.o] Error 1
make[2]: Leaving directory `/Develop/parisc-linux/src/glibc/csu'
make[1]: *** [csu/subdir_lib] Error 2
make[1]: Leaving directory `/Develop/parisc-linux/src/glibc'
make: *** [all] Error 2

### Thu May 30 19:04:35 2002 ###

Any idea?

Joel

ps: glibc tree was prepare in accordance with Carlos howto.

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
