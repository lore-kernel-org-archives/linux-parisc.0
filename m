Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA27373
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 11:32:12 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 27 Nov 2000 18:34:21 -0000
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 140T6e-0003Rc-00
	for parisc-linux@thepuffingroup.com; Mon, 27 Nov 2000 18:34:24 +0000
To: parisc-linux@thepuffingroup.com
Date: Mon, 27 Nov 2000 18:34:23 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E140T6e-0003Rc-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] gcc crashes/out of memory and groff
List-ID: <linux-parisc.vger.kernel.org>

With groff -fno-gcse does not help but -O0 does. Without -O0 you get an
internal error.

g++ -I. -I/usr/src/redhat/BUILD/groff-1.16/src/roff/troff -I/usr/src/redhat/BUILD/groff-1.16/src/include -I/usr/src/redhat/BUILD/groff-1.16/src/include -DHAVE_UNISTD_H=1 -DHAVE_DIRENT_H=1 -DHAVE_LIMITS_H=1 -DHAVE_SYS_DIR_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRINGS_H=1 -DSTDLIB_H_DECLARES_PUTENV=1 -DSTDIO_H_DECLARES_POPEN=1 -DSTDIO_H_DECLARES_PCLOSE=1 -DHAVE_SYS_NERR=1 -DHAVE_SYS_ERRLIST=1 -DHAVE_CC_LIMITS_H=1 -DRETSIGTYPE=void -DHAVE_STRUCT_EXCEPTION=1 -DHAVE_UNISTD_H=1 -DHAVE_GETPAGESIZE=1 -DHAVE_MMAP=1 -DHAVE_FMOD=1 -DHAVE_STRTOL=1 -DHAVE_GETCWD=1 -DHAVE_STRERROR=1 -DHAVE_PUTENV=1 -DHAVE_RENAME=1 -DHAVE_MKSTEMP=1 -DHAVE_STRCASECMP=1 -DHAVE_STRSEP=1 -DHAVE_STRDUP=1 -DSYS_SIGLIST_DECLARED=1  -O2 -mpa-risc-1-0 -fno-gcse  -c env.cc
env.cc: In member function `void environment::output_line (node *, hunits)':
env.cc:1582: Internal error: Segmentation fault.
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [env.o] Error 1
make[2]: Leaving directory `/usr/src/redhat/BUILD/groff-1.16/src/roff/troff'


Alan
