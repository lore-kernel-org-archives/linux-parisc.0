Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spawn.hockeyfiend.com (dsl092-073-086.bos1.dsl.speakeasy.net [66.92.73.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CE47482B
	for <parisc-linux@parisc-linux.org>; Sun,  4 Nov 2001 19:10:41 -0700 (MST)
Date: Sun, 4 Nov 2001 21:10:33 -0500 (EST)
From: "Christopher C. Chimelis" <chris@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org, bcollins@debian.org
In-Reply-To: <20011103233352.F505@tausq.org>
Message-ID: <Pine.LNX.4.21.0111042106311.25038-100000@spawn.hockeyfiend.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: hppa binutils/glibc updates
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

On Sat, 3 Nov 2001, Randolph Chung wrote:

> In a chroot built with debootstrap plus build-essential:
> - Rebuild binutils from sourceware cvs
> - Using new binutils, rebuild glibc (2.2.4-5) with am's latest patch
> 
> With these bits installed, the following were tested:
> - build and install wget (just a simple sanity test)
> - install and run libgtk1.2 and gkrellm
> - recompile and run python1.5 and apache
> 
> all these seem to be ok now. Before recompiling, things like python will
> die with a SIGILL

That's good news :-)  FYI, I work at Agilent now (formerly HP-owned
company) and am surrounded by PA-RISC machines.  I'm trying to weasel an
extra machine out of them, but have only been there two weeks so it may
take some extra time :-P

> Chris/Ben: can you let us know when we can expect new binutils/glibc?
> I'll forward the glibc patch to Ben separately.

I'm hoping for a new one soon.  I may not package it, however, due to some
flux in other platforms.  If we can work together to isolate the patches
that are needed for hppa, I'd be happy to include those in my next upload,
though (I already am planning one).

> If you can think of anything else that we should try to make sure
> everything works, please let us know.

If I think of something, I'll write ya.  Also, if I manage to get a
machine, I'm sure you'll be hearing from me (probably will be an Apollo
series 735, fyi...slow, but effective).

C
