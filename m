Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0729E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 15:05:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16VgNY-0005Rz-00; Tue, 29 Jan 2002 22:05:24 +0000
Date: Tue, 29 Jan 2002 22:05:24 +0000
From: Matthew Wilcox <willy@debian.org>
To: Dark Fiber <dfiber@mega-tokyo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cross compilation
Message-ID: <20020129220524.A26142@parcelfarce.linux.theplanet.co.uk>
References: <5.1.0.14.2.20020129205648.00a80ec8@pop.freeserve.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.2.20020129205648.00a80ec8@pop.freeserve.net>; from dfiber@mega-tokyo.com on Tue, Jan 29, 2002 at 09:10:17PM +0000
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Jan 29, 2002 at 09:10:17PM +0000, Dark Fiber wrote:
> my intention is to port freebsd to a 64bit lp64(depending..) kernel.
> not a serious official freebsd port, but something i want to undertake.
> i'm hoping to concentrate on the pa8* cpu series and up. nothing might
> come of this whatsoever, but i'm willing to put a little time in and play
> around. i think i'm mad, but hey, it takes all kinds! ^_^

Uhm, yeah, you're certifiable :-)

You should ignore the cvs repositories on cvs.p-l.org for the most
part; we get our binutils from upstream and the gcc patches we require
are folded into the debian package (gcc 3.1 is supposed to support
hppa-linux... we'll see).

Just so you know, you'll have to write drivers to support:

 - Runway-to-GSC converter (u2/uturn)
 - GSC-to-PCI (dino/cujo)
 - Runway-to-Ropes (astro/ike)
 - Ropes-to-PCI (elroy)
 - Multifunction IO (lasi, wax, suckyio)

plus, if freebsd doesn't already have them:

 - Apricot (i82596) ethernet
 - ncr720 scsi
 - suckyio IDE/USB

you can cut down the number of drivers to write if you decide to only
support machines such as B1000 and up -- basically you're down to Astro
and Elroy support for those machines.  SuckyIO support if you want to
use the builtin serial/usb/ide/ps2/parallel controller.  But we managed
without that support for months, using PCI serial cards as console.  Oh
and don't forget the sound driver.  Think that's it...

-- 
Revolutions do not require corporate support.
