Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA10953
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 14:36:40 -0600
Date: Tue, 24 Aug 1999 22:38:15 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] initrd/ramdisk-Status...
Message-ID: <19990824223815.E31994@mencheca.ch.genedata.com>
References: <99082421482700.00413@P100>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <99082421482700.00413@P100>; from Helge Deller on Tue, Aug 24, 1999 at 09:11:58PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 24, 1999 at 09:11:58PM +0200, Helge Deller wrote:
> I programmed it in such a way, that the bootable image in arch/parisc/boot/
> holds a directory-structure for up to 63 possible ramdisks, which can be
> selected during boot via initrd=<number> or initrd=<name>.  
> The reason for adding support for multiple ramdisks is, that distributions
> later can add easier support for multiple/different machines in one bootfile.

Hang on, this doesn't make sense.  There should be no difference between
the binaries, the only difference should be the kernels.  I believe the
plan is to put UFS-reading code into the bootloader in any case (mkp?)
which makes all this a temporary hack; as it should be.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
