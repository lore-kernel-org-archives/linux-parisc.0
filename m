Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA14505
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 18:45:41 -0600
Received: from test.webcash.com (adsl-63-202-198-74.dsl.snfc21.pacbell.net [63.202.198.74])
	by galaxy-net.net (8.10.2/8.9.3) with ESMTP id e9Q0h7G81365
	for <parisc-linux@thepuffingroup.com>; Wed, 25 Oct 2000 17:43:07 -0700 (PDT)
Message-Id: <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com>
Date: Wed, 25 Oct 2000 17:45:04 -0700
To: parisc-linux@thepuffingroup.com
From: Kailashnath V Rampure <kailasr@webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] glibc problem
List-ID: <linux-parisc.vger.kernel.org>

Hi

I have upgraded to GNU Make version 3.79.1 but when i run make its is 
giving following error:

Regards
Kailas

hppa-linux-gcc -nostdlib -nostartfiles -r -o /opt/hp/build/glibc/csu/crt1.o 
/opt/hp/build/glibc/csu/start.o /opt/hp/build/glibc/csu/abi-note.o 
/opt/hp/build/glibc/csu/init.o
hppa-linux-gcc -nostdlib -nostartfiles -r -o 
/opt/hp/build/glibc/csu/gcrt1.o /opt/hp/build/glibc/csu/crt1.o 
/opt/hp/build/glibc/csu/gmon-start.o
cp /dev/null /opt/hp/build/glibc/csu/Mcrt1.c
hppa-linux-gcc -O -Wall -Winline -Wstrict-prototypes -Wwrite-strings 
-g      -I../include -I. -I/opt/hp/build/glibc/csu -I.. 
-I../libio  -I/opt/hp/build/glibc -I../sysdeps/hppa/elf 
-I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux 
-I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman 
-I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix 
-I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 
-I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 
-I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa 
-I../sysdeps/ieee754 -I../sysdeps/generic/elf 
-I../sysdeps/generic  -nostdinc -isystem 
/opt/hpboot/lib/gcc-lib/hppa-linux/2.96/include -isystem 
/opt/hp/linux/include  -include 
../include/libc-symbols.h     -DHAVE_INITFINI  -c 
/opt/hp/build/glibc/csu/Mcrt1.c -o /opt/hp/build/glibc/csu/Mcrt1.o
make[2]: *** [/opt/hp/build/glibc/csu/Mcrt1.o] Error 1
make[2]: Leaving directory `/opt/hp/glibc/csu'
make[1]: *** [csu/subdir_lib] Error 2
make[1]: Leaving directory `/opt/hp/glibc'
make: *** [all] Error 2
