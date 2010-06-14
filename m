From: Matt Fleming <matt@console-pimps.org>
Subject: Re: [PATCH 4/5] parisc: Remove *(.text.*) pattern from the linker script
Date: Mon, 14 Jun 2010 20:13:50 +0100
Message-ID: <877hm1zatt.fsf@linux-g6p1.site>
References: <1276519112-11649-1-git-send-email-matt@console-pimps.org> <1276519112-11649-4-git-send-email-matt@console-pimps.org> <1276528859.5374.29.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-arch@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	linux-kernel@vger.kernel.org,
	Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1276528859.5374.29.camel@mulgrave.site>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 14 Jun 2010 10:20:59 -0500, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> This would destroy all of the named parisc text ordering we do above the
> removed line because now you'd have swept up all the function sections
> before we get to them, won't it?

Argh, sorry, you're completely right. I was a bit overzealous with this
change. I'll drop it. In fact, given the very specific things that
parisc does with the .text.* sections, this entire series makes no sense
- it doesn't make sense to change TEXT_TEXT in a way that means parisc
can no longer use it.

Thanks for the review, James.
