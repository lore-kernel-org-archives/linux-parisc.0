Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA31786
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Feb 2000 16:34:07 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id RAA23158
	for parisc-linux@thepuffingroup.com; Mon, 21 Feb 2000 17:34:52 -0500
Date: Mon, 21 Feb 2000 17:34:52 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000221173452.C9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] libgcc
List-ID: <linux-parisc.vger.kernel.org>


I've committed some changes which should allow gcc to build libgcc.a.
Compilation stops when trying to test libgcc:

Testing libgcc1.  Ignore linker warning messages.
/mnt/home/willy/cvs/gcc-build/gcc/xgcc -B/mnt/home/willy/cvs/gcc-build/gcc/ -B/home/willy/gcc/hppa1.1-linux/bin/ -I/home/willy/gcc/hppa1.1-linux/include -DCROSS_COMPILE -DIN_GCC  -DMULTIBYTE_CHARS=1   -g -O2  -I./include  libgcc1-test.o -o libgcc1-test \
  -nostartfiles -nostdlib `/mnt/home/willy/cvs/gcc-build/gcc/xgcc -B/mnt/home/willy/cvs/gcc-build/gcc/ -B/home/willy/gcc/hppa1.1-linux/bin/ -I/home/willy/gcc/hppa1.1-linux/include --print-libgcc-file-name`
libgcc1-test.o: In function `main_without__main':
/mnt/home/willy/cvs/gcc-build/gcc/../../gcc/gcc/libgcc1-test.c:20: undefined reference to `$global$'
collect2: ld returned 1 exit status

I don't see $global$ defined anywhere.  Is this something which ld should
be fixing-up and isn't?
