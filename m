Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id E55114A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 05:43:13 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA21048;
	Fri, 23 Feb 2001 23:43:07 +1100
Date: Fri, 23 Feb 2001 23:43:07 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
In-Reply-To: <20010223122535.I4660@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0102232341330.9345-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 23 Feb 2001, Richard Hirst wrote:

> Also, it works on cvs head under strace, but that kind of synchronises
> the two ends of the pipe so you get alternating reads and writes.

Yes, I found the same result in a test prog I wrote.
