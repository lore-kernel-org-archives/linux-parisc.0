Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA24521
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 09:19:04 -0700
Message-Id: <200101171622.LAA13215@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: law@redhat.com
Date: Wed, 17 Jan 2001 11:22:36 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, rth@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
In-Reply-To: <23954.979747751@upchuck.cygnus.com> from "Jeffrey A Law" at Jan 17, 2001 09:09:11 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <Pine.LNX.4.21.0101171802240.9957-100000@front.linuxcare.com.au>yo
> u write:
>   > What I was trying to do here is test whether the pseudo has been allocated
>   > a register, or the case where register pressure causes it to spill to a
>   > stack slot.
> But the code in question is executed during insn expansion time -- long long
> before we know anything about whether or not a particular pseudo register
> will be allocated to a hard register or stack slot.
> 
>   > There seemed to be three cases:
>   >   - register isn't used so appears as a pseudo
>   >   - register is allocated a hard reg
>   >   - register is allocated a stack slot
> But I can't see how the final two cases could happen at that stage in
> compilation.  If you actually saw these under the debugger, I'd like you to
> investigate them further since I don't believe they can/should happen.

I think all these problems can be resolved by emitting the insn at the
first call.  We just have to keep track of whether it has been emitted
or not.

Then, the optimiser can eliminate it if it decides it is better
to reload the pic offset table register from the stack.  We don't have
to worry about where it is allocated, adding notes, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
