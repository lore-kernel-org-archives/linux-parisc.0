Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA17966
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 06:16:39 -0600
Message-ID: <378F22E5.9D9DAB1E@ruhr-uni-bochum.de>
Date: Fri, 16 Jul 1999 14:17:41 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
MIME-Version: 1.0
To: Ulrich.Strelow@Schering.DE
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/33 experience and one question
References: <C12567B0.004168E7.00@BE2314.schering.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ulrich.Strelow@Schering.DE schrieb:

> Here is my experience booting the kernel on a 715/33 using hpux:
>
> ISL> hpux /stand/vmlinux
>
> Boot
> : disk(2/0/1.6.0.0.0.0.0;0)/stand/vmlinux
> 389128 + 98304 + 68064 start 0x12000
>
> The Kernel has started...
> You are running a 33MHz PA-RISC-Machine with 48MB of RAM.
> Free memory was at 0x000AB100 (=stackbase, stacksize=0x00040000).
> Free memory now at 0x000EB100 and ends at 0x03000000.
> Linux version 2.2.1 (root@be5359) (gcc version 2.8.1) #2
>  Fri Jul 16 10:17:36 METDST 1999
> command_line: <none>
>
> exponent = 1028 mantissa = 1092275 result = 33328125
> processor       : 0
> vendor_id       : Hewlett Packard (HP)
> cpu family      : PA-RISC 1.1
> revision        : 4
> model           : 9000/715
> model name      : Scorpio Jr.(715/33)
> hversion        : 0x00003110
> sversion        : 0x00000481
> sw_id           : 2015972664
> shadow registers: yes
> cpu category    : category A
> cpu level       : level 1
> cpu MHz         : 33.00333500
> I-cache         : 64 KB
> D-cache         : 64 KB (WB)
> ITLB entries    : 120
> DTLB entries    : 120 - shared with ITLB
>
> PUFFINLOOKHERE! now initializing CR14
> PUUIFF fault_vector is 15800
> secret message is "cows can fly"

til this point all is OK !


>
> interrupted with code 142, regs 00000000
> IAOQ: 00000000 00000000

There should be something different than zero here....

>
> PSW: 00000000
> EIR: 00000000
> interrupted with code 241, regs 00000000
> IAOQ: 00000000 00000000
> Calibrating delay loop...
>
> Then it hangs with no leds blinking ...

did you tried before or after Phillip's last commit (head.s changed) ?

> The kernel messages are the same using the PARISC/Linux Bootstrap and
> rbootd.

Great!

> And then my question:
> I think the 715/33 does  not  have a Dino or a Lasi chip (am I right?), but
>  does it have a gecko (and what is this?)?

I think it has a lasi-chip...
I don't know until now what gecko is.... (isn't it the same as lasi??).

> Ulrich

Helge.
