Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA32343
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 07:46:39 -0700
Date: Tue, 16 Nov 1999 07:48:10 -0700 (MST)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199911161448.HAA18034@fast.cs.utah.edu>
To: chris@4mcnabb.net, parisc-linux@thepuffingroup.com
Subject: Re:  [parisc-linux] Got a machine, Got a Kernel Image, Got a Ramdisk Image, What's next?
List-ID: <linux-parisc.vger.kernel.org>

> From: "Christopher L McNabb" <chris@4mcnabb.net>
> To: <parisc-linux@thepuffingroup.com>
> Date: Tue, 16 Nov 1999 09:23:07 -0500
> Subject: [parisc-linux] Got a machine, Got a Kernel Image, Got a Ramdisk Image, What's next?
> 
> I've been using Intel Linux since version 0.99.  My company recently retired
> an HP-9000 model 832, which is now sitting here in my house.  I would love
> to help out with the pa-risc port, but don't have the time or inclination to
> do actual development.  I can, however, do testing.
> 
> The box is an HP-9000 model 832, HP-UX 9.0, 32 Megs of RAM (yeah, I know
> that's rather low), and 3.5 gigs of hard drive space split between 6 HP-IB
> disk drives (4 internal, 2 external).  A SCSI interface is supposed to
> arrive fed-ex today, and I will be adding a CD-ROM and SCSI disks as cash
> becomes available.
> 
> What I really need to know, though, are two things:
> 1.  What is the process for getting the Linux kernel to boot?
> 2.  What can I do to help with the porting of Linux to the PA-RISC
> architecture?
> 

The current linux work is focusing on 1.1 and 2.0 architecture machines with
fairly traditional memory-mapped IO architectures.  The 832 is a PA 1.0
machine with a completely different "channel" based IO bus architecture
(NIO).

In a nutshell, it would be a long uphill battle to port anything to it
and for very little gain.  Scrap it!
