Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15344482A
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 19:02:11 -0600 (MDT)
Received: Received: [from squeak.local (async239-ade-isp-4.nas.one.net.au [203.101.93.240])
	by mail-ob03.one.net.au  with SMTP id f4M11vW21715
	for <parisc-linux@parisc-linux.org>; Tue, 22 May 2001 11:02:06 +1000 (EST)]
From: amodra@one.net.au
Date: Tue, 22 May 2001 10:37:40 +0930
To: Matthew Wilcox <matthew@wil.cx>
Cc: Paul Bame <bame@riverrock.org>, parisc-linux@parisc-linux.org,
	bame@www.riverrock.org
Subject: Re: [parisc-linux] More unaligned references
Message-ID: <20010522103740.L30444@squeak.one.net.au>
References: <20010521225006.I23718@parcelfarce.linux.theplanet.co.uk> <matthew@wil.cx> <m151y8p-001VltC@bame.riverrock.org> <20010521234050.J23718@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010521234050.J23718@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Mon, May 21, 2001 at 11:40:50PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, May 21, 2001 at 11:40:50PM +0100, Matthew Wilcox wrote:
> On Mon, May 21, 2001 at 04:27:07PM -0600, Paul Bame wrote:
> > FYI in case others run across it, this was discovered to be the ".plt-1" bug.
> > To find out, use 'objdump -h' to figure out where .plt is loaded.  Then add
> > 0x4800 plus 0xfb plus the dp register (r27).  If that's .plt-1 you've found
> > the bug which is/should-be squashed in recent bits.
> 
> Not convinced.  Yes, this is in fact .plt-1.  However, that bug is
> supposed to be both fixed in this version of binutils and an assert
> added to catch it happening.  However, no assert is being tripped.
> FWIW, the offending caller is:
> 
>      1d0:       eb e0 00 00     b,l 1d8 <create_server_config+0x5c>,r31
>                         1d0: R_PARISC_PCREL17F  $$dyncall

A shared library created with the "bad" binutils exports millicode syms it
isn't supposed to, which the linker later rejects, resulting in .plt-1
references.  The assert should still have triggered...

A quick check whether a library is good is:
nm --dynamic <lib> | grep '\$\$'

This will show exported millicode syms since they start with '$$'.

Alan
