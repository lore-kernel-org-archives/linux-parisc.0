From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix backtrace on PA-RISC
Date: Wed, 29 Jun 2011 12:45:25 -0400
Message-ID: <20110629164524.GA11776@hiauly1.hia.nrc.ca>
References: <20110629005931.23E974EDA@hiauly1.hia.nrc.ca> <alpine.DEB.2.00.1106291537330.30885@artax.karlin.mff.cuni.cz> <alpine.DEB.2.00.1106291643090.6496@artax.karlin.mff.cuni.cz>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1106291643090.6496@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 29 Jun 2011, Mikulas Patocka wrote:

> > Now, if we are getting stack trace from "g" function, the code scanner 
> > sees both
> >         ldo 144(%r30),%r30
> >         ldo -144(%r30),%r30
> 
> No, it actually stops when frame_size == (e->Total_frame_size << 3)
> 
> But I still don't understand the purpose of decoding those stack pointer 
> decrement instruction. Due to bug in the code, every such stack pointer 
> decrement adds 0x100000000 to the frame size and causes a crash.

Understand.  The purpose of decoding the stack pointer adjustments
probably was to handle the case where the .callinfo frame size information
is missing or wrong.  This is probably a remnant from when binutils was
generating incorrect unwind data...

Thus, you are correct that the negative adjustments should be ignored.
In large frames, I believe that the adjustment is done in more than
one instruction.

It is quite unlikely that the pc in a backtrace will occur before
the positive adjustment or after the negative adjustment.

If the above is a problem, it probably would be fairly simple to
check whether the pc lies between the entry point and the positive
adjustment.  Similarly, for the negative adjustment.  In both cases,
the adjustments have to be in the same code basic block as the
entry/return.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
