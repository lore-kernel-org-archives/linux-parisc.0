Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA21943
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 16:13:11 -0700
Sender: frowand@cup.hp.com
Message-ID: <383093DE.A8B73CE4@hp.com>
Date: Mon, 15 Nov 1999 15:14:38 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
CC: Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> > >         ; First order of business is to adjust some pointers
> > >         depi            3,1,2,%arg0     ; phys->virt(free mem ptr)
> > >         depi            3,1,2, %sp      ; phys->virt SP
> > >         depi            3,1,2, %dp      ; p2v DP
> >
> > DEPI is "Deposite Immediate".  depi 3,1,2, %arg0
> > drops the value 3 into the upper 2 bits of register arg0.
> >
> > IIRC, it's:  DEPI immediate_value, right_most_bit#, #bits, target_register
> >
> > But...strange code.  It's setting the upper 2 bits of R26, R30, and R27.
> 
> The way physical memory is mapped to kernel virtual memory is (with exceptions):
> 
> physical address P is mapped at virtual address P + PAGE_OFFSET.
> 
> PAGE_OFFSET currently is 0xc000 0000 which was a bad value and will be changed
> to either 0x8000 0000 or 0xe000 0000 in the near future.  This is one of the
> reasons you should use tophys and tovirt instead of doing the depi by hand.

< stuff deleted >


This is just one of several recent messages dealing with the issues caused by
locating the kernel at virtual address 0xc0000000 instead of 0x00000000.  I
still don't understand why the kernel can't be at zero, even though several
people have tried to explain it to me.  Can anyone provide a clear
explanation?

Thanks!

-Frank
