Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDE9D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 14:47:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15bplh-00077v-00; Tue, 28 Aug 2001 21:47:29 +0100
Date: Tue, 28 Aug 2001 21:47:29 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828214729.E2995@parcelfarce.linux.theplanet.co.uk>
References: <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk> <20010828071743.A1289@megatonmonkey.net> <20010828155619.I18341@parcelfarce.linux.theplanet.co.uk> <20010828112900.B30657@megatonmonkey.net> <20010828194713.A2995@parcelfarce.linux.theplanet.co.uk> <20010828152221.B4741@megatonmonkey.net> <20010828204458.B2995@parcelfarce.linux.theplanet.co.uk> <20010828163639.C4741@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828163639.C4741@megatonmonkey.net>; from carlos@megatonmonkey.net on Tue, Aug 28, 2001 at 04:36:39PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 28, 2001 at 04:36:39PM -0400, Carlos O'Donell Jr. wrote:
> What are the major differences? Crosscompiling vs. Crossbuild?
> Better yet, where can I learn about those difference?

I don't think the differences between cross and native builds are
documented anywhere.

> So the native build of zic barfs. I'm not even sure if zic runs when
> you compile glibc by hand? Hrm... zic.c is 52,000 loc.. eww.

I would say it dies in the dynamic linker before zic is entered.

> Question:
> In theory since those patches are changes that haven't been merged upstream,
> should the only requirements be:
> 
> - Have 2.2.4 Original
> - Carry out any one of the dpatch's since they are dif'd against 2.2.4 Original
> - Then carry out the 2.2.4-1 patch

No.  The 2.2.4-1 patch adds the debian-specific patches to the tarball.
There's nowhere to get the hppa patch from if you don't apply the
2.2.4-1 patch.

> Quesiton:
> If the pool has the hppa changes commented out in the 0list file, does
> that mean that glibc2.2.4 is not available for hppa yet? (Since it fails to 
> compile? The first error probably being the Elf32_Addr* problem with
> that '& 3' fixed by a cast to (unsigned int)).

glibc 2.2.4 is indeed not yet available for hppa.  As it says in the
release announcement.

> > 
> > That's changing all the testandset to trylock.
> >
> 
> Why would that be in the hppa dpatch?

Because we can't implement testandset atomically & efficiently on hppa.
The places which use testandset actually just need trylock.

-- 
Revolutions do not require corporate support.
