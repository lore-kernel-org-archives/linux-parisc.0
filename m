Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.cern.ch (smtp1.cern.ch [137.138.128.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06AF34A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 03:37:26 -0700 (MST)
Sender: Jes.Sorensen@cern.ch
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
References: <Pine.LNX.4.21.0102221609360.14557-100000@front.linuxcare.com.au>
From: Jes Sorensen <jes@linuxcare.com>
Date: 22 Feb 2001 11:37:22 +0100
In-Reply-To: Alan Modra's message of "Thu, 22 Feb 2001 17:37:55 +1100 (EST)"
Message-ID: <d3ofvv57h9.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Alan" == Alan Modra <alan@linuxcare.com.au> writes:

Alan> Nothing suspicious in previous rt_sigaction calls as far as I
Alan> could see, and putting in a debugging printk in do_sigaction
Alan> shows sa_flags is being set correctly, to 0x40.

I'd start by looking at the parisc kernel and glibc implementation of
pipe(). It's a somewhat special system call since it has two return
values.

I managed to wreck pipe() on the ia64 for a while as well.

Jes
