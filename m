Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EAFE482A
	for <parisc-linux@parisc-linux.org>; Tue, 17 Apr 2001 13:57:20 -0600 (MDT)
Subject: Re: [parisc-linux] FB cleanups
To: matthew@wil.cx (Matthew Wilcox)
Date: Tue, 17 Apr 2001 20:57:37 +0100 (BST)
Cc: jes@linuxcare.com (Jes Sorensen),
	alan@lxorguk.ukuu.org.uk (Alan Cox), parisc-linux@parisc-linux.org
In-Reply-To: <20010417192205.A28724@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Apr 17, 2001 07:22:05 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14pbbX-00035t-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > Yes, except that ISA has stronger semantics than PCI.
> 
> You need to issue a read after a write to be sure the write hit the
> device on ISA?

In some cases yes.
