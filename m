Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA27412
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Sep 2000 15:52:35 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 28 Sep 2000 21:53:19 -0000
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 28 Sep 2000 17:53:04 -0400
Message-ID: <87wvfwnpz3.fsf@ottawa.linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New, Bug Free [tm] gcc and binutils packages
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've just uploaded source and binary packages of gcc, g++, cpp, and
libstdc++ to puffin.external.hp.com.  See
ftp://puffin.external.hp.com/pub/debian-hppa/ and
ftp://puffin.external.hp.com/pub/debian-hppa-source/

This is basically egcs 20000925 snapshot with the PA-RISC patches
applied.  It compiles itself (as far as I can tell - I've been
shortcutting a bit since the A180 is so horribly slow) and should now
manage to bootstrap itself; the previous version we had been using
miscompiled fold-const.c when not optimizing, as is the case when
building the initial bootstrap compiler (but not when cross-building
or building with simply 'make' rather than 'make bootstrap'...)

In order to bootstrap you must have the new compiler installed,
because the old one (20000822) will break as mentioned above.

There are also source packages of the latest binutils CVS source,
which I'll native build eventually (as mentioned above the A180 is
slow as molasses and I'm currently testing GCC bootstrap).  Alan:
would it be okay to check the Debian packaging stuff into our binutils
CVS?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
