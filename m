Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA09730
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 04:02:40 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 24 Jan 2001 11:06:34 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 574B3B005; Wed, 24 Jan 2001 10:55:08 +0000 (GMT)
Date: Wed, 24 Jan 2001 10:55:08 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "Phillip D. Beal" <pdbeal@louisville.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel Swapping yet?
Message-ID: <20010124105507.D3571@linuxcare.com>
References: <20010122104912.B56158@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010122104912.B56158@athena.louisville.edu>; from pdbeal@louisville.edu on Mon, Jan 22, 2001 at 10:49:12AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 10:49:12AM -0500, Phillip D. Beal wrote:
> Hey,
> 
> I've been playing around with the 715 I got to boot, and I've found an
> odd occurance.  If I open an existing file with vi, and hit escape the
> kernel crashes.  It doesn't matter if the file is locally or on a remote
> system it does it either way.  So, I remeber the instructions from the
> PA-Linux 0.1 CD saying the kernel isn't useing the swap space yet.  Is
> this still true? I know the problem is not vi because the kernel dies
> even if I use vi on the remote system.  The PARISC system dies when I go
> to hit ESC to exit insert mode of vi.

I don't recall ever seeing that problem on my 715/75.  What kernel and
userspace are you using?

Richard
