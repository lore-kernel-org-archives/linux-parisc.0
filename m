Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 827794A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Mar 2001 21:18:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14ZPyb-00018e-00; Sun, 04 Mar 2001 04:18:33 +0000
Date: Sun, 4 Mar 2001 04:18:33 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sym53c8xx driver with 64-bit kernel on C200.
Message-ID: <20010304041833.B1865@parcelfarce.linux.theplanet.co.uk>
References: <3AA1BA3F.A7C79E31@uswest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AA1BA3F.A7C79E31@uswest.net>; from rbradetich@uswest.net on Sat, Mar 03, 2001 at 08:45:03PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 03, 2001 at 08:45:03PM -0700, Ryan Bradetich wrote:
> When I run OUTL(nc_dsp,pc) through the preprocessor the statement gets
> expanded into this:
> 
> _gsc_writel(((__builtin_constant_p((__u32)((((pc))))) ? ({ __u32 __x =
> (((((pc))))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |
> (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) &
> (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >>
> 24) )); }) : __fswab32(((((pc))))))),(void *)((char *)np->reg +
> (((size_t) &((struct ncr_reg *)0)->nc_dsp))));

I guess you'd like this decoded?  Let's see.  `pc' is clearly not a constant,
so __builtin_constant_p returns false, so we can simplify this down to:

_gsc_writel(__fswab32(pc) ,
 (void *)((char *)np->reg + (((size_t) &((struct ncr_reg *)0)->nc_dsp))));

which leads me to ask `what value does `pc' have?'

I suspect you want to put debugging code in _gsc_writel to tell you where
you're trying to perform IO to.

My suspicion is that you're writing to the 32 bit IO space in 64-bit mode,
which is juts not going to work.

-- 
Revolutions do not require corporate support.
