Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA30028
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 15:16:45 -0700
Message-Id: <200101172220.RAA01421@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: law@redhat.com
Date: Wed, 17 Jan 2001 17:20:10 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rth@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
In-Reply-To: <25409.979767732@upchuck.cygnus.com> from "Jeffrey A Law" at Jan 17, 2001 02:42:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <200101171622.LAA13215@hiauly1.hia.nrc.ca>you write:
>   > I think all these problems can be resolved by emitting the insn at the
>   > first call.  We just have to keep track of whether it has been emitted
>   > or not.
> I'm not entirely sure what you mean by this.
> 
> We must emit the code to restore the PIC register after each call when
> generating PIC code.  There are no known exceptions to this rule.
>
> You might be talking about saving the PIC register into the stack or
> pseudo during the prologue.  Yes, we could arrange to do that if and
> only if we had a call in PIC mode.  That's fairly easy to do.

Yes, I am talking about saving the pic register just before the first call
insn rather than in the prologue.  This way we know that the save is needed
and we don't have to worry about whether the pseudo that is initially
generated for it gets a hard register or not.  If there are no calls, the
insn won't be emitted.  The insn can also be eliminated if reload decides
to use the stack saved value of the PIC register for restoration of the PIC
register after calls.  The 32 bit ABI saves it to the stack under almost
all circumstances.

We just need to add a flag to Alan's machine structure, initialize it
when the structure is created, and test it before each call insn.  If it
is 0, we save the PIC register and set the flag.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
