Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 379FB4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 15:46:40 -0700 (MST)
Subject: Re: [parisc-linux] SMP: We have ignition
To: alan@linuxcare.com.au (Alan Modra)
Date: Tue, 27 Feb 2001 22:49:20 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), bame@fc.hp.com (Paul Bame),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0102280914480.21714-100000@front.linuxcare.com.au> from "Alan Modra" at Feb 28, 2001 09:24:53 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14Xsvq-0004PB-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Hmm, alpha, ia64, mips64, sparc64 and s390 use an `unsigned long'
> __kernel_size_t while arm, i386, m68k, mips, ppc, sh and sparc use
> `unsigned int'.  I think the precedent is there for us to use
> `unsigned int' for 32 bit, and `unsigned long' for 64 bit.

Ok
