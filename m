Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27135
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 12:55:08 -0700
Message-Id: <200012081958.LAA09759@milano.cup.hp.com>
To: "Witvliet, Hans" <Hans.Witvliet@alcatel.nl>
Cc: "'Andreas Thienemann'" <andreas@bawue.de>,
        "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] FW: hp_boot.log 
In-reply-to: Your message of "Fri, 08 Dec 2000 18:20:10 PST."
             <1A8904C3797ED411AC2E0008C7E6F88117C6A4@nlntmail2b.ats.nld.alcatel.nl>
Date: Fri, 08 Dec 2000 11:58:15 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Hans/Andreas,
Re C110 crashing

> 3. U2-IOA BC GSC+ Port (7) at 0xf3fbf000,

I suspect the problem is the CCIO driver isn't seeing the U-turn
chip and DMA will HPMC (crash) the system. We should see some output
from ccio-dma.c driver before LASI "barks".


"Witvliet, Hans" wrote:
> Hi Andreas,
> 
> I tried three other machines, with following results
> 1) B180c
> 2) B000  
> 3) 712    
> On the B2000 booting also resulted in stack dump,

B2000 is like a C3000 with fewer slots/slower CPU.
I don't remember of palinux-v0.5 was tested on that - looks like not.
Newer kernel should work - several of us are using C3k/J5k's for
development.

> on B180c and the 712 the system freezes to death after the "switching to UPL
> console" message.

For B180/712: Read the FAQ at www.parisc-linux.org/faq.html

> 
> I wonder, if it has something to do with the problem that i encounterd some
> time ago with the linux port to sun-hardware.
> If the system had to much memory, it was not able to startup.

Not a problem. We ignore memory beyond 512MB right now.

> Cant do much testing now, and next week i am @ HP. (see what happens if i
> try to boot from my cd at the hp-trainings lab...;-))

enjoy!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
