Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA03399
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 18:35:05 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 00:36:24 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA31502;
	Wed, 5 Jul 2000 10:36:07 +1000
Date: Wed, 5 Jul 2000 10:36:07 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: bame@riverrock.org
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
In-Reply-To: <m139bFr-001VspC@chalet>
Message-ID: <Pine.LNX.4.21.0007051019050.31061-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 4 Jul 2000 bame@riverrock.org wrote:

> And here's the new one which fails.  Looks like maybe the %rp is
> not being set, or the linker's overwriting a branch in a funny
> way or something:
> 
> 000010bc <_init>:
>     10bc:       6b c2 3f d9     stw rp,-14(sr0,sp)
>     10c0:       37 de 00 80     ldo 40(sp),sp
>     10c4:       6b d3 3f c1     stw r19,-20(sr0,sp)
>     10c8:       6b c4 3f 81     stw r4,-40(sr0,sp)
>     /* jsr through local stub to __gmon_start */
>     10cc:       e8 5f 1f c5     b,l 10b4 <_init-0x8>,rp
>     10d0:       08 13 02 44     copy r19,r4

The following is actually a long branch stub
>     /* branch to __do_global_ctors_aux !!! rp was never set !!! */
>     10d4:       20 2b 40 00     ldil 56000,r1
>     10d8:       e0 20 26 ba     be,n 35c(sr4,r1)

Here's where rp is set.
>     /* nullified instruction -- otherwise it'd be an infinite loop */
>     10dc:       e8 5f 1f e5     b,l 10d4 <_init+0x18>,rp
>     10e0:       08 00 02 40     nop
>     10e4:       4b c2 3f 59     ldw -54(sr0,sp),rp
>     10e8:       e8 40 c0 00     bv r0(rp)
>     10ec:       4f c4 3f 81     ldw,mb -40(sr0,sp),r4

The trouble is that _init is a single function that's been split in two
(see glibc/csu/Makefile crti,crtn), thus the linker thinks it's quite OK
to insert a stub at the start of the second section.  I'll have to do
something special with the .init section to work around this problem.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
