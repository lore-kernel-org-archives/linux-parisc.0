Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bastion.qld.csiro.au (bastion.qld.csiro.au [140.253.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id D79BE482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 16:11:56 -0600 (MDT)
Received: from bastion.qld.csiro.au (localhost [127.0.0.1])
	by bastion.qld.csiro.au (8.9.3/8.9.3) with ESMTP id IAA17951
	for <parisc-linux@lists.parisc-linux.org>; Thu, 5 Apr 2001 08:11:54 +1000 (EST)
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by bastion.qld.csiro.au (8.9.3/8.9.3) with ESMTP id IAA17947
	for <parisc-linux@lists.parisc-linux.org>; Thu, 5 Apr 2001 08:11:53 +1000 (EST)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D514459EE@ntexchange.cat.csiro.au>
From: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Cc: "Cooper, Steven (DEM, PH)" <Steven.Cooper@dem.csiro.au>
Subject: RE: [parisc-linux] Getting Started...
Date: Thu, 5 Apr 2001 08:11:51 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> 
> I'm not using PA-RISC Linux, yet, but I hope to be soon.  I'm 
> been using
> ix86 linux for a few years, and HP-UX for 15 years.  I deal with 700
> series hardware everyday at work, mostly 715s, 725s, and 745s.
> 
> } I have recently "acquired" a couple of old 735/xxx's, and I 
> wish to run
> } Linux on these.
> } 
> } * These boxes seem to have no indication whether they are 
> 735/125 or 735/99
> } - how do I find out which they are?
> 
> If they aren't labeled as "735/125" or "735/99" they should be 100MHz.

Yes, I believe they are 735/99s. They're not the fastest machines around,
but as far as price/performance goes, you can't beat a slow free computer...

> 
> 
> } * I don't know how much memory they have, how do I find 
> this out? They have
> } maybe half of the memory expansion slots filled.
> 
> The boot screen should print the memory amount almost first 
> thing.  The
> 735s use different ram than all the other 700s, so I don't 
> know the part
> numbers.  If you tell me I might be able to check 
> (A2575-60001 is a 32MB
> card for the other 700s, look for that kind of a number).
> Do the RAM cards have ICs loaded on boths sides or only 1?  
> How many ICs
> on each side?

Yep, I've booted them up (serial port set to 9600-N-1, no handshaking as
suggested by someone else) - one has 112MB, the other has 272MB. They both
have HP-UX 10.10 installed, but I don't have any password for the machines.
I don't have network capability, either, yet (see below), but I'm hoping I
can install Linux on one of the drives as a disk image via other means (I
may be able to get access to a SCSI-enabled PC here at work).

Another possibility is to use the narrow-SCSI port on the Apollo to connect
a SCSI CD-ROM. Would it be possible to boot from here? This would certainly
be easier for me.

> 
> } * I have no HIL keyboard or mouse, is there a way to make a 
> HIL-to-PS/2
> } adapter so I can have a k/b and mouse at the console, or am 
> I better off
> } using a serial terminal?
> 
> Modular Industrial Computers Inc used to make a HIL to PS2 Converter
> box.  I don't think they do anymore because they can't get the ICs
> anymore (HP part number 1RD2-6001).   Nobody else makes them.  The HIL
> keyboards and mice are probably still available as "replacement parts"
> from HP.  TAMs (www.tamsinc.com) is another possible source, so is
> Monterey Bay Communication.

I looked at the MIC web site - they sell these PS/2-HIL adapters for $410!
That's a bit too much, especially when converted to Aussie dollars (around
$850). I actually don't think I'll need a local keyboard anyway, since the
735 boxes I have don't have graphics adapters. The serial port method works
well for me, since I have a couple of extra serial ports in my NT box.

> 
> 
> } * These machines have no graphics output, how can I tell if 
> they're alive?
> } Serial cable to a terminal (9600-N-1)?
> 
> Yuk, no wonder you don't know how much RAM you have.
> 
> 
> } * These machines have only the FDDI(?) optical network. I'm 
> not sure how to
> } connect these to my ethernet (if at all), or am I better 
> off adding an ISA
> } or EISA network card to the boxes?
> 
> All the ones I've seen had an AUI port.

These ones don't, unfortunately. Does anyone know if you can use the EISA
slot to add a network card? I'd really really really like to be able to do
this; maybe a driver would have to be written. I've never written a driver
before, but I'm a competant programmer (and engineer by profession) so I
don't think it would be too much out of my league to give it a go.

I have an ISA card with SMC 83C790 chipset, which apparently has an
open-source Linux-x86 driver. I'd be hoping to use this code as a starting
point (I'd be even more hoping that the "porting" would merely involve a
recompile, and the EISA bus driver would take care of the hardware
differences at that level...) Anyone with any experience here?

> 
> 
> } * Can I add an ISA or EISA network card to the boxes, and will it be
> } recognised? Drivers?
> 
> I'd like to know the answer to this.  I have 715s with an 
> EISA backplane
> and then I could have two ethernet connections.  Can I use 
> the 27245 (hp
> driver) or 27247, 27252 (hp-plus driver) cards?  Or maybe the J2405
> (lance driver) card?
> 

Cheers,
MvdW
