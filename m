Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CDE24A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 16:37:51 -0700 (MST)
Message-Id: <200102012340.PAA01589@milano.cup.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] $$mulI missing 
In-reply-to: Your message of "Fri, 02 Feb 2001 10:33:43 PST."
             <Pine.LNX.4.21.0102021033060.19209-100000@front.linuxcare.com.au>
Date: Thu, 01 Feb 2001 15:39:57 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> On Fri, 2 Feb 2001, Alan Modra wrote:
> 
> > Errm.  32 bit might still want them.  #ifndef __LP64__ ?
> 
> Ahh, missed seeing your second commit :-)

Exactly. My oversight. Thanks to Paul (Bame) for asking me the
same question. And the answer was: doh! of course! :^)

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
