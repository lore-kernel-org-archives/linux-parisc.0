Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA29305
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Jul 2000 14:04:17 -0600
From: willy@thepuffingroup.com
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 9 Jul 2000 20:05:46 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id PAA16309
	for parisc-linux@thepuffingroup.com; Sun, 9 Jul 2000 15:00:24 -0400
Date: Sun, 9 Jul 2000 15:00:24 -0400
To: parisc-linux@thepuffingroup.com
Message-ID: <20000709150024.A16294@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] problems with gcc 2.96
List-ID: <linux-parisc.vger.kernel.org>


most people will need to run contrib/gcc_update in order to sort out
dependencies.  i did.  but then i get into:

$ rm -rf *
$ ../gcc/configure --target=hppa1.1-linux --prefix=/home/willy/parisc --host=i386-linux --disable-nls
[...]
/home/willy/parisc/gcc-build/gcc/xgcc -B/home/willy/parisc/gcc-build/gcc/ -B/home/willy/parisc/hppa1.1-linux/bin/ -c -g -O2 -I. -I../../../gcc/libio -D_IO_MTSAFE_IO ../../../gcc/libio/iogetline.c
In file included from ../../../gcc/libio/libio.h:166,
                 from ../../../gcc/libio/iolibio.h:1,
                 from ../../../gcc/libio/libioP.h:47,
                 from ../../../gcc/libio/iogetline.c:26:
/home/willy/parisc/hppa1.1-linux/include/bits/stdio-lock.h:29:2: #error libio needs recursive mutexes for _IO_MTSAFE_IO
make[1]: *** [iogetline.o] Error 1

dhd, you must have solved this already?

-- 
The Sex Pistols were revolutionaries.  The Bay City Rollers weren't.
