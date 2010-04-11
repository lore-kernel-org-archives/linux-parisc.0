From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] Avoid interruption in critical region in entry.S
Date: Sun, 11 Apr 2010 13:24:13 -0500
Message-ID: <1271010253.2806.656.camel@mulgrave.site>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca>
	 <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
	 <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
	 <20100411171255.GC7756@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100411171255.GC7756@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2010-04-11 at 13:12 -0400, John David Anglin wrote:
> On Fri, 09 Apr 2010, Carlos O'Donell wrote:
> 
> > We need to start splitting up your giant "stability" patch into
> > manageable chunks.
> 
> Here's the fourth chunk.  Am I being paranoid?

Could you explain what difference you think it makes ... because I can't
really see one.

All the patch seems to be doing is setting r1 to the stack pointer with
interrupts enabled and then copying the value with interrupts disabled,
which is fine, but I don't see how it's different from setting r30
directly from the task entry within the interrupt disabled region.

James


