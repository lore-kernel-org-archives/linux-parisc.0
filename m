Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA26532
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 10:29:54 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id KAA06368
	for <parisc-linux@thepuffingroup.com>; Tue, 19 Oct 1999 10:30:45 -0600 (MDT)
Message-Id: <199910191630.JAA27454@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
cc: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
In-reply-to: Your message of "Mon, 18 Oct 1999 21:49:29 PDT."
             <99101821580101.00297@P100>
Date: Tue, 19 Oct 1999 09:30:45 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] LASI and serial port initialization
List-ID: <linux-parisc.vger.kernel.org>


Helge and I exchanged some e-mail on the topic of LASI vis a vie
serial port initialization. Since then, I've come to the conclusion
all (or most) parisc platforms will have a similar problem.

The problem is LASI is "discovered" and initialized well after several
other drivers want to print things to the console. I see a few options
on how to handle it:
1) For each platform, force the console to be the first device "discovered"
   and initialized. This is not a really good idea since console can be
   different depending on configuration. Rebuilding the kernel to use
   a different console doesn't seem reasonable to me. Having the user
   figure out which devices need to be initialized first and build an
   appropriate kernel so console works also seems unreasonable.  We are
   headed down this path now though....

2) Use IODC until the console device is "owned" by the appropriate driver
   and can start taking input/output. 

3) buffer the output instead of calling IODC.
   Size of the buffer will impose some sort of limit.
   I think this is what HP-UX does but don't really know
   and it shouldn't matter to us.

Either 2 or 3 requires some software layer behind printk to change
behavior at some point. I don't know where that point is or how
exactly to define it. I just thought going down path #1 is going
to be a real pain to support on a broad set of platforms.

Any other thoughts?

BTW, I still don't know if Helge's changes to inventory.c are
needed or not. I don't have the warm fuzzy feeling they are needed
but can't prove they aren't either.

grant

Helge Deller wrote:
> Am Mon, 18 Oct 1999 schrieben Sie:
> > Helge,
> > I never understood this chunk of very well. I was wondering
> > why you moved code from the case HPHW_BA to outside the switch
> > statement in do_oldhw_inventory()? (inventory.c)
> > 
> > If this is of general interest please post to parisc-linux...
> > 
> > thanks,
> > grant
> 
> Hi Grant.
> 
> I just wanted to get it working, so I moved stuff around until it worked. Wit
>   h
> this I found, that the LASI-Controller should be added to the list before all
> other stuff underlying the lasi (same is also to the WAX(??)-controller with
> PS2/Keyboard/Mouse/RS232/HIL). This way it worked and I didn´t thought too muc
>   h
> about it later....   :-)
> 
> [Is this for global interrest ??]

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
