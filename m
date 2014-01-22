From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: don't use module_init for non-modular core
 pdc_cons code
Date: Wed, 22 Jan 2014 11:20:50 -0800
Message-ID: <1390418450.2372.83.camel@dabdike.int.hansenpartnership.com>
References: <52df8b79.riaKReY/RZZi2qvy%fengguang.wu@intel.com>
	 <1390414784-6472-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: fengguang.wu@intel.com,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1390414784-6472-1-git-send-email-paul.gortmaker@windriver.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2014-01-22 at 13:19 -0500, Paul Gortmaker wrote:
> The pdc_cons.c code is always built in.  It will never be modular,
> so using module_init as an alias for __initcall is rather
> misleading.
> 
> Fix this up now, so that we can relocate module_init from
> init.h into module.h in the future.  If we don't do this, we'd
> have to add module.h to obviously non-modular code, and that
> would be a worse thing.

I don't buy this.  We've already had an argument about using MODULE_
tags in non-modular code here:

http://marc.info/?t=138947344500007

The consensus was that we'd continue to do so, so that would seem to
invalidate the rationale for doing this patch set.

Without the rationale, this is churn for no gain, so I'd rather not do
it.

Thanks,

James


