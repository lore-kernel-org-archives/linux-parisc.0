Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18973482A
	for <parisc-linux@parisc-linux.org>; Wed,  2 May 2001 17:46:37 -0600 (MDT)
Received: Received: [from squeak.local (async130-ade-isp-2.nas.one.net.au [203.101.90.131])
	by mail-ob03.one.net.au  with SMTP id f42NkQ322739
	for <parisc-linux@parisc-linux.org>; Thu, 3 May 2001 09:46:27 +1000 (EST)]
From: amodra@one.net.au
Date: Thu, 3 May 2001 09:17:35 +0930
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ELFOSABI_LINUX
Message-ID: <20010503091735.B5695@squeak.one.net.au>
References: <20010501213458.Y6063@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010501213458.Y6063@zumpano.fc.hp.com>; from willy@ldl.fc.hp.com on Tue, May 01, 2001 at 09:34:58PM -0600
List-ID: <linux-parisc.vger.kernel.org>

Let's see now.

  1) We use relocations that are not mentioned in the Processor
     Specific ABI supplement, eg. R_PARISC_PCREL12F.
  2) PA-ELF32 uses relocations that the parisc psabi says are only
     used by ELF64, eg. R_PARISC_IPLT.  No big deal, except of course
     they're a different size.
  3) PA-ELF32 uses DT_INIT and DT_FINI, which the psabi specifically
     says are not used (by HPUX).  Again no big deal.
  4) HPUX sets a precedent for PARISC, and uses a non-zero OSABI value

and probably other things I haven't thought of at the moment.

Alan
