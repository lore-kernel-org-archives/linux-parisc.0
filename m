Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03990
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Nov 2000 13:54:38 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 25 Nov 2000 20:56:57 -0000
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 13zmNf-0001KK-00
	for parisc-linux@thepuffingroup.com; Sat, 25 Nov 2000 20:57:07 +0000
To: parisc-linux@thepuffingroup.com
Date: Sat, 25 Nov 2000 20:57:05 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E13zmNf-0001KK-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] RPM and hppa
List-ID: <linux-parisc.vger.kernel.org>

I've uploaded my first block of RPM packages to 
ftp.linux.org.uk/pub/linux/alan/HPPA along with a tar ball of built RPM 
tools for anyone who wants to play.

In doing so I've hit a few problems with the 0.5 iso (no suprises there since
its not actually meant to work reliably)

- g++ explodes trying to build groff after allocating about 400Mb of RAM.
  Building -O0 works

- the configure script for procmail tries to find the largest argument set
  that works (by searching). It crashes the kernel in doing so 8)

- ldd is causing page faults in ld.so (kernel logged ones) and dying with
  segv. Fortunately it outputs the library list first

- The linker appears to have a problem when resolving symbols between three
  shared objects while doing a shared object link.

  [Example is rpm:

	rpmlib is linked dynamically with -ldb3 -ldb

	The linker emits messages about symbols being static and should be
	built -fPIC. If you dump the libraries they are -fPIC.

	It looks as if its resolving a symbol between two shared libraries
	and making a static resolution that then blows up when the third
	library gets involved

   ]

- The kernel shows occasional page cache corruption. This actually is quite
  possibly generic test6 bugs


On the whole the toolset is working remarkably well. I've built over 100 
source package sets so far including things like ncurses and most stuff just
builds or hits portability problems (eg gmp wants to use HP format asm, 
zlib wants to be a non PIC library for performance but the HP tools dont allow
it)

Alan
