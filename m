Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D3D44A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 13:22:03 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Vflm-00035C-00; Wed, 21 Feb 2001 13:21:50 -0700
Date: Wed, 21 Feb 2001 13:21:50 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
Message-ID: <20010221132150.L31164@parcelfarce.linux.theplanet.co.uk>
References: <E14VeQa-0002ZJ-00@the-village.bc.nu> <200102211940.LAA17629@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102211940.LAA17629@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Feb 21, 2001 at 11:40:42AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 21, 2001 at 11:40:42AM -0800, Grant Grundler wrote:
> Alan Cox wrote:
> > Can the prefetch on the hppa fault ?
> 
> "PARISC 2.0 Arch" page 6-11 says:
>    If one of those exceptions would occur, the prefetch
>    is simply ignored, but any base register modification
>    specified by the instruction still occurs.
> 
> I haven't checked if the errata contradicts this.
> The whole point of prefetch which be undermined if it could fault.

The errata only covers which way around the LDD/LDW instructions are.

-- 
Revolutions do not require corporate support.
