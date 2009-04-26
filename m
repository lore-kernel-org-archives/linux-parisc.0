From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: [PATCH] ide-cd: fix kernel crash on hppa regression
Date: Sun, 26 Apr 2009 08:33:32 +0200
Message-ID: <20090426063331.GA3079@liondog.tnic>
References: <49E6638B.8090700@gmx.de> <200904232334.55231.bzolnier@gmail.com> <49F2F1AC.7090900@gmx.de> <200904251633.01800.bzolnier@gmail.com> <49F39402.1050500@gmx.de>
Reply-To: petkovbb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Linus <torvalds@linux-foundation.org>,
	Borislav Petkov <petkovbb@googlemail.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49F39402.1050500@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Sun, Apr 26, 2009 at 12:51:46AM +0200, Helge Deller wrote:
..

> > Thus please give commit 5ae5412d9a23b05ab08461b202bad21ad8f6b66d ("ide:
> > add ide_dma_prepare() helper") with your ide-cd fix applied a try.
> 
> That is a hard one. Just reverting it (with or without the other one above) prevents
> me to build a kernel due to compiler errors.
> 
> Instead I tried 2.6.30-rc1 and 2.6.30-rc2 (all with my simple patch).
> 2.6.30-rc1 worked without problems.
> 2.6.30-rc2 did showed the errors.
> (I should mention, that the cdrom does work even if those messages are printed).
> The diff of drivers/ide/ns87415.c between those two versions seems unproblematic.
> Then, after inserting "outb(ATA_DEVCTL_OBS, io_ports->ctl_addr);" to 2.6.30-rc2 didn't fixed it either.
> 
> So, I think there is some generic problems in the generic ide cdrom stack, which was
> introduced between 2.6.30-rc1 and -rc2.
> 
> Hope this helps you further.

Not really, since I'm assuming that it is this particular hardware
confguration you have that triggers this. It would still be very helpful
if you'd bisected it since you've narrowed it down to the [30-rc1
30-rc2] interval and that isn't going to be a large number of kernel
compiles :).

Thanks.

-- 
Regards/Gruss,
    Boris.
