Received: from mail.valinux.com (smtp-fwd.valinux.com [198.186.202.196])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id NAA03582
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Nov 2000 13:31:39 -0700
Received: from osmium.hdqt.valinux.com
	([10.3.1.14] helo=valinux.com ident=mail)
	by mail.valinux.com with esmtp (Exim 3.16 #1 (Debian))
	id 13zm10-0006QV-00; Sat, 25 Nov 2000 12:33:42 -0800
Received: by valinux.com (Postfix, from userid 561)
	id 3FE03AD11; Sat, 25 Nov 2000 12:33:40 -0800 (PST)
Date: Sat, 25 Nov 2000 12:33:40 -0800
From: "H . J . Lu" <hjl@valinux.com>
To: "David O'Brien" <obrien@FreeBSD.org>
Cc: Alan Modra <alan@linuxcare.com.au>, Ulrich Drepper <drepper@cygnus.com>,
        John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Message-ID: <20001125123340.A25382@valinux.com>
References: <20001121165327.A12804@valinux.com> <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au> <20001121191129.A4978@valinux.com> <20001125122840.D96258@dragon.nuxi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001125122840.D96258@dragon.nuxi.com>; from obrien@FreeBSD.org on Sat, Nov 25, 2000 at 12:28:40PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Nov 25, 2000 at 12:28:40PM -0800, David O'Brien wrote:
> On Tue, Nov 21, 2000 at 07:11:29PM -0800, H . J . Lu wrote:
> > When I was at the IA64 ABI meeting yesterday, we were looking at the
> > EI_OSABI issue. Everyone at the IA64 ABI meeting agreed that what
> > Ulrich and I had said was the correct understanding.
> > 
> > "The e_ident[EI_OSABI] value identifies the operating system and ABI
> > to which the object is targeted" just means if the e_ident[EI_OSABI]
> 
> 
> Then is this *extremely* misleading text going to be changed???
> "the operating system and" needs to be deleted in the _official_
> _published_ specification.
> 

I will bring this issue up to ia64 psABI and gABI.

-- 
H.J. Lu (hjl@valinux.com)
