Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46FC04844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 10:43:21 -0600 (MDT)
Message-Id: <200309171643.h8HGhJlw013649@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64-bit kernel builds with gcc-3.4 experimental cross.
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 17 Sep 2003 12:43:18 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
In-Reply-To: <20030917161800.GB30176@systemhalted> from "Carlos O'Donell" at Sep 17, 2003 12:18:01 pm
MIME-Version: 1.0
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

> Any thoughts? This ld was from a multi-arch binutils that had
> enable-targets with hppa64-linux.
> 
> ---
> hppa64-linux-ld  -r -o kernel.o sched.o dma.o fork.o exec_domain.o
> panic.o printk.o module.o exit.o itimer.o info.o time.o softirq.o
> resource.o sysctl.o acct.o capability.o ptrace.o timer.o user.o signal.o
> sys.o kmod.o context.o
> hppa64-linux-ld: Relocatable linking with relocations from format
> elf32-hppa-linux (sched.o) to format elf32-hppa-linux (kernel.o) is not
> supported

As far as I know, there is no multi-arch support in ld or as.
There isn't multi-arch support in GCC either.  You need separate
compilers for 32 and 64 bits.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
