From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 17:39:33 -0500 (EST)
Message-ID: <20081208223933.ADCC14EF8@hiauly1.hia.nrc.ca>
References: <119aab440812081414h2145521axb3bc426db9c776be@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org,
	grundler@parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812081414h2145521axb3bc426db9c776be@mail.gmail.com> from "Carlos O'Donell" at Dec 8, 2008 05:14:28 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >> How long have futex's been used on hppa?  I guess we really need to try
> >> run the glibc testsuite on a new kernel.
> >
> > The futex function has been available almost since futex's first appeared
> 
> I realized I didn't answer your question here.
> 
> The futex function should only be called when compiling glibc with nptl enabled.
> 
> Otherwise nothing in glibc should make futex calls.
> 
> Broken futex calls shouldn't crash the kernel.

The kernel doesn't crash since Helge's stack backtrace fix.  We are
just getting a lot of segfaults in application code.

I'm fairly certain libc6 in debian testing is still built with linuxthreads.
I'm not sure libc is actually making futex calls, but one is compiled
into _dl_fixup.  I suppose I could add a printk in the kernel to see
if futex's are being used.

I'm currently building debian libc6.  In a quick attempt, I wasn't
successful in building the glibc cvs source.  It pushes hard to get
you to configure with nptl.  My build with linuxthreads failed with
a type size problem.

I'll try the testsuite with this build on my current kernel.  If that
works, I'll flip to 2.6.28.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
