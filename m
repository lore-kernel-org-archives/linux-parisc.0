From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: Happy New Year PARISC (take 2)
Date: Tue, 28 Feb 2012 23:56:05 +0100
Message-ID: <20120228225605.GA24038@glitch>
References: <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>
 <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>
 <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com>
 <4F031B1A.4010908@bell.net>
 <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com>
 <4F032C4C.10805@bell.net>
 <1325608972.3185.8.camel@dabdike.int.hansenpartnership.com>
 <4F034B6B.5020809@bell.net>
 <BLU0-SMTP5091B64E5E2C07CEDC0D41978C0@phx.gbl>
 <4F4CF28A.5050407@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4F4CF28A.5050407@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Tue, Feb 28, 2012 at 10:28:10AM -0500, John David Anglin wrote:
>
> Here is take 3.  Since take 2, I have tried mainly to explore
> performance issues.
> 
> The big difference is a new implementation of flush_cache_mm where I try to
> avoid the brutal flush of the whole cache.  This drops the full GCC
> build time at
> -j4 from about six hours nine minutes to three hours ten minutes on
> rp3440 (i.e.,
> almost by a factor two).  Build and check time is still a bit slower
> than HP-UX.
> There's probably more to tweak here.
> 
> Other changes made little difference (e.g., clear_page_asm).  I also
> explored
> the affect of prefetch operations in clear_page_asm and copy_page_asm, but
> the difference if any was in the noise.

I applied this patch to v3.3-rc5 and then tried to build eglibc 2.13-27,
unsuccessfully. Do you have any patch for it?

Thanks,
Domenico
