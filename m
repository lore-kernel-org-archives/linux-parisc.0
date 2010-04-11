From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] Avoid interruption in critical region in entry.S
Date: Sun, 11 Apr 2010 14:45:13 -0400
Message-ID: <20100411184512.GA8981@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100411171255.GC7756@hiauly1.hia.nrc.ca> <1271010253.2806.656.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1271010253.2806.656.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 11 Apr 2010, James Bottomley wrote:

> On Sun, 2010-04-11 at 13:12 -0400, John David Anglin wrote:
> > On Fri, 09 Apr 2010, Carlos O'Donell wrote:
> > 
> > > We need to start splitting up your giant "stability" patch into
> > > manageable chunks.
> > 
> > Here's the fourth chunk.  Am I being paranoid?
> 
> Could you explain what difference you think it makes ... because I can't
> really see one.
> 
> All the patch seems to be doing is setting r1 to the stack pointer with
> interrupts enabled and then copying the value with interrupts disabled,
> which is fine, but I don't see how it's different from setting r30
> directly from the task entry within the interrupt disabled region.

If it is possible for an interruption such as a data TLB miss to occur
in the instruction that loads the stack pointer, then the period while
interrupts are disabled will be extended while the TLB miss is handled.
So, placing the load outside the critical region keeps the period where
interrupts are disabled as short as possible.

It may not be a big deal here but in time critical code issues like this
are important.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
