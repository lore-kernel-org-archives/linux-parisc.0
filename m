Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA07708
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 12:13:08 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911161914.LAA31352@opus.allegro.com>
Subject: Re: [parisc-linux] Got a machine, Got a Kernel Image, Got a Ramdisk Image, What's next?
To: chris@4mcnabb.net (Christopher L McNabb)
Date: Tue, 16 Nov 1999 11:14:08 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <000901bf303e$1a95e540$1e8550d8@4mcnabb.net> from "Christopher L McNabb" at Nov 16, 1999 09:23:07 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:
> The box is an HP-9000 model 832, HP-UX 9.0, 32 Megs of RAM (yeah, I know
> that's rather low), and 3.5 gigs of hard drive space split between 6 HP-IB
> disk drives (4 internal, 2 external).  A SCSI interface is supposed to
> arrive fed-ex today, and I will be adding a CD-ROM and SCSI disks as cash
> becomes available.

I can't remember if the original 8x2 machines could boot from SCSI.
Their immediate predecessors, the 8x5 machines, couldn't (but the
ability was added later via a firmware upgrade).

That aside, 8x2 machines are a slightly older version of PA-RISC
(1.0? 1.1?).  The 9000/7xx and most newer 9000/8xx machines are
running newer versions of PA-RISC (1.2 or later).  The most
important difference is in floating point instructions. 
The PA-RISC kernel *could* be easily compiled for 1.0 architecture...
I doubt that it does much floating point work in the kernel!
Further, it could be compiled with 1.2 scheduling...that still
works on 1.0 machines.

The I/O architecture is HP-PB, like the 8x7 machines, so that
may be okay.


If it turns out that the current port won't work for you, you
have a few choices:

   1) wait for it to be done, and modify it for 8x2.

   2) use your 832 with HP-UX.  You can go to 
      http://www.software.hp.com/y2kupgrades/
      and get HP-UX 10.20 for free.

   3) trade it for a machine supported by the current porting
      project.

If you opt for (3), you may want to know about the Classic Computer
mailing list ... a worldwide group of computer collectors.
To post a message to it, send to:
   classiccmp@u.washington.edu

The 832 is a 30 MHz machine.

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
