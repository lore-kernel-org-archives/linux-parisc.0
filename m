Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDE674A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 14:33:48 -0700 (MST)
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 21 Feb 2001 21:36:54 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
	parisc-linux@parisc-linux.org
In-Reply-To: <200102211940.LAA17629@milano.cup.hp.com> from "Grant Grundler" at Feb 21, 2001 11:40:42 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14VgwR-0002nT-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

>    If one of those exceptions would occur, the prefetch
>    is simply ignored, but any base register modification
>    specified by the instruction still occurs.
> 
> I haven't checked if the errata contradicts this.
> The whole point of prefetch which be undermined if it could fault.

Excellent, our proposed list walking uses kind of depend on being able
to prefetch off the end of lists and stuff. Also I assume its prefetching a
cache line and the prefetch for write prefetches it exclusive ?
