Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA20054
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Aug 1999 11:34:12 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37C57DD6.5E4BF8DA@thepuffingroup.com>
Date: Thu, 26 Aug 1999 13:48:06 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Philipp Rumpf <prumpf@suse.de>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thoughts on arch/parisc/irq.c
References: <199908261713.KAA12239@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> Ok - this is another SMP issue...I'll hardcode 0xfffe0000 for now.
> 
> Platform        Processor HPA
> --------        -------------
> 712/80          0xfffbe000
> 715/100         0xfffbe000
> B132L           0xfffbe000
> B180L           0xfffbe000
> C200+           0xfffa0000

For what it's worth, I have code in my soon-to-be-committed inventory
code that detects this.  The A180C is at 0xfffbe000 also.

I'm just going through the difficulty of merging my code into the
tree...

Here's the output of my code:

Doing the inventory of the machine
     HPA of the processor: fffbe000
Checking CPU's bus: 
Located Staccato L2 180 (A Class 180) (0) on bus 0x0 at 0xfffbe000,
versions 0x0
Located Staccato L2 180 Memory (1) on bus 0x1 at 0xfffbf000, versions
0x8b, 0x00
Bus does not implement On Line Replacement.
Checking for peripherals...
Located Dino PCI Bridge (13) on bus 0x0 at 0xfff80000, versions 0x680,
0x3, 0xa0
Located Dino PS2 Keyboard (10) on bus 0x1 at 0xfff81000, versions 0x7,
0x0, 0x90
Located unknown device (11) on bus 0x0 at 0xffd00000, versions 0x5f,
0x0, 0x81,0
Located Phantom PseudoBC GSC+ Port (7) on bus 0x0 at 0xffc00000,
versions 0x5040
Located Phantom PseudoBC GSC+ Port (7) on bus 0x1 at 0xffc01000,
versions 0x5050


- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
