Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 952F34A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:09:03 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8AEBAB005; Thu, 22 Feb 2001 11:09:49 +0000 (GMT)
Date: Thu, 22 Feb 2001 11:09:49 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010222110949.B1129@linuxcare.com>
References: <Pine.LNX.4.21.0102100106450.27808-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0102221609360.14557-100000@front.linuxcare.com.au> <20010222110054.A1129@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010222110054.A1129@linuxcare.com>; from rhirst@linuxcare.com on Thu, Feb 22, 2001 at 11:00:54AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 11:00:54AM +0000, Richard Hirst wrote:
> 10:50:05 alarm(1)                       = 0
> 10:50:05 read(0, "my buffer\n", 10)     = -512
> 10:50:06 --- SIGALRM (Alarm clock) ---
> 10:50:06 +++ killed by SIGALRM +++
> 
> 
> Looks like the primary problem is that your read is blocking for 10 seconds
> thinking there is no data available.  Secondary problem is that the kernel
> returns the wrong thing when the syscall is interrupted.

But I just tried this on my x86 as well (2.2 kernel):

alarm(1)                                = 0
read(0, 0xbffff740, 0xa)                = -1 (errno 512)
--- SIGALRM (Alarm clock) ---
+++ killed by SIGALRM +++

Richard
