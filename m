Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop4.phnx.uswest.net (phnxpop4.phnx.uswest.net [206.80.192.4])
	by dsl2.external.hp.com (Postfix) with SMTP id 03B7A4A19
	for <parisc-linux@parisc-linux.org>; Sun, 11 Mar 2001 09:57:27 -0700 (MST)
Date: Sun, 11 Mar 2001 09:55:48 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
Message-ID: <20010311095548.W18113@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20010310102154.P18113@tausq.org> <Pine.LNX.4.21.0103111254230.23407-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0103111254230.23407-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Sun, Mar 11, 2001 at 01:55:45PM +1100
List-ID: <linux-parisc.vger.kernel.org>

> You've already started down the path to recovery:
>   build and install binutils with --disable-shared,
>   build and install gcc with --enable-languages=c --disable-shared,
>   build and install glibc

trying to do this last step, but am getting some pretty odd results.

when trying to build linuxthreads, the glibc compile dies when trying to
assemble linuxthreads/crti.S

in particular, it doesn't like the first and last instructions in the
following fragment:

        addil LT'.LC0,%r19
	stw %r2,-20(%r30)
        ldo 64(%r30),%r30
        ldw RT'.LC0(%r1),%r1

i thought LT and RT were #define's of some sort, but i don't see them
defined any place. 

it's also complaining about .init and .fini. From what I gather the
compile takes pt-initfini.c, translates it to a .S file, then does some
sed magic to remove some sections. This leaves a .S that has a .PROC and
.ENTRY for .init/.fini without a corresponding .EXIT and .PROCEND

i tried this both with gcc 2.96 and 2.97... wonder what's going on...

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
