Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 693964844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 16:56:14 -0600 (MDT)
Date: Wed, 17 Sep 2003 18:54:07 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
Subject: Re: [parisc-linux] 64-bit kernel builds with gcc-3.4 experimental cross.
Message-ID: <20030917225406.GG30176@systemhalted>
References: <20030917161800.GB30176@systemhalted> <200309171643.h8HGhJlw013649@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309171643.h8HGhJlw013649@hiauly1.hia.nrc.ca>
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

On Wed, Sep 17, 2003 at 12:43:18PM -0400, John David Anglin wrote:
> > Any thoughts? This ld was from a multi-arch binutils that had
> > enable-targets with hppa64-linux.
> > 
> > ---
> > hppa64-linux-ld  -r -o kernel.o sched.o dma.o fork.o exec_domain.o
> > panic.o printk.o module.o exit.o itimer.o info.o time.o softirq.o
> > resource.o sysctl.o acct.o capability.o ptrace.o timer.o user.o signal.o
> > sys.o kmod.o context.o
> > hppa64-linux-ld: Relocatable linking with relocations from format
> > elf32-hppa-linux (sched.o) to format elf32-hppa-linux (kernel.o) is not
> > supported
> 
> As far as I know, there is no multi-arch support in ld or as.
> There isn't multi-arch support in GCC either.  You need separate
> compilers for 32 and 64 bits.

Separate compilers yes. Separate linker and assembler no.
I thought I could use '--enable-targets=hppa64-linux' in binutils.

c.
