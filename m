Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 731E24844
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Sep 2003 19:55:34 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19zmoB-0003wR-JO; Thu, 18 Sep 2003 01:38:07 +0100
Date: Thu, 18 Sep 2003 01:38:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
Subject: Re: [parisc-linux] 64-bit kernel builds with gcc-3.4 experimental cross.
Message-ID: <20030918003807.GP21596@parcelfarce.linux.theplanet.co.uk>
References: <20030917161800.GB30176@systemhalted> <200309171643.h8HGhJlw013649@hiauly1.hia.nrc.ca> <20030917225406.GG30176@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030917225406.GG30176@systemhalted>
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

On Wed, Sep 17, 2003 at 06:54:07PM -0400, Carlos O'Donell wrote:
> On Wed, Sep 17, 2003 at 12:43:18PM -0400, John David Anglin wrote:
> > > hppa64-linux-ld: Relocatable linking with relocations from format
> > > elf32-hppa-linux (sched.o) to format elf32-hppa-linux (kernel.o) is not
> > > supported
> > 
> > As far as I know, there is no multi-arch support in ld or as.
> > There isn't multi-arch support in GCC either.  You need separate
> > compilers for 32 and 64 bits.
> 
> Separate compilers yes. Separate linker and assembler no.
> I thought I could use '--enable-targets=hppa64-linux' in binutils.

I think that only works for some parts of binutils -- specifically not ld.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
