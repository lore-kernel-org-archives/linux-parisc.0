Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78A3F4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:40:26 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA03043;
	Thu, 22 Feb 2001 22:39:57 +1100
Date: Thu, 22 Feb 2001 22:39:57 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
In-Reply-To: <E14Vtsu-0003xc-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.21.0102222237440.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Alan Cox wrote:

> > > thinking there is no data available.  Secondary problem is that the kernel
> > > returns the wrong thing when the syscall is interrupted.
> > 
> > But I just tried this on my x86 as well (2.2 kernel):
> 
> The return is ok. Its 'deep magic' strace sees

Err, are you saying I'm barking up the wrong gum tree, and there's nothing
wrong with the read() in my strace output?
