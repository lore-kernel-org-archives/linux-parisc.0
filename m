Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA07969
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Feb 2000 02:09:10 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id DAA16101
	for parisc-linux@thepuffingroup.com; Tue, 15 Feb 2000 03:09:46 -0500
Date: Tue, 15 Feb 2000 03:09:46 -0500
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] new binutils/gcc
Message-ID: <20000215030946.V9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


ok, I couldn't wait till tomorrow..

You'll need an include directory.  You can either do it the way I did
(pick them out of glibc, one at a time), or you can get a tarball of
the fruits of my labour:

ftp://puffin.external.hp.com/pub/parisc/src/include.tar.gz

Plop this into your $prefix after installing binutils.  ie this was the
contents of /home/willy/gcc/include.  Now you need to persuade gcc to look
there for it (I thought it was supposed to do that automatically, but it seems
not).  Change line 370 of gcc-build/gcc/Makefile to read:

LIBGCC2_INCLUDES = -I/home/willy/gcc/include

and then type make.  Now I get to :

Testing libgcc1.  Ignore linker warning messages.
/home/willy/cvs/gcc-build/gcc/xgcc -B/home/willy/cvs/gcc-build/gcc/ \
	-B/home/willy/gcc/hppa1.1-linux/bin/ \
	-I/home/willy/gcc/hppa1.1-linux/include -DCROSS_COMPILE -DIN_GCC \
	-DMULTIBYTE_CHARS=1   -g -O2  -I./include  libgcc1-test.o \
	-o libgcc1-test \
  -nostartfiles -nostdlib `/home/willy/cvs/gcc-build/gcc/xgcc \
	-B/home/willy/cvs/gcc-build/gcc/ -B/home/willy/gcc/hppa1.1-linux/bin/ \
	-I/home/willy/gcc/hppa1.1-linux/include --print-libgcc-file-name`
/home/willy/gcc/hppa1.1-linux/bin/ld: can not size stub section: Bad value
libgcc1-test.o: In function `main_without__main':
/home/willy/cvs/gcc-build/gcc/../../gcc/gcc/libgcc1-test.c:20: undefined reference to `$$divI'
/home/willy/cvs/gcc-build/gcc/../../gcc/gcc/libgcc1-test.c:14: undefined reference to `$global$'
death: $$divI type 1
collect2: ld returned 1 exit status
make[1]: *** [libgcc1-test] Error 1

(wrapped for better mailer handling)

And with that I really am going to bed.  g'night.
