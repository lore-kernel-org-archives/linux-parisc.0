Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA09216
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 09:59:09 -0600
Received: from vorlon.osfi-bsif.gc.ca ([198.103.137.200] helo=centauri.osfi-bsif.gc.ca)
	by mail1.toronto.istar.net with esmtp (Exim 2.02 #1)
	id 10oqwP-0006ni-00
	for parisc-linux@thepuffingroup.com; Tue, 1 Jun 1999 11:59:02 -0400
Date: Tue, 1 Jun 1999 11:58:57 -0400 (EDT)
From: Christopher Beard <cjbeard@istar.ca>
To: parisc-linux@thepuffingroup.com
Subject: Re: Building the Bootloader
Message-ID: <Pine.LNX.4.10.9906011146400.24972-100000@centauri.osfi-bsif.gc.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


> Hm.  Okay then.  So what we need to do is fix the cross compiling of
> mkipl.  I'll have a look at this.
          
There is some confusion here. The IPL does not have to be SOM, in fact, it
wouldn't work correctly if it was. It's a raw binary format created using
HP's linker by passing parameters to give it a zero offset, etc. (And
which Jason Eckardt suggests could also be extracted from a valid ELF
format binary given the right script.)

The confusion exists as currently, it can only be produced under HP/UX as
there are still some issues with the xcompiler/binutils under x86 for the
PA-RISC target. 

I haven't looked at this very closely, but when I attempted to generate a
raw binary of the bootloader code with the xcompiler/binutils it either
segfaulted or generated a 4 GB sparse file. There was a double free within
binutils which was fixed, and some minor version mismatches, but still, it
does not generate a working binary.

Before even trying to compile the kernel and getting it booting with the
current xcompiler/binutils, building a working IPL with the xcompiler
environment should be done.  This will tell us that yes in fact it is
doing the Right Thing and it will be far easier to debug. 

Chris
