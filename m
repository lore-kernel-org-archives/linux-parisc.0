Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA09737
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Aug 2000 07:59:46 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 17 Aug 2000 08:00:08 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA09905;
	Thu, 17 Aug 2000 17:59:49 +1000
Date: Thu, 17 Aug 2000 17:59:48 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: libc-alpha@sources.redhat.com
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Message-ID: <Pine.LNX.4.21.0008171700460.28670-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] hppa glibc ld -r
List-ID: <linux-parisc.vger.kernel.org>

Hello glibc experts,
  I've hit a snag trying to build a shared hppa glibc with my latest
linker, and I think the only solution is to get rid of the "ld -r" stage
in building glibc.

For those on the list reading this not familiar with the details of
elf32-hppa linking:  PA has a limited range for pc-relative branches, and
the linker needs to insert long branch stubs to reach far off locations.
Long branch stubs (and other stub types) are placed in a special stub
section preceding every linker input section.  If input sections are too
big, we can't even reach the stubs, so using gcc -ffunction-sections helps
to stop "ld -r" packing all the code into one huge .text section.

-ffunction-sections isn't a complete solution though.  If two source files
declare a local function of the same name, "setup", for instance, then
both files will have a section called ".text.setup".  These two sections
will be merged during the "ld -r", which has the unfortunate effect of
moving a local function to a location a long way off from where it's
called.  That's bad, firstly because it means we now need a stub to reach
the function, but more importantly the stubs are not PIC and thus need
relocation information when creating shared libraries.  In particular, for
reasons too complicated to explain here, I don't want to create stubs for
local functions;  It would mean emitting relocs for every *potential*
stub.

Anybody know why glibc uses "ld -r", and if there is a good reason why
we can't just remove the "ld -r"?

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
