Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id TAA06622
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 19:23:38 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id 7999F5E2
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 21:25:54 -0500 (EST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA22668
	for parisc-linux@puffin.external.hp.com; Wed, 22 Nov 2000 18:24:52 -0800 (PST)
Date: Wed, 22 Nov 2000 18:24:52 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200011230224.SAA22668@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] new SBA IOMMU version committed
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I've committed my "second generation" I/O MMU code for
C3K/J5k boxes. It's only tested for 32-bit.
I'll be testing 64-bit shortly.

This code makes "perfect" use of the I/O pdir resource map
and we shouldn't see any panics due to out_of_resource.

grant
