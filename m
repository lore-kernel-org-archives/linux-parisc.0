Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.rz.uni-ulm.de (gemini.rz.uni-ulm.de [134.60.246.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id D97DD4892
	for <parisc-linux@parisc-linux.org>; Wed, 26 Mar 2003 04:51:57 -0700 (MST)
Date: Wed, 26 Mar 2003 12:51:40 +0100
From: Markus Schaber <markus.schaber@student.uni-ulm.de>
To: m.delahaye@esiee.fr (Matthieu Delahaye)
Cc: davidm@hpl.hp.com, willy@debian.org, adriano@satec.es,
	linux-ia64@linuxia64.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: [Linux-ia64] Linux, Itanium and PA/RISC
Message-Id: <20030326125140.6f2b7f7c.markus.schaber@student.uni-ulm.de>
In-Reply-To: <20030326100746.GA21703@charrue.esiee.fr>
References: <001f01c2f1f1$e772d4b0$6620a4d5@tsatec.int>
	<20030324121037.GI31008@parcelfarce.linux.theplanet.co.uk>
	<15999.23084.647629.868320@napali.hpl.hp.com>
	<20030326100746.GA21703@charrue.esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hi,

m.delahaye@esiee.fr (Matthieu Delahaye) wrote:

> >   Matthew> No.  You certainly can't run a PA-RISC kernel on an IA64
> >   Matthew> box, just like you can't run an x86 kernel on an ia64
> >   box.
> > Ugh, that's not strictly true.  You definitely can boot x86 linux
> > and windows 98 on Itanium.  I believe the same is true for Itanium 2
> > if you have Intel's firmware, though I have never tried that myself.
> ...And perhaps you don't forget to add support for the chipset in the
> x86/hppa kernel. 

You definitely need IA64 Linux to make real use of an Itanium2 Machine.
(I was able to "play" on an HP 4-Way machine for some weeks.)

However, Itanium chips support X86 Emulation in Hardware, so they can
run any X86 Software without further software support (however, the
software is limited to the X86 capabilities regarding Memory Capacity
etc., and it is _really slow_, every P3/P4/Athlon at the same MHz is
uncomparable.)

As far as I know, the PA-Risc instruction mapping is done with lots of
software help. The concept is a bit like JIT-Compilers in Java. (It is
easier to do this when having a RISC code with equal instruction length
compared to ugly X86 code.) As long as my knowledge is correct, you
therefore cannot run any PA-RISC OS directly on the Hardware, but you
can run PA-RISC Software in any OS that supports the instruction
mapping, maybe one can even run a PA-RISC OS inside a virtual PA-RISC
Machine on Itaniums. (However I don't know any such VM.)

Markus
