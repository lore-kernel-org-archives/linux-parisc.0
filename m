Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA10023
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 01:37:50 -0700
From: Marko.T.Niskanen@nokia.com
Received: from esvir07nok.ntc.nokia.com (esvir07nok.nokia.com [131.228.20.79])
	by mgw-x3.nokia.com (8.10.2/8.10.2/Nokia) with ESMTP id eBC8eOB00966
	for <parisc-linux@thepuffingroup.com>; Tue, 12 Dec 2000 10:40:24 +0200 (EET)
Received: from esebh02nok.ntc.nokia.com (unverified) by esvir07nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <T83e4144f506f5b173b@esvir07nok.ntc.nokia.com> for <parisc-linux@thepuffingroup.com>;
 Tue, 12 Dec 2000 10:40:24 +0200
Message-ID: <13F0486DB51CD311A0AE0008C7C561380453D432@eseis11nok>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] 712/60 booting problem 
Date: Tue, 12 Dec 2000 10:40:14 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

hi

Just installed linux again and during the installation booting I got
messages like 

kmem_create: Forcing size word alignment - nfs_fh
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
VFS: Disk change detected on device sr(11,0)
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
ISO 9660 Extensions: RRIP_1991A
VFS: Mounted root (iso9660 filesystem) readonly.

and I searched an old mailing lists and I found same kind problem, but
didn't find any solution of it.

http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/11-Nov/0191.ht
ml

But there is nothing  
> -----Original Message-----
> From: EXT Matt Taggart [mailto:taggart@carmen.fc.hp.com]
> Sent: 12 December, 2000 9:22
> To: Marko.T.Niskanen@nokia.com
> Cc: parisc-linux@thepuffingroup.com; adevries@linuxcare.com
> Subject: Re: [parisc-linux] 712/60 booting problem 
> 
> 
> 
> Marko.T.Niskanen@nokia.com writes...
> 
> > Sorry I have no boot log, because linux doesn't start and I 
> have no idea how
> > to get it an another way.  after text on console "switching from PDC
> > console", I can read from serial port: 
> 
> If you set your 712 to serial console you can capture it, but 
> I don't know if 
> I'd recommend doing that since STI will be better long term.
> 
> > kmem_create: Forcing size word alignment - nfs_fh VFS: 
> Mounted root (ext2
> > filesystem) readonly. !!die_if_kernel: init(1): Illegal 
> instruction 8
> > 
> > and after that starts that "loop" 
> 
> I get the same loop here but with a newer kernel and libc. 
> Did you update your 
> kernel or libc at all? I think the 0.5 CD should work fine on 
> a 712/60.
> 
> -- 
> Matt Taggart
> taggart@fc.hp.com
> 
> 
> --------------------------------------------------------------
> -------------
> To unsubscribe: send e-mail to 
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
