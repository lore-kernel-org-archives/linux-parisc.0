Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA30127
	for <parisc-linux@puffin.external.hp.com>; Tue, 20 Jul 1999 02:39:55 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: <smoret@uci.edu>
Subject: RE: [parisc-linux] HP9000 J210
Date: Tue, 20 Jul 1999 10:28:10 +0200
Content-Type: text/plain
References: <000401bed268$88e519a0$459f0118@genocide.net>
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Message-Id: <99072010411201.01142@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Tue, 20 Jul 1999 schrieben Sie:
> > What´s the problem with it ??
> > You know, that you have to compile the kernel and the LIF
> > currently on hpux
> > only ??
> > The cross-compiler doesn´t work yet !
> That would explain why it wont work. Is there anything I can do to get
> recent kernels? I have a plethora of non-HP machines at my disposal and
> could (if they would work) easily do cross-compiles in minutes. 

Yes, that´s the problem I have too. Currently I have to start und shutdown my
HP-box every time I built a new kernel. Cross-compiling could speed up the
programming-phase drastically. Is anybody currently working on that issue ?
The bootloader already has some code to load ELF-images too.

> I would also
> be willing to host a distribution site for kernel images (if this would
> help).
> 
> I don't currently have a HP-UX license and would rather not install it.
> Although I do have 10.?? media.
> 
> > Does the current kernel shows you the processor as "7200" ?
> No the current kernel says:
> cpu family      : PA RISC 1.1
> revision        : 4
> model           : 9000/770/J210
> model name      : SkyHawk 120
> hversion        : 0x00005860
> sversion        : 0x00000491
> sw_id           : 2004779464
> shadow registers: no
> cpu category    : category A
> cpu level       : level_0
> cpu MHz         : 120.00000000
> I-cache         : 256 KB
> D-cache         : 256 KB (WB)
> ITLB entries    : 120
> DLTB entries    : 120 (shared with ITLB)

This is an older kernel-image. The newest one has a line showing "cpu : PAyxxx"
and info about the BTLB. I think the message "level 0" is wrong here too, but
that should already be fixed in the cvs.

> I hope all this info helps, I'd be happy to give more if you can direct me,

Could you please try a newer image later...

> --
> Steve Moret
> smoret@uci.edu

Helge.
