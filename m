Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA03759
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jun 2000 16:42:58 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m12y05x-001VscC@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Fri, 2 Jun 2000 16:39:13 -0600 (MDT)
Message-Id: <m12y05x-001VscC@chalet>
From: bame@puffin.external.hp.com
Reply-To: bame@puffin.external.hp.com
Errors-To: bame@puffin.external.hp.com
To: parisc-linux@thepuffingroup.com
Date: Fri, 02 Jun 2000 16:39:12 -0600
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] New glibc and new linker SEGV
List-ID: <linux-parisc.vger.kernel.org>


I mergeed our glibc with June 1 sources from sourceware.cygnus.com
and it appears to be pretty healthy so I'm committing it.  FYI the
CVS e-mail message is truncated because after 30 minutes of CPU time
I got tired of waiting for the damn perl script and killed it :->

However the glibc build needs to be faked out a bit because the latest
(otherwise pretty darn good) linker is dying inside the glibc build
with:

    hppa1.1-linux-gcc -nostdlib -nostartfiles -o locale/localedef [...]
    collect2: ld terminated with signal 11 [Segmentation fault], core dumped
    make[2]: *** [/work/xc-build/build-glibc/locale/localedef] Error 1

Since these glibc-built executables aren't being used yet, I fake out
the build by doing "cp /bin/date locale/localedef", then run make again,
copy /bin/date over the next failed link target, repeat until the make
succeeds.

Oh, and if you see
    test ! -d CVS || cvs commit -m'Regenerated from ../sysdeps/gnu/errlist.awk ../manual/errno.texi' ../sysdeps/gnu/errlist.c
    Permission denied
just restart the make :-(

I updated the pre-built toolchain for Debian potato x86 at
ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/elf32x86.tar.gz

		-Paul Bame
