Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA10854
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Oct 1999 12:56:37 -0600
Date: Fri, 1 Oct 1999 20:56:25 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] commit FP coproc enable code?
Message-ID: <19991001205625.J16533@suse.de>
References: <19991001151206.H17134@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991001151206.H17134@thepuffingroup.com>; from Phil Schwan on Fri, Oct 01, 1999 at 03:12:06PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> o FP enable via writing cr10 (CCR) register. Not doing this the "right"
>   way - which is to use PDC_COPROC but it will work for all PA1.1
>   platforms.

Why is not using PDC_COPROC not the right way ?  It should do exactly the same
thing, modulo machines without FPU (for which we do not provide emulation
anyway) and firmware bugs ...

> ===================================================================
> RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/head.S,v
> retrieving revision 1.32
> diff -u -r1.32 head.S
> --- head.S      1999/08/31 19:25:23     1.32
> +++ head.S      1999/09/30 22:43:03

I would prefer to do this somewhere after the kernel is loaded, in C, surrounded
by a pair of printks, so we know whether it is this that hangs the machine.
