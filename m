Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kryten.int.wirex.com (unknown [216.161.55.93])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57474482A
	for <parisc-linux@parisc-linux.org>; Tue,  3 Apr 2001 19:47:09 -0600 (MDT)
Received: (from steve@localhost)
	by kryten.int.wirex.com (8.11.0/8.11.0) id f341l1c08765
	for parisc-linux@parisc-linux.org; Tue, 3 Apr 2001 18:47:01 -0700
Date: Tue, 3 Apr 2001 18:47:00 -0700
From: Steve Beattie <steve@wirex.net>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building packages, problems with printf
Message-ID: <20010403184700.A8618@wirex.net>
References: <20010325220223.G31126@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Mon, Mar 26, 2001 at 09:03:34AM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 26, 2001 at 09:03:34AM +1000, Alan Modra wrote:
> On Sun, 25 Mar 2001, Matthew Wilcox wrote:
> 
> > Something we've been running into when building packages is the problem
> > that printf is defined as a macro when using gcc 2.97.  This should be
> > resolved by doing the following:
> > 
> > #include <stdio.h>
> > #undef printf
> 
> That's cheating!  The real fix is to turn
> 
> printf (foo_string,
> #if SOMETHING
> abc_param
> #else
> xyz_param
> #endif
> );
> 
> into
> 
> #if SOMETHING
> printf (foo_string, abc_param);
> #else
> printf (foo_string, xyz_param);
> #endif

Actually, another solution is:

(printf) (foo_string,
#if SOMETHING
abc_param
#else
xyz_param
#endif
);

The parentheses surrounding printf prevent macro expansion -- the C
standard explicitly states that it must. We discovered this in the
course of developing FormatGuard, a patch to glibc that turns printf
and the like into macros as a means of preventing format string attacks
(see http://www.immunix.org/formatguard.html for details).

-- 
Steve Beattie                               Don't trust programmers? 
<steve@wirex.net>                         Complete StackGuard distro at
http://immunix.org/~steve/                         immunix.org
