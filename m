Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 183FC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Aug 2001 17:25:44 -0600 (MDT)
Date: Mon, 27 Aug 2001 17:25:38 -0600
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: rbradetich@uswest.net, parisc-linux@lists.parisc-linux.org
Subject: Re: Betr.: Re: [parisc-linux] Is a C200+ currently supported?
Message-ID: <20010827172538.A9680@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <sb8a03e8.087@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sb8a03e8.087@ms-zrt1>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

Jurriaan,

Sorry,  The STI console is not supported on the C200+ under the
0.9.2 installer.  The reason is because I added the code to walk 
the GSC busses under the ccio driver after this iso was released.
I had limited success using a TOB kernel with a GSC based
graphics card.  Unfortunately, the PCI based graphics cards
will not work with the STI console yet.

The cable needs to be a null modem cable, not a straight
serial cable.  If the cable is really a null modem cable,
you might also try disconnecting the monitor as well.

I verified my minicom settings and they are 9600 8N1 as well.

- Ryan


On Mon, Aug 27, 2001 at 08:22:02AM +0200, Jurriaan Kalkman wrote:
> >Jurriaan,
> >
> >I use a C200+ as my development machine for the parisc-linux port. So
> >yes, I try to keep the C200+ supported.  Be forwarned that I am newbie
> >kernel hacker, and sometimes it takes me a long time to find/fix the 
> >problems on these machines (ie. the ccio cpio cdrom -> disk HPMC).  I
> >have only been using the serial console interface from the C200+ so I'm
> >not sure how well (or if the STI works on this machine).  Now that I 
> >found/fixed the HPMC I was looking for, I will see if I can give it a 
> >whirl with the 0.9.2 installer tonight.
> >
> I'm dying to know how that whirl worked out, as it doesn't whirl all
> that much here.
> 
> The 0.9.2 iso hangs after
> 
> Set PSW W bit to 0
> 
> I'm trying to update the firmware from 5.3 to 6.3, perhaps that will help.
> 
> And another (very newbie) question:
> 
> If I remove the keyboard and mouse from the C200, attach a serial cable
> that is working perfectly between my modem and my Intel computer, start
> minicom, make sure it runs as 9600 8N1 and then boot the C200, should
> something happen? Minicom keeps saying it's offline, so I can't get no
> serial console.
> 
> Thanks,
> Jurriaan
> 
> 

-- 
