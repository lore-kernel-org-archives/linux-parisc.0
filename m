Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA21210
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Dec 2000 06:17:22 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 3 Dec 2000 13:19:54 -0000
Subject: Re: [parisc-linux] merge activity
To: grundler@cup.hp.com (Grant Grundler)
Date: Sun, 3 Dec 2000 13:12:55 +0000 (GMT)
Cc: grundler@cup.hp.com (Grant Grundler), matthew@wil.cx (Matthew Wilcox),
        parisc-linux@thepuffingroup.com
In-Reply-To: <200012030656.WAA02559@milano.cup.hp.com> from "Grant Grundler" at Dec 02, 2000 10:56:28 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E142Ywr-0002ib-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I do see #ifdef DUMP_RESMAP code (not much code) has been removed.
> Obviously it wasn't marked right. :^)
> (arch/parisc/kernel/sba_iommu.c)

The files I touched I removed dump_resmap from one file because nobody
even referenced it there. The other cases its alternatively a null inline
or a real function to get rid of some of the other ifdef crap
