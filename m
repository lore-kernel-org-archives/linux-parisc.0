Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA14567
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 01:23:01 -0700
Date: Mon, 15 Nov 1999 09:25:49 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Stan Sieler <sieler@allegro.com>
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991115092549.G30917@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911150736.XAA14959@opus.allegro.com>
List-ID: <linux-parisc.vger.kernel.org>

> >         ; First order of business is to adjust some pointers
> >         depi            3,1,2,%arg0     ; phys->virt(free mem ptr)
> >         depi            3,1,2, %sp      ; phys->virt SP
> >         depi            3,1,2, %dp      ; p2v DP
> 
> DEPI is "Deposite Immediate".  depi 3,1,2, %arg0
> drops the value 3 into the upper 2 bits of register arg0.
> 
> IIRC, it's:  DEPI immediate_value, right_most_bit#, #bits, target_register
> 
> But...strange code.  It's setting the upper 2 bits of R26, R30, and R27.

The way physical memory is mapped to kernel virtual memory is (with exceptions):

physical address P is mapped at virtual address P + PAGE_OFFSET.

PAGE_OFFSET currently is 0xc000 0000 which was a bad value and will be changed
to either 0x8000 0000 or 0xe000 0000 in the near future.  This is one of the
reasons you should use tophys and tovirt instead of doing the depi by hand.

Probably most of the depis are my code and I think there are several places
where I am still hard-coding 0xc000 0000 as PAGE_OFFSET explicitly.  If you
find a place you think depends on a certain PAGE_OFFSET after I cleaned up
the code I can find, please tell us.

	Philipp Rumpf
