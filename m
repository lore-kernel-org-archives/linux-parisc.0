From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH] ide-cd: fix kernel crash on hppa regression
Date: Thu, 23 Apr 2009 23:34:54 +0200
Message-ID: <200904232334.55231.bzolnier@gmail.com>
References: <49E6638B.8090700@gmx.de> <20090422061253.GB22451@liondog.tnic> <49EF8868.4050308@gmx.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Cc: petkovbb@gmail.com, Linus <torvalds@linux-foundation.org>,
	Borislav Petkov <petkovbb@googlemail.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49EF8868.4050308@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wednesday 22 April 2009 23:13:12 Helge Deller wrote:
> Borislav Petkov wrote:
> > On Fri, Apr 17, 2009 at 09:15:27AM +0200, Helge Deller wrote:
> > [..]
> >>>> BTW, even with my patch ATAPI CDROM accesses don't work with the current kernel...
> >>> What do you mean by that, please elaborate?
> >> I meant:
> >> a) Without my patch the kernel did crash (see backtrace in original mail)
> >> b) with my patch the kernel booted to login prompt, but I got those messages on the console:
> >>  hda: command error: status=0x51 { DriveReady SeekComplete Error }
> >>  hda: command error: error=0x54 <3>{ AbortedCommand LastFailedSense=0x05 }
> >>  ide: failed opcode was: unknown
> >> Nevertheless, mounting a cdrom in the drive didn't suceeded with same/similiar messages, but
> >> this could even be because of the parisc superio driver...
> > 
> > Is it possible to isolate it and test without the superio driver?
> 
> No, since the superio controller provides the IDE ports.

Is 2.6.29 working ok?  What about 2.6.30-rc1 + your fix?
