Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCB12482A
	for <parisc-linux@parisc-linux.org>; Mon,  9 Apr 2001 18:13:06 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA08115;
	Tue, 10 Apr 2001 10:12:51 +1000
Date: Tue, 10 Apr 2001 10:12:51 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building GDB - how exactly ?
In-Reply-To: <3AD21CD6.C0ED4C77@dot.at>
Message-ID: <Pine.LNX.4.21.0104101003570.7474-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 9 Apr 2001, Christoph Plattner wrote:

> What are the correct steps to build a working GDB for 
> 
> 1. HOST = i385-linux, TARGET = hppa-linux + gdbserver !
> 	(without server already success, but I am not shure, to have
> 	 done it correctly)

I haven't been building gdb for remote debugging, so I'm not sure how it
will go.  Should work, I think.

> 2. Native HPPA-LINUX gdb

I use the following to build a native gdb using a cross compiler from
x86-linux

/src/parisc/gdb/configure --build=i686-linux --host=hppa-linux
--target=hppa-linux --prefix=/usr --disable-shared --disable-nls

and the following to build natively

/src/parisc/gdb/configure --prefix=/usr --build=hppa-linux
--host=hppa-linux --target=hppa-linux --disable-nls

It's critical that you have up to date kernel header files available from
/usr/include/linux and /usr/include/asm, **for a 32 bit kernel**
regardless of whether you're running a 32 bit or 64 bit kernel.  This will
probably change soon as the ptrace interface is likely to change.

-- 
Alan Modra
