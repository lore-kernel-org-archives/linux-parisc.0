Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA15664
	for <parisc-linux@puffin.external.hp.com>; Sun, 12 Mar 2000 08:23:37 -0700
Received: (from prumpf@localhost)
	by inwestnet.de (8.9.3/8.9.3) id PAA04051
	for parisc-linux@thepuffingroup.com; Sun, 12 Mar 2000 15:24:54 +0100
Date: Sun, 12 Mar 2000 15:23:53 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000312152353.E5281@abacus.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Assembly Language Changes
List-ID: <linux-parisc.vger.kernel.org>

Hello,
over the last few days or so, I have been trying to get glibc to build and
work for a Linux/PA-RISC target.  I came to believe it would be simpler to
change certain aspects of the assembly language used than to keep working
around them:

 - Labels should always use ':'
 - mnemonics in the first column should be interpreted normally.
 - register names should always start with '%', not be specified by an
   integer
 - where pa2.0 and pa1.1 differ in opcode names aso, the pa2.0 version
   should be used ("b,l" rather than "bl")
 - ';' should be used rather than '!' to separate multiple statements
   on the same line
 - possibly there should be a line comment character to replace ';' ?

The advantages to changing the assembly dialect we use are that using cpp
to pre-process assembly instructions becomes a lot simpler (glibc makes
heavy use of this);  the assembly language looks more similar to those
used for other architectures that run Linux;  there is no difference
between the pa1.1 and pa2.0 versions.

The disadvantage, obviously, is that we would need to keep separate
binaries around to compile HP/UX assembly source;  also, the assembly
files used by the kernel would need to be converted (and probably get
readable to more people in the process).

The actual work to implement the changes should be pretty low, and I'm
more than willing to do it (and actually already implemented the most
important (to me) changes).

	Philipp Rumpf
