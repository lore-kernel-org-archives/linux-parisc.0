Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32BAD4844
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Aug 2003 20:43:03 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19q1tD-0001Dj-NO; Fri, 22 Aug 2003 03:42:59 +0100
Date: Fri, 22 Aug 2003 03:42:59 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Subject: Re: [parisc-linux] [glibc] fixing delayed exceptions in hppa
Message-ID: <20030822024259.GC18834@parcelfarce.linux.theplanet.co.uk>
References: <20030822013931.GD31872@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030822013931.GD31872@systemhalted>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Aug 21, 2003 at 09:39:31PM -0400, Carlos O'Donell wrote:
> Just a quick RFC on this patch. I've generated a register interlock on
> the previous exception raising result register. This _should_ cause delayed
> exceptions to be flushed immediately on all processors.
> 
> Under my C3K testsetup it fixes the test-fenv failure that was
> specifically related to "child raises exception, exception comes in late
> and kills parent after child called join."

Yay.

> Comments more than welcome, I'll be submitting this upstream if nobody
> has any quibles with my gcc asm :)

I can quibble!

>        /* One example of a invalid operation is 0 * Infinity.  */
>        double d = HUGE_VAL;
> -      __asm__ __volatile__ ("fmpy,dbl %1,%%fr0,%0\n\t"
> +      __asm__ __volatile__ ("fmpy,dbl %2,%%fr0,%0\n\t"
>  			    /* FIXME: is this a proper trap barrier? */
> -			    "fcpy,dbl %%fr0,%%fr0" : "=f" (d) : "0" (d));
> +			    "fcpy,dbl %0,%1" : "=f" (d), "=f" (dummy) : "0" (d));
>      }

Surely this, and all the others, would be clearer written as:

	__asm__ __volatile__ (
		"	fmpy,dbl %0,%%fr0,%0\n"
		"	fcpy,dbl %0,%1\n"
		: "+f" (d), "=f" (dummy));

ie turn the \t into a literal tab, and use the "+" syntax rather than the
"=" and "0" syntax.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
