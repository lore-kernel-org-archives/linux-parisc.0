Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA16063
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 11:55:00 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id 1DE12C83
	for <parisc-linux@thepuffingroup.com>; Wed, 17 Nov 1999 13:56:37 -0500 (EST)
Sender: frowand@cup.hp.com
Message-ID: <3832FA61.F977451E@hp.com>
Date: Wed, 17 Nov 1999 10:56:33 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <19991116170819.B750@mathe.stud.uni-erlangen.de> <3831CFF0.F4B3CE3E@hp.com> <19991117071226.G750@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> >    - C code that needs to run in real mode seems to be rather fragile, given
> >      Paul's recent experience with head.c.  (I think it was Paul.)
> 
> We do need some tricks to get C code to run in real-mode, and several people
> are working on them.
> 
> When the kernel is mapped, we need to be extremely careful not to hit a
> vmalloced area or something when we call C code that should run in virtual
> mode in real mode.
> 
> It's letting the code fail obviously, for all cases, or letting easy code work
> now and wait for subtle bugs to occur.
> 
> Which one do you prefer ?
> 
> >    - A single instance of code can't (easily) be coded to be able to run both
> >      in real mode and in virtual mode.
> 
> That's true when we map the kernel at 0x0000 0000 as well.  Again, it's
> an obvious bug or a subtle one.


You missed my point.  An example: the os_hpmc() that I wrote only works in
real mode.  If I wanted it to be able to run in virtual mode, I would either
have to write a parallel version that uses virtual addresses (instead of
physical) or every time I used an address I would have to choose whether to
use the physical or virtual address, based on whether address translation was
turned on or not.

If the kernel is equivalently mapped, this problem goes away.


> >  - It's real easy to mis-code real mode assembly (eg. use the PA() macro when
> >    it shouldn't be used or don't use it when it should be used).
> 
> Is there any situation where you should not use PA() for a symbol in real-mode
> assembly ?  I agree branches are a bit difficult because the right way to code
> them is
> 
>         .+(PA(symbol)-PA(.))
> 
> but
> 
>         symbol
> 
> right now happens to work (this is good luck).


Look at os_hpmc() and see where it was not appropriate to use the PA() macro.


> I agree the PA() macro isn't a nice thing to use and if we have a chance to get
> rid of it, we should have a serious look.
> 
> >    - Issues with coherent I/O.
> 
> I don't see them.  I see issues with the architecture specification, but I do
> not believe there is any actual hardware around that depends on this issues.
>
> As far as I understood the implementation of cache-coherent I/O, what basically
> happens is:
> 
>  - I/O controller wants to access physical adress 0x1234 5678
>  - the I/O controller puts a special cycle on the bus it shares with the CPU(s)
>    that basically says "hey, if you have address 0x1234 5678 in your cache and
>    need to write it back, do it now"
>  - all CPUs have a look at the cache lines corresponding to 0x1234 5678, which
>    is the same cache lines as the one used for 0x9234 5678 (very very likely).
>  - all CPUs have a look at the tags of these cache lines, which happen to be
>    physical so 0x1234 5678 and 0x9234 5678 result in the same thing again.
>  - the guilty CPU gives back the cache line, or none does if the line doesn't
>    happen to be in the cache.
> 
> Furthermore, there is no publically documented coherent I/O system from HP yet
> so we have just to assume hardware we only heard rumours about will be sane
> once we get to see it.


So listen to the people who have read that documentation (like Grant).


>         Philipp Rumpf
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
