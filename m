Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C971B4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 05:17:33 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14WHA7-0007kA-00; Fri, 23 Feb 2001 12:17:27 +0000
Date: Fri, 23 Feb 2001 12:17:27 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc & profiling
Message-ID: <20010223121727.C16261@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0102232156560.9345-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102232156560.9345-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Fri, Feb 23, 2001 at 10:31:32PM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 23, 2001 at 10:31:32PM +1100, Alan Modra wrote:
> This is a little embarrassing.  I've just discovered our mainline gcc has
> all the nice profiling code in config/pa/pa.c, PROFILE_HOOK defined in
> config/pa/pa.h, but no support for PROFILE_HOOK in function.c.  Oops.  No
> profiler calls in generated code.
> 
> pehc merge from sourceware was before PROFILE_HOOK was added, but I was
> working from a later merge when developing the code. :-(

So we're going to need another gcc merge?

On the subject of `Embarrassing', I've been making an assertion for a
while which I've just discovered is out of date.  gcc supports scheduling
for processors after pa7200.  It now supports -mschedule= 700, 7100,
7100LC, 7200, 8000 and -march= 1.0, 1.1 and 2.0.

So I think I'm going to add config options to the kernel to allow people
to optimise for this, just like x86 does.

-- 
Revolutions do not require corporate support.
