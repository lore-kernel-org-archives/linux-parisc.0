Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA02859
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Nov 2000 13:28:25 -0700
Date: Sat, 25 Nov 2000 12:28:40 -0800
From: "David O'Brien" <obrien@FreeBSD.org>
To: "H . J . Lu" <hjl@valinux.com>
Cc: Alan Modra <alan@linuxcare.com.au>, Ulrich Drepper <drepper@cygnus.com>,
        John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Message-ID: <20001125122840.D96258@dragon.nuxi.com>
Reply-To: obrien@FreeBSD.org
References: <20001121165327.A12804@valinux.com> <Pine.LNX.4.21.0011221258270.16860-100000@front.linuxcare.com.au> <20001121191129.A4978@valinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001121191129.A4978@valinux.com>; from hjl@valinux.com on Tue, Nov 21, 2000 at 07:11:29PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 07:11:29PM -0800, H . J . Lu wrote:
> When I was at the IA64 ABI meeting yesterday, we were looking at the
> EI_OSABI issue. Everyone at the IA64 ABI meeting agreed that what
> Ulrich and I had said was the correct understanding.
> 
> "The e_ident[EI_OSABI] value identifies the operating system and ABI
> to which the object is targeted" just means if the e_ident[EI_OSABI]


Then is this *extremely* misleading text going to be changed???
"the operating system and" needs to be deleted in the _official_
_published_ specification.

-- 
-- David  (obrien@FreeBSD.org)
