Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 75945482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 16:05:16 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA10225;
	Mon, 26 Mar 2001 09:03:34 +1000
Date: Mon, 26 Mar 2001 09:03:34 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building packages, problems with printf
In-Reply-To: <20010325220223.G31126@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 25 Mar 2001, Matthew Wilcox wrote:

> Something we've been running into when building packages is the problem
> that printf is defined as a macro when using gcc 2.97.  This should be
> resolved by doing the following:
> 
> #include <stdio.h>
> #undef printf

That's cheating!  The real fix is to turn

printf (foo_string,
#if SOMETHING
abc_param
#else
xyz_param
#endif
);

into

#if SOMETHING
printf (foo_string, abc_param);
#else
printf (foo_string, xyz_param);
#endif

Earn brownie points sending off proper fixes to package maintainers. :)

> fixing glibc to not do that seems to not be an option.  ANSI explicitly
> allows any of the functions in libc to also be defined as macros.

Alan
-- 
Linuxcare
