Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA05735
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 17:50:22 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA19155;
	Wed, 3 Jan 2001 11:53:12 +1100
Date: Wed, 3 Jan 2001 11:53:12 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@fc.hp.com>
cc: parisc-linux@puffin.external.hp.com
Subject: Re: where to put 64 bit libmilli?
In-Reply-To: <E14DX12-0005tW-00@noam.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0101031001320.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 2 Jan 2001, Paul Bame wrote:

> I have source code for HP's 64-bit millicode and am working on making
> it compilable with our tool chain.  But the bigger question is where
> do I put it?
> 
> Right now millicode is part of libgcc.a in top-of-branch gcc, but I
> seem to recall some linker magic, and when/if that happens I don't
> know where to put the millicode stuff.

Distributing libmilli with gcc makes sense as it is gcc that makes use of
the millicode routines, however there's a chicken and egg problem with the
linker.  Once we enable the automagic libmilli search, ld will complain if
it can't find libmilli.a.  That will make the binutils test suite fail 
until gcc is installed.  Hmm, I suppose binutils could install a dummy
libmilli.a to get around that problem.

Anyway, the place to put the source is gcc/config/pa/, installing
libmilli.a to ${prefix}/lib/ for native tool-chains and to
${prefix}/${target}/lib for cross tool-chains.  Err, come to think of it,
the 64 bit linker doesn't yet have the libmilli.a search capability.
Also, we probably want to name the 64 bit millicode library libmilli64.a
so a multi-target linker can choose the right millicode library.

So until I get my act together and find time for some binutils/gcc work,
it may be best to continue putting the millicode functions into libgcc.

Alan
-- 
Linuxcare.  Support for the Revolution.
