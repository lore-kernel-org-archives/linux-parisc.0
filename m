Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 734404A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 00:51:12 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA15080;
	Wed, 21 Feb 2001 18:51:07 +1100
Date: Wed, 21 Feb 2001 18:51:07 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Cannot build 02/18/2001 glibc
In-Reply-To: <3A935BDC.E2475A98@neuronet.pitt.edu>
Message-ID: <Pine.LNX.4.21.0102211847030.9668-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I've looked briefly at the main configure script and compared it to the
> last revision, but cannot figure out why it uses the x86 assembler.
> Perhaps the mantainer can resolve this.

After having problems the first time, did you start from a fresh
directory?  If config.cache exists, you'll pick up old values.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
