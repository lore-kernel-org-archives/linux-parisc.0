Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA21001
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 16:30:04 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel2.hp.com (Postfix) with ESMTP id 137283C2
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 16:33:56 -0700 (MST)
To: Alan Modra <alan@linuxcare.com.au>
Cc: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>,
        parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Weird compile problems 
In-Reply-To: Message from Alan Modra <alan@linuxcare.com.au>
   of "Wed, 31 Jan 2001 10:25:21 EST." <Pine.LNX.4.21.0101310956430.19209-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0101310956430.19209-100000@front.linuxcare.com.au> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jan 2001 16:36:03 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010130233603.B823337C90@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alan Modra writes...

> On Tue, 30 Jan 2001, Paul J.Y. Lahaie wrote:
> 
> [about pehc CVS devel branch gcc]
> > And fixincl (the progrma that does the subst) is taking 0% CPU (from top)
> > 10727 pjlahaie   9   0   712  712   520 S      20  0.0  0.5   0:00 fixincl
> 
> Yeah, fixincl dies for me too.  I'd been putting it down to some sort of
> kernel problem, and just disabled fixinc (gcc/Makefile:STMP_FIXINC).
> Other than that, I get a successful bootstrap, and both kernel & glibc
> compile natively - except that `make' died randomly in the glibc build,
> and I currently have a ld.so.1 that segfaults.

I suspect that your make actually died during the make install right? This is 
the problem that John Marvin and I are working on. The pthread changes that he 
made broke things that use librt and libpthread. In our current nfsroot that 
is tar, make, and sleep. For now we're using a static make to complete the 
install. Once I have a new glibc package built I will do new new 
make,tar,sleep stuff too.

> Hmm, looking at what I just wrote, you can hardly call it a "successful
> bootstrap".  I'm investigating the ld.so.1 problem - at least that one is
> reproducable.

I was seeing that here too but John wasn't. We're currently trying to 
determine the differences in our build environments. What system are you 
building on and what nfsroot/kernel are you using?

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
