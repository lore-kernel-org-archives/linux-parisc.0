From: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH] fix RTC_CLASS regression with PARISC
Date: Mon, 8 Sep 2008 11:19:44 -0700
Message-ID: <200809081119.45074.david-b@pacbell.net>
References: <1220889205.8074.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220889205.8074.16.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Monday 08 September 2008, James Bottomley wrote:
> Put it back again by making RTC_CLASS 
> unselectable if the architecture is parisc.

Easier if those distros just wouldn't select RTC_CLASS then.  :)

And long term, better to work with RTC_CLASS.  Eliminate that
crufty asm-parisc/rtc.h file and one more GEN_RTC user; and
share more widely-used infrastructure.

If I read things right, that would be easy:  the PARISC RTC is
two firmware calls, ptc_tod_{read,set}(), which would map to
RTC class {read,set}_time() methods of about six lines each.
The RTC framework can do UIE emulation, if needed.

- Dave

