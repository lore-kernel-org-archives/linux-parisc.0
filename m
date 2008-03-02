From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: [PATCH -mm 0/3] fix iommu segment boundary problems (parisc)
Date: Sun,  2 Mar 2008 15:10:25 +0900
Message-ID: <1204438228-4564-1-git-send-email-fujita.tomonori@lab.ntt.co.jp>
Cc: linux-parisc@vger.kernel.org, tomof@acm.org,
	Kyle McMartin <kyle@parisc-linux.org>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	Andrew Morton <akpm@linux-foundation.org>
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patchset is another sequel to my patchset to fix iommu segment
boundary problems, IOMMUs allocate memory areas without considering a
low level driver's segment boundary limits:

http://www.mail-archive.com/linux-scsi@vger.kernel.org/msg11919.html

This patchset fixes the PARISC IOMMU code (sbc and ccio).

There are three patches in this patchset. The first patch is for the
IOMMU helper (lib/iommu-helper.c) to enable PARISC IOMMUs use it.

The second and third patches are for PARISC IOMMUs, the second one is
preparation for the third patch, which fixes the IOMMU segment
boundary problem.

The third patch assumes that ioc->ibase is on IOVP_SIZE boundary. If
not, please let me know. I'll fix the patch.


