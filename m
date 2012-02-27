From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] parisc: dont unconditionally override CROSS_COMPILE for
 64 bit.
Date: Sun, 26 Feb 2012 19:30:38 -0500
Message-ID: <20120227003037.GE21842@windriver.com>
References: <1330298813-17262-1-git-send-email-paul.gortmaker@windriver.com>
 <201202261923.15167.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: <JBottomley@parallels.com>, <jejb@parisc-linux.org>,
	<kyle@mcmartin.ca>, <deller@gmx.de>,
	<linux-parisc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-next@vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201202261923.15167.vapier@gentoo.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[Re: [PATCH] parisc: dont unconditionally override CROSS_COMPILE for 64 bit.] On 26/02/2012 (Sun 19:23) Mike Frysinger wrote:

> On Sunday 26 February 2012 18:26:53 Paul Gortmaker wrote:
> > --- a/arch/parisc/Makefile
> > +++ b/arch/parisc/Makefile
> >
> > -CROSS_COMPILE	:= hppa64-linux-gnu-
> > +ifndef CROSS_COMPILE
> > + CROSS_COMPILE	:= hppa64-linux-gnu-
> > +endif
> 
> this should accomplish the same thing in practice:
> 	CROSS_COMPILE ?= hppa64-linux-gnu-

Good point, I'll wait for a bit in case I was missing something else
obvious, and then resend.

THanks,
P.

> -mike
