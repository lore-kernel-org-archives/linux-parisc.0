Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32E924829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 16:29:53 -0700 (MST)
Date: Wed, 11 Dec 2002 23:29:45 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021211063321.GB10185@systemhalted>
Message-ID: <Pine.LNX.4.44.0212112313290.861-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 11 Dec 2002, Carlos O'Donell wrote:

> Subject: Re: [parisc-linux] Kernel crash when loggin in via ssh
>
> > Reading my previous post about the change in the Voodoo3 issue (Nov 26),
> > I realized that linux-2.4.20-rc1-pa7 obviously also worked.
> > This kernel was definitely compiled with gcc-3.0.4 (the one that
> > was in sid as of Nov 26).
> >
> > Yes, it might be a gcc issue ... haven't thought of that ...
> > I'll try to recompile the latest kernel with a gcc-3.0.4 - tomorrow!

It IS a gcc issue.

gcc-3.0_3.0.4-13 produces a working kernel, gcc-3.2-3.2.2-0pre0 produces
a miscompiled kernel (faulty networking, causes kernel crash).
I made NO updates whatsoever; same kernel configuration, just using gcc-3.0
insted of gcc-3.2. I just make a make clean; make dep; make vmlinux ...

Since now all my kernels compiled with gcc-3.0 were working, just when I
upgraded to gcc-3.2 the problems occured.

> So the urban legend goes that gcc-3.2 compiled kernels may infact
> produce mildly incorrect results in the networking code.

I think it is no urban legend anymore ... :-/
I've also see quite alot reports on p-l about miscompiled kernels with
anything other than gcc-3.0.4, actually several months ago; so I thought
these issues have been solved by now ...

> I have yet to verify this, and JDA seems to indicate that he has working
> kernels with gcc-3.2. While I've only recently tested gcc-3.0.x and
> gcc-3.1.x based compiles.
>
> I don't like urban legends >:} *Added item to Chrismas todo list*

Merry christmas then :-}

greetings max
