From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 09 Apr 2010 11:48:56 -0400
Message-ID: <1270828136.8319.126.camel@mulgrave.site>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca>
	 <20100408224446.96F294FA3@hiauly1.hia.nrc.ca>
	 <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com>
	 <20100409151330.GA23889@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100409151330.GA23889@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2010-04-09 at 11:13 -0400, John David Anglin wrote:
> On Fri, 09 Apr 2010, Carlos O'Donell wrote:
> 
> > We need to start splitting up your giant "stability" patch into
> > manageable chunks.
> 
> I agree.  What I posted was not intended as a submission.  Some
> of the changes aren't mine, some are cleanups, some are "obvious",
> some are not obvious and may well be wrong, or inefficient.
> 
> I posted the change to not clobber r19 on fork/clone syscalls,
> but there has been no response to it.

Theory looks fine to me ... although Helge sees no difference in
behaviour, I'd be happy to apply on the principle of no harm and
theoretically necessary.

> I will try split up the change this weekend.
> 
> > For example, are the futex fixes anywhere for Kyle to pickup?
> 
> The futex fixes are Helge's and were posted to the list on Wed,
> 03 Feb 2010 23:03:49 +0100 along with Helge's minifail3.c.
> 
> The change to syscall.S in the above post included two hunks from me.
> I removed Helge's portion so that I could enable LWS locking on UP
> builds because of the concern that a page fault on COW memory could
> cause user code to be scheduled in the locking code.
> 
> I think there is merit in using __atomic_user_hash, etc, but it
> will take a bit of work to make it available in UP kernels.
> I think Helge's change to fork.c is probably not necessary.

I'm fairly convinced we need the flush on kmap(_atomic) as well if the
user had dirtied the page.  Right at the moment if the aliases are
inequivalent (which they are about 99.9% of the time) we're in danger of
using stale data in the kernel.  We also need a flush on kunmap if the
kernel has dirtied the page.

James


