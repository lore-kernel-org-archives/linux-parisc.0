Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA32263
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 16:05:32 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 3 Oct 2000 22:06:24 -0000
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 03 Oct 2000 18:06:16 -0400
Message-ID: <87aecl60mf.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc 2.1.94 CVS merge, packages on the way, ABI breakage :(
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've merged pehc CVS with glibc 2.1.94 release (no more tracking CVS
for me, too much pain).

The patch is clean enough that I'm able to just add it to the Debian
glibc 2.1.94 source package.  So I will build that overnight
(hopefully) and upload it sometime soon.

For the time being there is a tarball at
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/glibc-2.1.94-20001003.tar.gz

But!  Beware!  It *will* break your system.  Somehow, the versions of
a bunch of symbols in libm.so.6 reverted to GLIBC_2.0 from GLIBC_2.2
(don't ask me how this happened, math/Versions is still exactly the
same...  I think our 2.1.92 had a bug in the script that generates the
version maps) and as a result, anything that links with libm will not
work.  This includes fun things like perl, awk, some parts of
shellutils, etc. etc.

Sorry about this, but I guess we have no choice, our old libm.so was
broken.

I'm rebuilding perl, shellutils, and awk and expect to have new
packages on pehc real soon now.  (perl's version will be 5.005.03-7.2,
shellutils and awk will be similarly bumped)

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
