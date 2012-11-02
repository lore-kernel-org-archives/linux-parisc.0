From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: possible virtual aliasing issues on parisc ?
Date: Fri, 02 Nov 2012 09:34:24 +0000
Message-ID: <1351848864.2439.18.camel@dabdike.int.hansenpartnership.com>
References: <CANN689E4p3woSkdLavyyPA2gZUmVvOAW4w0R6fo9exRPQDa=JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Michel Lespinasse <walken@google.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CANN689E4p3woSkdLavyyPA2gZUmVvOAW4w0R6fo9exRPQDa=JA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[cc to parisc list]

On Thu, 2012-11-01 at 16:45 -0700, Michel Lespinasse wrote:
> Hi,
> 
> I am currently working on a patchset to avoid the brute-force search
> in arch_get_unmapped_area functions (and also pushes some of it back
> into generic code). So far I've only sent it as an RFC on linux-mm.

Actually, I read linux-mm pretty closely (at least for the cgroups
stuff), but I must have missed it.  In general, if you need the
attention of arch maintainers, linux-arch is the right list to cc.

> Looking at the arch/parisc/kernel/sys_parisc.c implementation of
> get_shared_area(), I do have a concern though. The function basically
> ignores the pgoff argument, so that if one creates a shared mapping of
> pages 0-N of a file, and then a separate shared mapping of pages 1-N
> of that same file, both will have the same cache offset for their
> starting address.
> 
> This looks like this would create obvious aliasing issues. Am I
> misreading this ? I can't understand how this could work good enough
> to be undetected, so there must be something I'm missing here ???

No, I think it does.

I also think the pgoff != 0 case is rare, so it doesn't show very often.
To test this, I booted up with a printk for every pgoff != 0 and it
didn't trigger, so it's probably not seen in the ordinary course of
events.

Finally, we have a test for inequvalent aliases in flush_dcache_page, so
even if we do get the inequivalency, we'll resolve it correctly.

James


