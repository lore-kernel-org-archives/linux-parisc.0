Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA16310
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 22:24:45 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id VAA07718
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 21:28:27 -0800 (PST)
To: Alan Modra <alan@linuxcare.com.au>
cc: Richard Henderson <rth@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
Reply-To: law@redhat.com
In-reply-to: Your message of Tue, 16 Jan 2001 20:28:12 +1100.
             <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Jan 2001 22:30:36 -0700
Message-ID: <22207.979709436@upchuck.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>

 In message <Pine.LNX.4.21.0101161848180.4272-100000@front.linuxcare.com.au>yo
u write:
  > +  if (flag_pic
  > +      && (GET_CODE (PIC_OFFSET_TABLE_SAVE_RTX) != REG
  > +	  || HARD_REGISTER_P (PIC_OFFSET_TABLE_SAVE_RTX)))
  > +    emit_move_insn (PIC_OFFSET_TABLE_SAVE_RTX,
  >  		    gen_rtx_REG (word_mode, PIC_OFFSET_TABLE_REGNUM));
I do have a question about this particular hunk of code.

I can't think of a condition where PIC_OFFSET_TABLE_SAVE_RTX would not be
a reg when this code was executed.  Simlarly I can't think of a case where
it would be a hard reg.

I think we should just emit the insn unconditionally unless you're aware
of some reason we can't shouldn't.

We're probably also going to need to emit a use of the %r19 and maybe %r27
on the return insns to ensure the pic register is restored after the
final call in any given function.

jeff
