Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA10694
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 18:30:26 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 00:30:49 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA25984;
	Wed, 13 Sep 2000 11:30:18 +1100
Date: Wed, 13 Sep 2000 11:30:18 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Cary Coutant <cary@cup.hp.com>
cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Incompatibility of PIC and non-PIC
In-Reply-To: <200009122039.NAA04751@adlmail.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0009131125280.23150-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 12 Sep 2000, Cary Coutant wrote:

> >Shared libraries work well, but we've got a bigger problem now.  Our
> >PIC and non-PIC code models are mutually incompatible in a big way
> >(due to the use of %r19 And, it seems, while it's fine if non-PIC
> >can't be used in shared libraries, it's not all right if PIC can't be
> >linked statically.
> > ...
> >For that matter how does 32-bit HP/UX solve this issue?
> 
> When the HP-UX linker is building an a.out, it converts any r19-relative 
> references into dp-relative references by rewriting the instructions. It 
> still creates a linkage table entry if necessary (i.e., it doesn't 
> rewrite a DLT-indirect reference as a direct dp-relative reference), but 
> the linkage table entries are accessed via the dp register instead of r19.

That's not too bad a hack.  I took a different approach and generate
import stubs when PIC code is detected during a static link.  David, is
there some problem with this (or was this a very old email that Cary was
replying to)?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
