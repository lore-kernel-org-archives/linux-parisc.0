Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp9.xs4all.nl (smtp9.xs4all.nl [194.109.127.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11182482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 12:45:54 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp9.xs4all.nl (8.9.3/8.9.3) with ESMTP id UAA18553
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Sep 2001 20:45:51 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Mon, 17 Sep 2001 20:33:12 +0200
To: Francois Deppierraz <francois@ctrlaltdel.ch>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010917203312.A6109@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010917165501.B17483@gollum.intranet.nimag.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010917165501.B17483@gollum.intranet.nimag.net>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 17, 2001 at 04:55:01PM +0200, Francois Deppierraz wrote:
> Hi kernel hackers !
> 
> My HP 712/60 with a 2.4.9-pa20 kernel crash with the following error
> message when I portscan it using nmap -O (OS detection).
> 
> kswapd[4]: Unaligned data reference 28
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111000001111
> r0-3o 00000000 10332810 1028b9e4 0000000a
> r4-7o 100dfdb2 100ed148 0000000c 100dfd94
> r8-11o 00000000 00000001 00020000 10ce6500
> r12-15o 11fb09a0 00004400 00004800 43f02aa9
> r16-19o 100eca00 00000000 00000c00 00000001
> r20-23o 00000000 00000109 117ca000 0000000f
> r24-27o 00000000 100ed148 10ce6500 102f0010
> r28-31o 117ca160 00000040 100ed400 1012e6d8
> sr0-3o 00000000 00000002 00000000 00000002
> sr4-7o 00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 10281658 1028165c
>  IIR: 0c801093    ISR: 00000000  IOR: 100dfdb2
>  CPU:        0   CR30: 100ec000 CR31: 103a0000
>  ORIG_R28: 00000000
> Kernel Panic: Aiee, killing interrupt handler!
> In interrupt handler - not syncing
> 
> Thanks for your work !
> 
> Any idea ? Do I need to fill a bugreport ?

Let's first find out what happened. Paste a small part of your
System.map file for this kernel (like 10 lines) with the address
10281658 somewhere in the middle. Then do 

objdump -d <your kernel> and grep for say 40 lines around 10281658. It
helps if there are some calls in that part, so you can see where we are
in the kernel. 

Nobody can do this for you, since your kernel is unique (or at least
probably unique).

If in doubt, search the archives for a mail with the subject 'Documented
oops running big-endian reiserfs on parisc architecture' where I
basically do the same: find out where it went wrong.

Then post this information!


Good luck,
Jurriaan
-- 
Do you consider yourself to be the native of another world?
Reith laughed and groped for an answer. He said: "Four possible conditions
exist. If I were indeed from another world I could answer yes or no. If I
were not from another world I could answer yes or no. The first case leads
to inconvenience. The second diminishes my self-respect. The third case is
insanity. The fourth represents the only situation you would not consider
an abnormality. The question, hence, as you admit, is absurd."
	Adam Reith (Jack Vance - Servants of the Wankh)
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.29 0.37 0.20
