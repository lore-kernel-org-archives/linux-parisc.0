Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA2FE4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 05:24:56 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7931FB005; Fri, 23 Feb 2001 12:25:35 +0000 (GMT)
Date: Fri, 23 Feb 2001 12:25:35 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Paul Bame <bame@fc.hp.com>
Cc: Alan Modra <alan@linuxcare.com.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010223122535.I4660@linuxcare.com>
References: <20010222130359.F1129@linuxcare.com> <Pine.LNX.4.21.0102230011340.14557-100000@front.linuxcare.com.au> <20010222170050.B4660@linuxcare.com> <E14Vzmc-0007Zm-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14Vzmc-0007Zm-00@noam.fc.hp.com>; from bame@fc.hp.com on Thu, Feb 22, 2001 at 10:44:02AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 10:44:02AM -0700, Paul Bame wrote:
> 
> I thought I'd write a pipe test program for laughs.  Don't run this
> unless you want to cry -- it locks up my machine (both narrow
> and wide kernels) after not very many trials, though 'ping' still works.
> On a wide kernel, a TOC caught it in __down_interruptible but that
> could be normal.

Interesting, this kills my almost-cvs-head kernel, but it works
fine on one of my old kernels from Jan 11th.  Sorry Alan, fixincl
fails the same on my Jan 11th kernel.

Also, it works on cvs head under strace, but that kind of synchronises
the two ends of the pipe so you get alternating reads and writes.

Richard
