Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CBAE4A01
	for <parisc-linux@parisc-linux.org>; Fri, 28 Sep 2001 11:37:24 -0600 (MDT)
Date: Fri, 28 Sep 2001 13:37:18 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] what i did on my holidays
Message-ID: <20010928133718.N2611@megatonmonkey.net>
References: <20010927161004.E16096@parcelfarce.linux.theplanet.co.uk> <20010927204451.F2611@megatonmonkey.net> <20010928152312.A3460@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010928152312.A3460@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Sep 28, 2001 at 03:23:12PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> > 	- ./sysdeps/ia64/dl-fptr.c changes for try_lock
> > 	- Put change back into dpatch
> 
> Excellent.
> 
> > 	- dpkg-buildpackage now makes it to the point of using a new
> > 	  ld.so.1, which seg's... so I'm back to figuring out why.
> 
> Yes.  If you decode that long command, it's probably running zic -- that's
> the first thing it attempts to build natively.
> 
> By the way, there's glibc 2.2.4-2 out now; I don't know what changes
> BenC made to it.  In any case, I thought we'd decided the problem was
> with a bogus C compiler (since 2.2.3-9 now fails to build).  Any update
> on getting a compiler which fixes this?
>

No, I never get as far as making zic.

make[2]: Entering directory `/raid/glibc_build2/glibc-2.2.4/glibc-2.2.4/sunrpc'
/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/elf/ld.so.1 --library-path /raid/glibc_build2/glibc-2.2.4/hppa-linux/obj:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/math:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/elf:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/dlfcn:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/nss:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/nis:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/rt:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/resolv:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/crypt:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/linuxthreads /raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/sunrpc/rpcgen -Y `gcc -print-file-name=cpp | sed 's|/cpp$||'` -c rpcsvc/bootparam_prot.x -o /raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/sunrpc/xbootparam_prot.T
make[2]: *** [/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/sunrpc/xbootparam_prot.stmp] Segmentation fault
make[2]: Leaving directory `/raid/glibc_build2/glibc-2.2.4/glibc-2.2.4/sunrpc'
make[1]: *** [sunrpc/others] Error 2
make[1]: Leaving directory `/raid/glibc_build2/glibc-2.2.4/glibc-2.2.4'
make: *** [all] Error 2

Is the last I see. And I'm pretty confused by _what_ is's really trying to do.
It's calling ld.so.1? Or is this just really ld? I wigged out the first time
I saw it fail here. I've seen many weird things, but the internals of glibc are
_really_ wired.

execve("/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/elf/ld.so.1", ["/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/elf/ld.so.1", "--library-path", "/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/math:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/elf:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/dlfcn:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/nss:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/nis:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/rt:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/resolv:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/crypt:/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/linuxthreads", "/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/sunrpc/rpcgen", "-Y", "/lib", "-c", "rpcsvc/bootparam_prot.x", "-o", "/raid/glibc_build2/glibc-2.2.4/hppa-linux/obj/sunrpc/xbootparam_prot.T"], [/* 18 vars */]) = 0
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++

Out of curiosity, is there a gdb package built for debian-hppa?
(Last I checked there was none)

I'll try to debug this on the weekend.
Though my 712/60 has just gone dead on serial and ssh :}

---

I'll give glibc-2.2.4-2 a shot, and see what the difference are.
I assume that -2 is on the debian pool already.

Who is BenC? :)
Is he making general glibc changes or hppa specific ones?

Who's working on the compiler for parisc?

c. 
