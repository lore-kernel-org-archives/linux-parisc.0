Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5D4C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 19:36:42 -0600 (MDT)
Message-Id: <200109040134.TAA23952@puffin.external.hp.com>
To: Arnaud.ATOCH@oecd.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] UreStoreOptical 20xt 
In-Reply-To: Message from Arnaud.ATOCH@oecd.org
   of "Mon, 03 Sep 2001 12:28:38 +0200." <C12531D038D1D011B1DB0000F8036C280A30EB51@eosm5.oecd.org>
Date: Mon, 03 Sep 2001 19:34:20 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Arnaud.ATOCH@oecd.org wrote:
> I've loaded hfs, hpfs, udf, ufs because it was not clear which module
> provide HP-UX filesystem support.

IIRC, should only need hpfs (which also depends on ufs?..dunno anymore)
hfs == Apple's Hiearchial File System.

> Btw does the HP-UX fs support patch made it to Linus tree ?

dunno.  But didn't that patch come from the parisc-linux tree?

Anyway...you might check if those disks are under LVM control.
If so, you'll have to convert those to non-LVM storage using HPUX.
The archives for parisc-linux mailing list have a discussion on HP's
LVM issues.

BTW, You might also try to explicitly specify the hpfs type.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
