Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA12742
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 16:49:24 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com
Subject: Fwd: Re: [parisc-linux] initrd/ramdisk-Status...
Date: Wed, 25 Aug 1999 00:50:34 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <99082500505601.00280@P100>
List-ID: <linux-parisc.vger.kernel.org>



----------  Weitergeleitete Nachricht  ----------
Subject: Re: [parisc-linux] initrd/ramdisk-Status...
Date: Wed, 25 Aug 1999 00:37:55 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>


Hi Matthew,

Am Tue, 24 Aug 1999 schrieben Sie:
> On Tue, Aug 24, 1999 at 09:11:58PM +0200, Helge Deller wrote:
> > I programmed it in such a way, that the bootable image in arch/parisc/boot/
> > holds a directory-structure for up to 63 possible ramdisks, which can be
> > selected during boot via initrd=<number> or initrd=<name>.  
> > The reason for adding support for multiple ramdisks is, that distributions
> > later can add easier support for multiple/different machines in one bootfile.
> 

> Hang on, this doesn't make sense.  There should be no difference between
> the binaries, the only difference should be the kernels.  

Yes, maybe I could change it to select the kernel..... What do you think ?
On the other side, there also could be different binaries for PA1.x / PA2.

> I believe the
> plan is to put UFS-reading code into the bootloader in any case (mkp?)
> which makes all this a temporary hack; as it should be.

Yes of course is UFS-reading the most important part, but how would you do
UFS-reading over Network or from a DAT on a new system without preinstalled fs
or unformatted fs ?

Helge.

> 
> -- 
> Matthew Wilcox <willy@bofh.ai>
> "Windows and MacOS are products, contrived by engineers in the service of
> specific companies. Unix, by contrast, is not so much a product as it is a
> painstakingly compiled oral history of the hacker subculture." - N Stephenson
