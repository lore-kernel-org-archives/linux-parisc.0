Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22BBC482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 17:46:20 -0600 (MDT)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16074.48509.259405.775905@gargle.gargle.HOWL>
Date: Wed, 21 May 2003 01:42:53 +0200
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Cc: debian-gcc@lists.debian.org, m68k-build@nocrew.org
Subject: [parisc-linux] gcc-3.3 configuration
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

For Debian GNU/Linux gcc-3.3 is currently configured with

	--with-sjlj-exceptions

to allow a binary compatible upgrade from gcc-3.2 to gcc-3.3. The
other Debian platform, where sjlj based exceptions changed to dwarf2
based exceptions is m68k, therefore the CC.

As there are no hppa/m68k distributions released using gcc-3.2,
compatibility with other released distros is not an issue. OTOH, I see
Gentoo and probably other distros built for hppa, first starting with
gcc-3.3, and maybe configured the standard way.

Is it worth (or needed) to strive for binary compatibility of hppa
based distributions, based on gcc-3.3 and glibc-2.3.x?

If yes, does the following approach work: Build a libstdc++5-3.3,
conflicting with libstdc++5 (including libstdc++ with the same soname)
and doing binary uploads for hppa for all libstdc++5 dependent
packages? (The same could be done for m68k, but the compatibility
argument doesn't hold as Debian seems to be the only m68k based
distro).

	Matthias
