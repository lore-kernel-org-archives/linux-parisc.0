Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA14322
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 01:13:37 -0700
Date: Mon, 15 Nov 1999 08:09:13 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: dkennedy@thepuffingroup.com
Cc: Alex deVries <adevries@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] real mode stuff.
Message-Id: <19991115080913.A30917@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911142338080.7516-100000@vodka.thepuffingroup.com> <Pine.LNX.4.10.9911150031280.2071-100000@grasshopper.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9911150031280.2071-100000@grasshopper.thepuffingroup.com>
List-ID: <linux-parisc.vger.kernel.org>

> How much real mode code is there?

> The i386 processor starts up in a real mode as well.  Linux enters protected
> mode in head.S very quickly.

On an i386, in fact, there is practically no reason to re-enter real mode after
you enabled address translation.

On PA-RISC, there is.

We have to get back into real mode to call firmware.

We get back into real mode when an interruption (HP's term for what the rest
of the world calls exception, fault, trap, interrupt or whatever) occurs, and
cannot re-enable address translation in all cases (the obvious ones being TLB
insert traps (we currently _do_ re-enable address translation, but we are rely-
ing on undefined behaviour in doing so), the less obvious one HPMC (as it is
not guaranteed we didn't get it because our MMU just died or the RAM containing
the page tables disappeared) and whichever interruptions show up in profiles
(we need floating-point completion to get IEEE-compliant behaviour in some
cases, and this might hit FP-intensive code)).

> If real mode on the PA-RISC is only used during initialization, then
> I don't think that it warrants a separate directory.  If real mode is
> used during normal operation, then I say sure.

For real-mode code executed during boot, there are well-defined locations
(arch/yourarch/boot, arch/yourarch/kernel/head.S), and we could just go on
stuffing real-mode code into files in arch/parisc/kernel, but

 a) we want to have some of this code written in C, which is difficult / un-
obvious with the real-mode files residing in the same directory as the rest
of the kernel.

 b) we might want to reuse some of the code for a more sophisticated boot
loader (which some people seem to have decided will be called PALO (boring
name, isn't it ?)).

 c) a lot of this code is very critical, will need to be changed for both SMP
systems and PA2.0 ones, and deserves the attention of old-time PA-RISC assembly
hackers much more than Linux-specific code in arch/parisc/kernel.

 d) some day, the parisc port won't be a new port stealing codes from the
established old ones, but some new port will steal code from us.  Most of the
code in arch/parisc/real is extremely unportable, so we can just tell whoever
is going to do that port to skip this directory.

I hope this clarifies things a bit.

	Philipp Rumpf
