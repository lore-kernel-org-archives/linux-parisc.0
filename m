Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id A01804844
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 18:29:33 -0600 (MDT)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D51C72B85@ntexchange.cat.csiro.au>
From: Matt.VanDeWerken@csiro.au
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 2 Oct 2001 10:27:33 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Probably a silly question...
List-ID: <linux-parisc.vger.kernel.org>

Hi all:

I have a couple of 735/99s which I'd like to run linux on, but have a
problem: they only have FDDI networking, which isn't compatible with my
network. 

I would really like to be able to run at least 10baseT on these boxes. So,
the question is, can I run an ISA network card in the EISA slot? I tried a
little while back to compile a driver using the normal Linux source, but it
was wrapped inside an #ifdef CONFIG_PCI or CONFIG_ISA, while my box has (I
assume) CONFIG_EISA defined. I know that on peecees EISA is a
backwards-compatible extension of ISA, is this the case on the PARISC line?
And if so, can I change the source of the driver to be #ifdef CONFIG_ISA ||
CONFIG_EISA (or whatever the syntax is)?

Any pointers would be appreciated (and keep up the good work!!).

Cheers,
Matthew van de Werken
Electronics Engineer
CSIRO Exploration & Mining - Gravity Group
1 Technology Court - Pullenvale - Qld - 4069
ph:  (07) 3327 4685     fax:  (07) 3327 4455
email:  m.vandewerken@cat.csiro.au
