Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA04235
	for <parisc-linux@puffin.external.hp.com>; Fri, 6 Oct 2000 17:08:54 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 0648B8FD
	for <parisc-linux@thepuffingroup.com>; Fri,  6 Oct 2000 16:09:54 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id QAA02166
	for <parisc-linux@thepuffingroup.com>; Fri, 6 Oct 2000 16:14:03 -0700 (PDT)
Message-Id: <200010062314.QAA02166@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] udelay() inconsistent 
In-reply-to: Your message of "Thu, 05 Oct 2000 18:24:21 PDT."
             <200010060124.SAA05210@milano.cup.hp.com>
Date: Fri, 06 Oct 2000 16:14:02 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
...
> I ditched the __LP64__ code in sba_iommu.c (uses asm("lci..")) in order to
> use the same code as 32-bit uses. The scsi "CACHE TEST" failures went away.

Fixed. Thanks to John Marvin for pointing out ">>44" should
be ">>12" for both narrow/wide-mode kernels...

> So if anyone can make the LCI work...I'll think of a suitable reward...
> (something better than a 710...perhaps a 4GB, 7200RPM, SE SCSI disk?
> or a dual headed GSC graphics card?)

<sigh>....jsm has all the toys he wants already...we'll think of
something...

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
