Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6F614A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 15:01:18 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VhJl-0004kK-00; Wed, 21 Feb 2001 15:01:01 -0700
Date: Wed, 21 Feb 2001 15:01:01 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Grant Grundler <grundler@cup.hp.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
Message-ID: <20010221150101.N31164@parcelfarce.linux.theplanet.co.uk>
References: <200102211940.LAA17629@milano.cup.hp.com> <E14VgwR-0002nT-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14VgwR-0002nT-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Wed, Feb 21, 2001 at 09:36:54PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 21, 2001 at 09:36:54PM +0000, Alan Cox wrote:
> Excellent, our proposed list walking uses kind of depend on being able
> to prefetch off the end of lists and stuff. Also I assume its prefetching a
> cache line and the prefetch for write prefetches it exclusive ?

Yes.
