Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id AAA18159
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 00:21:34 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA10796;
	Wed, 17 Jan 2001 18:24:49 +1100
Date: Wed, 17 Jan 2001 18:24:49 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Richard Henderson <rth@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
In-Reply-To: <22207.979709436@upchuck.cygnus.com>
Message-ID: <Pine.LNX.4.21.0101171802240.9957-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 16 Jan 2001, Jeffrey A Law wrote:

>  In message <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>yo
> u write:
>   > +  if (flag_pic
>   > +      && (GET_CODE (PIC_OFFSET_TABLE_SAVE_RTX) != REG
>   > +	  || HARD_REGISTER_P (PIC_OFFSET_TABLE_SAVE_RTX)))
>   > +    emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
>   >  		    gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
> I do have a question about this particular hunk of code.
> 
> I can't think of a condition where PIC_OFFSET_TABLE_SAVE_RTX would not be
> a reg when this code was executed.  Simlarly I can't think of a case where
> it would be a hard reg.

What I was trying to do here is test whether the pseudo has been allocated
a register, or the case where register pressure causes it to spill to a
stack slot.  I must admit coding something based on inspecting rtl here
under gdb, ie. without a real understanding of what I was doing :-(
There seemed to be three cases:
  - register isn't used so appears as a pseudo
  - register is allocated a hard reg
  - register is allocated a stack slot

> I think we should just emit the insn unconditionally unless you're aware
> of some reason we can't shouldn't.

That causes an error when no dlt save register is needed - prologue
instruction would be deleted.

> We're probably also going to need to emit a use of the %r19 and maybe %r27
> on the return insns to ensure the pic register is restored after the
> final call in any given function.

I've a "use" in the epilogue in my tree.  Hadn't posted that patch as I
wasn't sure it's correct in the face of tail calls.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
