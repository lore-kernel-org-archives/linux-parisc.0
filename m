Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA14139
	for <parisc-linux@puffin.external.hp.com>; Fri, 4 Feb 2000 22:20:19 -0700
Received: from localhost (mang@localhost) by cuzea.pair.com (8.9.1/8.6.12) with ESMTP id XAA09649 for <parisc-linux@thepuffingroup.com>; Fri, 4 Feb 2000 23:17:33 -0500 (EST)
Date: Fri, 4 Feb 2000 23:17:33 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSF.4.10.10002042255350.8742-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] State Of The Port
List-ID: <linux-parisc.vger.kernel.org>


Here are Grant's notes from today's meeting with a few annotations:
---
Attendees (in no particular order):
        Mike Ang
        Thomas Bogendorf
        Mathew Wilcox
        Grant Grundler
        Martin Petersen
	plus some lurkers

Tulip/Networking We're still having a problem with media selection and
interrupts on A180, and endianness problems on 21140 chipset PCI cards.
Fleedwood made good progress with a pcnet32 card with endian clean driver,
exposing bugs in the tcp checksum code which have been largely fixed.

Thomas Bogendorf will be getting tulip working very soon.
    Expects to have it working by this weekend. Lack of endianess
    support is the main problem.  2.2.14 is the "latest" tulip.c
    but has no big endian support.

Mike Ang will send the outputs of the tulip diagnostic program in
cvsroot:/userspace/ktulip-diag.c to Donald Becker for help.


SuperIO serial

SuperIO serial support is required to get userland serial console working
on C3000.

Martin Petersen looked at data sheet and it's way too complicated.
Grant Grundler: I think the various components have to share IRQ lines.
        Since this bugger is 3 PCI functions and only function 1 (or 2)
        has the IRQ line, it gets a bit messy.

        I think we also need to get some specifics on how firmware
        *reports* those devices. I helped set some of that up for HP-UX
        but that was over a year ago.
        IIRC, the function 0 gets advertised first to HP-UX but it's
        interrupt comes through function 1. So the driver for function 0
        has to poke registers on function 1.

Grant - will check if anyone in HP is interested in making this work.
Mike volunteered to start looking at it on Monday (2/7/2000).


Interrupts on C3000
Grant Still working on it.
Fleed is still having/had trouble with card-mode dino.
    dino.c.ilr data page faulted. Grant will look at this
    after spending some more time on C3k problems.

Willy mentioned that we will have to think about running on 64bit at some
point.


Short term goals (roughly in order)
- serial console input and output
- networking
- nfs root filesystem
- scsi support
