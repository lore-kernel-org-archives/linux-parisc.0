Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bastion.qld.csiro.au (bastion.qld.csiro.au [140.253.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D36D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 17:39:01 -0600 (MDT)
Received: from bastion.qld.csiro.au (localhost [127.0.0.1])
	by bastion.qld.csiro.au (8.9.3/8.9.3) with ESMTP id JAA05050
	for <parisc-linux@lists.parisc-linux.org>; Tue, 3 Apr 2001 09:38:58 +1000 (EST)
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by bastion.qld.csiro.au (8.9.3/8.9.3) with ESMTP id JAA05046
	for <parisc-linux@lists.parisc-linux.org>; Tue, 3 Apr 2001 09:38:58 +1000 (EST)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D514459E4@ntexchange.cat.csiro.au>
From: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 3 Apr 2001 09:38:41 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Getting Started...
List-ID: <linux-parisc.vger.kernel.org>

Hi folks:

I have recently "acquired" a couple of old 735/xxx's, and I wish to run
Linux on these.
I have no experience with these machines whatsoever, my only experience is
with PCs, and Sun and IBM RS/6000 as unix-users (NOT as sysadmin). I have
run Linux on a PC before, so I am not totally alien to sysadmin. Oh, and I'm
an electronics engineer, so I have no problem with writing (average) code or
fiddling with electronics.

Firstly, I have a couple of questions if someone would be so kind as to help
me out:

* These boxes seem to have no indication whether they are 735/125 or 735/99
- how do I find out which they are?

* I don't know how much memory they have, how do I find this out? They have
maybe half of the memory expansion slots filled.

* I have no HIL keyboard or mouse, is there a way to make a HIL-to-PS/2
adapter so I can have a k/b and mouse at the console, or am I better off
using a serial terminal?

* These machines have no graphics output, how can I tell if they're alive?
Serial cable to a terminal (9600-N-1)?

* These machines have only the FDDI(?) optical network. I'm not sure how to
connect these to my ethernet (if at all), or am I better off adding an ISA
or EISA network card to the boxes?

* Can I add an ISA or EISA network card to the boxes, and will it be
recognised? Drivers?

* Has anyone done any work on a boot ROM in place of the "BIOS" (Yes, I know
it's not called a bios, but I can't remember the name off-hand...), so the
serial link isn't needed. That is, is there a way to have some startup code
in the ROM that will immediately point the box to the NFS share where it's
to get its info? What about a boot ROM on a network card? Is this even
possible?

* Can you boot these things straight off the SCSI disk? Is there a bootable
disk image, that would mean the network isn't needed straight away?

* Is there a basic "getting started" guide that I can use in order to boot
and have a bit of a play? What's the minimum I would need to do this?

* I read on the web site that there is no X server for this machine being
developed, is X available at all? That is, if I have an X server on another
machine, and assuming I have some networking setup, can I use remote X apps
(the way X is supposed to be...)?

I have a fast internet link and CD burner at work, so I have no problem
getting whole disk images if I need to.

Thanks in advance for the help, I can't think of any more questions for
now...

Cheers,
Matt van de Werken.
