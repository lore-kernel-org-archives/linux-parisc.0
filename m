Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp7ve.mailsrvcs.net (smtp7vepub.gte.net [206.46.170.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64C474A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 08:49:29 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-239-223.pittpa.adsl.bellatlantic.net [151.201.239.223])
	by smtp7ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id PAA2133214
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 15:56:41 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3A93E383.5B9ABAF2@neuronet.pitt.edu>
Date: Wed, 21 Feb 2001 10:49:23 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Cannot build 02/18/2001 glibc
References: <Pine.LNX.4.21.0102211847030.9668-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> 
> > I've looked briefly at the main configure script and compared it to the
> > last revision, but cannot figure out why it uses the x86 assembler.
> > Perhaps the mantainer can resolve this.
> 
> After having problems the first time, did you start from a fresh
> directory?  If config.cache exists, you'll pick up old values.

Yes, I scrapped everything and began with binutils. I use a separate
directory for building each package (as indicated in the recipe) and
removed them. Any config.cache went away with those dirs.

Let me know if there is something else I can do to fix this.
-- 
     Rafael
