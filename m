Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe50.law3.hotmail.com [209.185.240.218])
	by dsl2.external.hp.com (Postfix) with ESMTP id 451A3482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Aug 2002 08:38:51 -0600 (MDT)
From: "Alex Green" <alexdgreen@hotmail.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <OE22Aztxc1o8yfogkJX00009958@hotmail.com> <20020807123807.GB9966@systemhalted>
Subject: Re: [parisc-linux] palo issues
Date: Wed, 7 Aug 2002 16:38:48 +0200
Message-ID: <OE50nwpGR881Np7vXee0000cb29@hotmail.com>
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

ok, well i got the PALO to start however it now crashes with the following
error:

Couldn't grok your kernel executable formatERROR: failed to load kernel.

What does this mean?

ag

----- Original Message -----
From: "Carlos O'Donell" <carlos@baldric.uwo.ca>
To: "Alex Green" <alexdgreen@hotmail.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Wednesday, August 07, 2002 2:38 PM
Subject: Re: [parisc-linux] palo issues


> > Hi,
> > I've just build 2.4.19-pa2 on my c3600 and then I ran palo * I've
updated to 1.1 * afterwards, after booting I got an error reporting:
> > ENTRY_INIT failed, status = -7: Nonexistent device
> > >>Some Hex Entries<<
> > Failed to initialize
> > What is this... did I do something wrong?
> > AG
>
> Yes. Possibly specifying the wrong device.
>
> To quote HP IT Resources:
> The device address supplied to ENTRY_INIT is valid, but,
> the target controller or device is not installed or is not responding
> ENTRY_INIT -7 Causes:
> - Booting from the wrong path or non-existent device.
> - Trying to boot from a device that is not responding.
>
> Stop the machine at bootup and try to search for bootable
> devices... and see what it returns.
>
> c.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
