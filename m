Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA13811
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 00:35:56 -0700
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199911150736.XAA14959@opus.allegro.com>
Subject: Re: [parisc-linux] depi?
To: adevries@thepuffingroup.com (Alex deVries)
Date: Sun, 14 Nov 1999 23:36:51 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> from "Alex deVries" at Nov 15, 1999 03:08:49 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Re:

>         ; Get ready for phys->virt transition
>         ; First order of business is to adjust some pointers
>         depi            3,1,2,%arg0     ; phys->virt(free mem ptr)
>         depi            3,1,2, %sp      ; phys->virt SP
>         depi            3,1,2, %dp      ; p2v DP

DEPI is "Deposite Immediate".  depi 3,1,2, %arg0
drops the value 3 into the upper 2 bits of register arg0.

IIRC, it's:  DEPI immediate_value, right_most_bit#, #bits, target_register

But...strange code.  It's setting the upper 2 bits of R26, R30, and R27.

> in head.S?
> 
> I don't have a 'depi' in the index of my PA 2.0 assembler book.  I have a
> depwi and a depdi though.
> 
> - Alex "I shot the sheriff, but I did not shoot the depdi" deVries
> 
> -- 
> Alex deVries <adevries@thepuffingroup.com>
> Vice President Engineering
> The Puffin Group
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 


-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html          www.allegro.com/sieler
