Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CC034A19
	for <parisc-linux@parisc-linux.org>; Sun, 11 Mar 2001 16:41:58 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA24862;
	Mon, 12 Mar 2001 10:41:39 +1100
Date: Mon, 12 Mar 2001 10:41:39 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
In-Reply-To: <20010311095548.W18113@tausq.org>
Message-ID: <Pine.LNX.4.21.0103121021450.23407-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 11 Mar 2001, Randolph Chung wrote:

> > You've already started down the path to recovery:
> >   build and install binutils with --disable-shared,
> >   build and install gcc with --enable-languages=c --disable-shared,
> >   build and install glibc
> 
> trying to do this last step, but am getting some pretty odd results.
> 
> when trying to build linuxthreads, the glibc compile dies when trying to
> assemble linuxthreads/crti.S
> 
> it's also complaining about .init and .fini. From what I gather the
> compile takes pt-initfini.c, translates it to a .S file, then does some
> sed magic to remove some sections. This leaves a .S that has a .PROC and
> .ENTRY for .init/.fini without a corresponding .EXIT and .PROCEND

Huh?  My builds don't try to build crti.o for linuxthreads.  crti.o is
built in csu/ from sysdeps/hppa/elf/initfini.c.  Perhaps you have a
configuration problem.  What options did you pass to configure?  Hmm, more
importantly, what source are you compiling?  I don't have a pt-initfini.c
in my source tree!

$ cd /usr/src/parisc/glibc
$ cvs update -d -ko
? sysdeps/hppa/hppa64
$ find . -name '*initfini*'
./sysdeps/generic/initfini.c
./sysdeps/hppa/elf/initfini.c
./sysdeps/ia64/elf/initfini.c
./sysdeps/s390/initfini.c
./sysdeps/sh/elf/initfini.c

> i thought LT and RT were #define's of some sort, but i don't see them
> defined any place. 

LT' and RT' are field selectors.  They give you the LR' and RR' values
respectively of the offset from %r19 to the .got slot for the symbol.  The
presense of these selectors also tells the asembler/linker to set up .got
entries for the symbol.

Alan
-- 
Linuxcare
