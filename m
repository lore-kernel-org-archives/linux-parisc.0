Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA05562
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 08:37:41 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 14:39:09 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA25331;
	Tue, 11 Jul 2000 00:38:58 +1000
Date: Tue, 11 Jul 2000 00:38:58 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] problems with gcc 2.96
In-Reply-To: <87lmzacbp2.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0007110027540.12784-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 10 Jul 2000, David Huggins-Daines wrote:

> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > I've already told willy this, but this is due to the C++ support.
> > Configure with --enable-languages=c for the time being until it's sorted.
> 
> Ah, sorry, it happens if you configure glibc without linuxthreads
> support (because, then, you have no spinlocks, obviously).  It seems
> that we've already got the appropriate locking primitives
> there... trying it now.

Yeah, I got enthusiastic about implementing linuxthreads, and put in
support for parisc style spinlocks using ldcw (Load and Clear Word).
We need to grab a lock by clearing it so the locks need to be initialised
to non-zero, which is exactly opposite to other glibc spinlocks.  My
enthusiasm waned when I hit a missing syscall - forget what it was now.

-- 
Linuxcare.  Support for the Revolution.
