Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3186C4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:52:56 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6F173B005; Thu, 22 Feb 2001 11:53:42 +0000 (GMT)
Date: Thu, 22 Feb 2001 11:53:42 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010222115342.D1129@linuxcare.com>
References: <E14Vtsu-0003xc-00@the-village.bc.nu> <Pine.LNX.4.21.0102222237440.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102222237440.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Feb 22, 2001 at 10:39:57PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 10:39:57PM +1100, Alan Modra wrote:
> On Thu, 22 Feb 2001, Alan Cox wrote:
> 
> > > > thinking there is no data available.  Secondary problem is that the kernel
> > > > returns the wrong thing when the syscall is interrupted.
> > > 
> > > But I just tried this on my x86 as well (2.2 kernel):
> > 
> > The return is ok. Its 'deep magic' strace sees
> 
> Err, are you saying I'm barking up the wrong gum tree, and there's nothing
> wrong with the read() in my strace output?

I think the problem is simply that there is no data for the read to
pick up, so it hangs until the alarm goes off.

Richard
