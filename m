Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA17300
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 18:08:07 -0700
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id eBM1B0t24000
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Dec 2000 02:11:05 +0100
Date: Fri, 22 Dec 2000 02:11:00 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] (still) booting problems with HP9000/730
In-Reply-To: <20001220094608.D2554@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0012220201410.23695-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 20 Dec 2000, Richard Hirst wrote:

> The following is from my 715/75, where the scsi driver works.  As Alex
> said, the scsi driver has a problem on your machine, but not all the
> messages indicate real problems.  At one time I had a cdrom attached
> which didn't respond well to requests for synchronous working, and the
> driver couldn't cope.
> 
> What devices do you have on your scsi bus?  Can you disconnect
> everything except the Quantum HD as a test?

nothing except the harddisk! even the scsi-floppy is NOT connected

> You can try booting with
> 
> 	sim700=nodisc:0xff

done that, didn't work

> in case it is a problem with disconnect/reselect, and you could
> try
> 
> 	sim700=nodisc:0xff,noneg:0xff
>
> in case it is a probem with sync/async negotiation.

also done that, didn't work either ... the same problem as before :((((
the kernel recognizes the harddisk, then is clears the screen,
and tries to boot from /dev/sda3 (correct partition! otherwise it
would print VFS: unable to mount root partition (verified that)).
But then it runs into infinite loop of stack traces ...

sorry that i cannot provide a boot log :((((

greetings max
