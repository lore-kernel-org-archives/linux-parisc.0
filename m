Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA29514
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 15:02:28 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id OAA20971
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 14:06:02 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: alan@linuxcare.com.au, rth@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED 
Reply-To: law@redhat.com
In-reply-to: Your message of Wed, 17 Jan 2001 11:22:36 EST.
             <200101171622.LAA13215@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Date: Wed, 17 Jan 2001 14:42:12 -0700
Message-ID: <25409.979767732@upchuck.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200101171622.LAA13215@hiauly1.hia.nrc.ca>you write:
  > I think all these problems can be resolved by emitting the insn at the
  > first call.  We just have to keep track of whether it has been emitted
  > or not.
I'm not entirely sure what you mean by this.

We must emit the code to restore the PIC register after each call when
generating PIC code.  There are no known exceptions to this rule.

You might be talking about saving the PIC register into the stack or
pseudo during the prologue.  Yes, we could arrange to do that if and
only if we had a call in PIC mode.  That's fairly easy to do.


jeff
