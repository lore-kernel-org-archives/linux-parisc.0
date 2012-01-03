From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Happy New Year PARISC
Date: Tue, 03 Jan 2012 09:32:05 -0600
Message-ID: <1325604725.3185.3.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>
	 <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>
	 <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>
	 <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>
	 <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com>
	 <4F031B1A.4010908@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4F031B1A.4010908@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2012-01-03 at 10:13 -0500, John David Anglin wrote:
> On 1/3/2012 6:50 AM, Carlos O'Donell wrote:
> > On Mon, Jan 2, 2012 at 6:12 PM, John David Anglin<dave.anglin@bell.net>  wrote:
> >> None of this worked.  Attached patch as it stands.  Comments and testing
> >> appreciated.
> > Could you clarify what you mean by "none of this worked?"
> >
> 
> I tried eliminating the flushes that occur in kunmap_atomic on PA8800 
> and PA8900
> after the calls to clear_user_page and copy_user_page by defining 
> clear_user_highpage
> and copy_user_highpage.  I had thought the flushes weren't necessary.  
> There's something
> about this that I don't understand.  Why do we need to flush 
> non-equivalent page mappings
> that aren't used?

But they are used:  Your work makes sure that all user space mappings
are equivalent.  However, because of the way Linux sets up kernel
mappings (from the pfn array and offsets) the user virtual address and
kernel virtual address almost never are.  kmap is exclusively used so
the kernel can access a user page, and at that point, we need to flush
because we've set up an inequivalent alias (even if it's only done for
read)

kmap/kmap_atomic is used in more than just copy/flush ... or did you
mean that you removed the kmap calls in copy/flush and the whole thing
doesn't work (rather than as you imply you removed the flush in kunmap?)

> Also tried:
> #define flush_cache_dup_mm(mm)        do { } while (0)
> 
> In both cases, init died causing a panic at boot.  Maybe there's 
> something missing at
> startup.
> 
> Most arch's have the above define for flush_cache_dup_mm.  Our define 
> really hurts
> fork performance.  The GCC testsuite takes almost twice as long to run 
> on linux as hpux.
> On the other hand, build times are fairly comparable.

I'll look into this, but I fear, because of the way the pa cache is
tagged, we'll have to keep the flush (same goes for flush_cache_mm).

James


