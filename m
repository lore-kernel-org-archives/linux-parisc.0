Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C5C7482A
	for <parisc-linux@parisc-linux.org>; Thu,  3 May 2001 11:31:25 -0600 (MDT)
Message-Id: <200105031731.KAA21930@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] ELFOSABI_LINUX
Date: Thu, 3 May 2001 10:28:58 -0700
From: Cary Coutant <cary@cup.hp.com>
To: <amodra@one.net.au>, "Matthew Wilcox" <willy@ldl.fc.hp.com>
Cc: <parisc-linux@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>  1) We use relocations that are not mentioned in the Processor
>     Specific ABI supplement, eg. R_PARISC_PCREL12F.

What is the relocation number? I'll add it. (I hope it's not 13 or 73. 
We've recently added PCREL17FI and PCREL22FI, respectively.)


>  2) PA-ELF32 uses relocations that the parisc psabi says are only
>     used by ELF64, eg. R_PARISC_IPLT.  No big deal, except of course
>     they're a different size.

Is it still 129? I'll add it.

If there are any other relocations you use that aren't in HP's ELF/PA 
document, please let me know.


>  3) PA-ELF32 uses DT_INIT and DT_FINI, which the psabi specifically
>     says are not used (by HPUX).  Again no big deal.

I agree -- no big deal. The document that says they're not used is 
specifically referring to HP-UX, and was not meant to apply to other 
operating systems.


>  4) HPUX sets a precedent for PARISC, and uses a non-zero OSABI value

Well, we *do* use vendor-specific extensions. Plenty of them, in fact.


-cary
