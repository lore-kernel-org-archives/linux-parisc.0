Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 203E74A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 12:32:25 -0700 (MST)
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 21 Feb 2001 18:55:51 +0000 (GMT)
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <200102211850.KAA17436@milano.cup.hp.com> from "Grant Grundler" at Feb 21, 2001 10:50:53 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14VeQa-0002ZJ-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> My reading of the "PA 2.0 Enhancements" in the "PA-RISC 2.0 Architecture"
> is pretty clear this is for PA2.0 CPU's only. #ifdef __LP64__ is needed.
> 
> I'd like to encourage use prefetching on bcopy/checksum type loops.
> It will help perf *alot*.

Can the prefetch on the hppa fault ?
