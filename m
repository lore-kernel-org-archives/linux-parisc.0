Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amaretto.propagation.net (unknown [216.97.21.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53D97482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 14:09:00 -0700 (MST)
Received: from death.mega-tokyo.com (host217-39-45-85.in-addr.btopenworld.com [217.39.45.85])
	by amaretto.propagation.net (8.8.5/8.8.5) with ESMTP id PAA21993
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 15:06:02 -0600
Message-Id: <5.1.0.14.2.20020129205648.00a80ec8@pop.freeserve.net>
Date: Tue, 29 Jan 2002 21:10:17 +0000
To: parisc-linux@lists.parisc-linux.org
From: Dark Fiber <dfiber@mega-tokyo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] cross compilation
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

hi. i'm new to the list (slowly going back through the archives).
whats the current gcc status? can i use the cvs from gnu.org? or
do i use the parisc-linux.org version?

i need to build elf64 gcc/binutils for hppa... on my i386 freebsd box.

i need to crosscompile gcc... but all the notes on crosscomp
on the website talk about glibc and other nasty things as well as
requiring the linux kernel in the cross compile build! erk!
but i'm reading that as glibc requires the linux kernel, so i'm
hoping to avoid all that.

it also talks about the debian version of binutils? what makes
the debian binutils different from the standard ones and apply
the hppa patches?

unfortunatly i wont be able to get into doing all this till the weekend,
so i'm just trying to prepare myself ahead of time. (mm planning!)
taking notes. scribbling all over scrap paper.

i've got a sinking feeling i wont be able to build it, but we will see
how it goes. i'm hoping the hppa patches are all generic enough that
i can use standard binutils, etc, otherwise i'll be in a world of trouble.

then its a case of just folling your excellent XC faq...

my intention is to port freebsd to a 64bit lp64(depending..) kernel.
not a serious official freebsd port, but something i want to undertake.
i'm hoping to concentrate on the pa8* cpu series and up. nothing might
come of this whatsoever, but i'm willing to put a little time in and play
around. i think i'm mad, but hey, it takes all kinds! ^_^

but it all depends on getting over that first stumbling block of elf64-hppa
cross compiler working...

-Stuart 'just another mad aussie in london' George


-Dark Fiber <dfiber@mega-tokyo.com>

[FAQ] Write Your Own Operating System
         http://www.mega-tokyo.com/os
Sarien Sierra AGI Emulator
         http://www.mega-tokyo.com/sarien
3x3 Eyes Fanfiction Archive
         http://www.mega-tokyo.com/pai
AD&D UnderDark Roguelike
         http://www.mega-tokyo.com/underdark
Roguelike News II
         http://www.mega-tokyo.com/rlnews
