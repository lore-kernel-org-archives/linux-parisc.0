From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: don't use module_init for non-modular core
 pdc_cons code
Date: Wed, 22 Jan 2014 11:57:49 -0800
Message-ID: <1390420669.2372.98.camel@dabdike.int.hansenpartnership.com>
References: <52df8b79.riaKReY/RZZi2qvy%fengguang.wu@intel.com>
		 <1390414784-6472-1-git-send-email-paul.gortmaker@windriver.com>
	 <1390418450.2372.83.camel@dabdike.int.hansenpartnership.com>
	 <52E01CF0.4040307@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: fengguang.wu@intel.com,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52E01CF0.4040307@windriver.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2014-01-22 at 14:33 -0500, Paul Gortmaker wrote:
> On 14-01-22 02:20 PM, James Bottomley wrote:
> > On Wed, 2014-01-22 at 13:19 -0500, Paul Gortmaker wrote:
> >> The pdc_cons.c code is always built in.  It will never be modular,
> >> so using module_init as an alias for __initcall is rather
> >> misleading.
> >>
> >> Fix this up now, so that we can relocate module_init from
> >> init.h into module.h in the future.  If we don't do this, we'd
> >> have to add module.h to obviously non-modular code, and that
> >> would be a worse thing.
> > 
> > I don't buy this.  We've already had an argument about using MODULE_
> > tags in non-modular code here:
> > 
> > http://marc.info/?t=138947344500007
> > 
> > The consensus was that we'd continue to do so, so that would seem to
> > invalidate the rationale for doing this patch set.
> > 
> > Without the rationale, this is churn for no gain, so I'd rather not do
> > it.
> 
> Hi James,
> 
> Thanks for the link.  Here is another one.
> 
> https://lkml.org/lkml/2014/1/21/434
> 
> In there I explain the rationale for doing this and what value add we
> get from it.  Perhaps you'll say those things aren't important, and
> then I guess we'll have to agree to disagree then... but I hope not.

Well, OK, so 1 is covered by the link I sent.  3 is an EDONTCARE because
we don't care when the console is initialised as long as it is. Your
reason 2 I'm not sure I understand.  module_exit() functions are
automatically discarded by the linker scripts ... if we have a problem
with reference to code in them it will cause a link failure.

I'm grateful for dumping all the spurious section mismatches caused by
HOTPLUG, I really am, but I'm seeing less benefit to this code churn.

James


