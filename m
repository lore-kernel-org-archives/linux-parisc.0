Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40278484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Dec 2003 11:15:23 -0700 (MST)
Date: Sun, 7 Dec 2003 11:15:21 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [patch] Get superio serial to work with 2.6
Message-ID: <20031207181521.GA14466@colo.lackof.org>
References: <20031207041018.GN20133@tausq.org>
	<20031207082006.GA8167@colo.lackof.org>
	<20031207084431.GP20133@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031207084431.GP20133@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Dec 07, 2003 at 12:44:31AM -0800, Randolph Chung wrote:
> > My preference right now is to move those PDC calls into sba_cdio.c.
> 
> hmmm.. that looks like a hpux name ;-) sba_iommu.c? 

yeah...brainfart. I was up too late last night again...

> > Then add hueristics that call PDC_IO_RESET_AND_CLEAR if suckyio/USB
> > is active or the LAN active. If suckyio serial console, then add code
> > to save/restore suckyio config space around the reset.
> > 
> > So quite a bit of hackery that's really only needed when the
> > IO MMU is actually used.
> 
> ok, so should i just keep this patch in my private tree for now? or
> commit it and let you fix the rest of it? ;-)

commit and I'll fix the rest later.

> > hrm...I don't have the serial console setup at the moment.
> > I suggest plugging in a USB mouse and moving the mouse around
> > during boot. Not sure that's sufficient but maybe.
> 
> i doubt that will make a difference. if the usb driver is not yet loaded
> (i.e. during inventory) i don't thing any usb events will be happening,
> right? anyway, i guess i can try this tomorrow.

It does make a difference. The IODC left HW in an enabled and operational
state when it handed off to the OS. That's harmless for a serial console.
It's not harmless when the device can master DMA transactions and we
reprogram the IO MMU.

grant
