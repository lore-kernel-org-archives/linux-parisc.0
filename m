Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA07126
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Sep 2000 18:16:31 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 17 Sep 2000 00:17:03 -0000
To: parisc-linux@thepuffingroup.com
Cc: debian-hppa@lists.debian.org
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 16 Sep 2000 20:16:40 -0400
Message-ID: <87n1h7j2jb.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New native toolchain and glibc tarballs, upgrade
List-ID: <linux-parisc.vger.kernel.org>

There are new 20000916 gcc, binutils, and glibc tarballs on the FTP
site (puffin.external.hp.com:/pub/parisc/binaries/userspace).
Upgrading glibc, at least, is highly recommended as this one fixes a
stupid bug that was preventing initializers in shared libraries from
being run (and thus made apt-get crash, which it doesn't anymore).

You'll also notice that binutils got smaller (because it now uses
shared libbfd and libopcodes) and GCC got larger (because it now has a
shared libstdc++.so).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
