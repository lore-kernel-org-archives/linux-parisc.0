From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 12:13:37 -0700
Message-ID: <200809081213.37705.david-b@pacbell.net>
References: <1220889205.8074.16.camel@localhost.localdomain> <200809081119.45074.david-b@pacbell.net> <1220899189.8074.58.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755166AbYIHTNt@vger.kernel.org>
In-Reply-To: <1220899189.8074.58.camel@localhost.localdomain>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, James Bottomley wrote:
> On Mon, 2008-09-08 at 11:19 -0700, David Brownell wrote:
> > On Monday 08 September 2008, James Bottomley wrote:
> > > Put it back again by making RTC_CLASS 
> > > unselectable if the architecture is parisc.
> > 
> > Easier if those distros just wouldn't select RTC_CLASS then.  :)
> 
> Yes, but think of distro config people rather like users ... if you can
> prevent them from doing something stupid, it's a good idea.  In this
> case, there's currently no way anyone should ever select RTC_CLASS on
> parisc, so we should make that clear in the Kconfig file.

Preventing them from doing stupid stuff is exactly why we
have Kconfig prevent both legacy *AND* framework RTC code
from being selected.  :)

Of course stupidity is infinite, and we didn't know about
this particular instance in advance...


> > And long term, better to work with RTC_CLASS.  Eliminate that
> > crufty asm-parisc/rtc.h file and one more GEN_RTC user; and
> > share more widely-used infrastructure.
> > 
> > If I read things right, that would be easy:  the PARISC RTC is
> > two firmware calls, ptc_tod_{read,set}(), which would map to
> > RTC class {read,set}_time() methods of about six lines each.
> > The RTC framework can do UIE emulation, if needed.
> 
> OK, I can look at that, but in the mean time could we make the option
> that causes the damage unselectable?

I'd worry if "the mean time" takes too long.  But lacking a
PARISC laptop to fix this on, I'm unlikely to complain much.


>	 This is technically a regression 
> because before your patch GEN_RTC would override RTC_CLASS, now it's the
> other way around.

Well, previously there was no override ... I think you mean
that parisc just completely ignored RTC_CLASS, treating it
like junk DNA.

- Dave
