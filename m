Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA24363
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 21:18:04 -0700
Date: Sat, 30 Dec 2000 23:16:39 -0500 (EST)
From: R P Herrold <herrold@owlriver.com>
To: Grant Grundler <grundler@cup.hp.com>, <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] xchg/cmpxchg defined in wrong place? 
In-Reply-To: <200012310155.RAA25264@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.30.0012302306560.13921-100000@swampfox.owlriver.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 30 Dec 2000, Grant Grundler wrote:

> I moved all the xchg/cmpxchg related code from include/asm-i386/system.h
> to include/asm-i386/atomic.h and built an x86 kernel (natively) but didn't
> boot it. Booting the kernel shouldn't be necessary since mis-use will
> result in a linker error (xchg undefined).

I've always liked this one:

Theory and Practice, distinguished:  In Theory, there is no
difference between Theory and Practice; in Practice, there
always is ...

I'm going to try spinning up a G50, and sniffing at a K220 for
parisc linux ... 735/125 on the way in ... I'd like to leave
HP-UX on the K220 and 'dual boot' -- but it is such a pain to
hook a console up -- Any thoughts on an OS/2 style Boot
Manager leaving 'next boot' semaphore flags behind ...

-- Russ
