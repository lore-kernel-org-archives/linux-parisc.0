Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795762373;
	b=Keg8g7utf0Ho7Ec9ljCk9Xch48XzRmp8WoZnR5D+5oF9rVpcZBBWnmcaeEJG51b9IOhA
	 stkZO+lp124g9J3XkXALDGpoy85iHMNcoCLrWCU72V6svIa5+pw/1F150HVbzoD/68qUS
	 G/EJAKNIDX86psXDkxymIzWNqAiXbsQn9YIvlu7FCdZZTmOL8oau7na55qVOqt5iNRz4g
	 Lq6GtGgEvP9RAF9HVdnzC4zyYEW3Yzp4UGpERQluRQND2Wi0vCRyZ6c1VGqgIG+zAYffd
	 S5GFAPeb3/uvxPbswIdQoJfO16QTvuCBdr2xJSY9uS6s3JDx3o1cbq5/+GCOQk+Ee4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762373;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MNeHYtelmuSre1UuhlkxnQnbrEWwCRImfv7AOAKbTvw=;
	b=3CL6KC786ngaHAPe8isaDuDw3wAKQlJ3bJp1IErvpPtuAqPINYMbZvcsmCy/XIp/KUlc
	 0bts2AWonVv2jGb3Kxb4xJeStoCo4rBuOL+P/vPcdS3xoNh9vP24hZ0OQ2pjiJOCdqnzR
	 v4PVPDqGaypv8/uh718xQRk9012tPOC0VTdSgo6ti3hR1fV4EYFt9lxcEl8EnMCP7fzpE
	 tpVqzLZA66LkYuaSX6paFfrM/HR81QkKCYc7q6xqDcmDD4Mqcl0KHr2N2KcZ2dDoKsXNv
	 qL8L2XvJ0V2PeLN2f+A/6EfmWPy9WW/z+PxnDUQoitlPm6aRxuMmkJPfZJGhriZ39ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fQ9VvL/X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6A606A31C;
	Fri, 27 Nov 2026 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQ9VvL/X
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795762372;
	b=CVidcvXGu7eyZB54dOXUbPER1+9VFv45Rqc9JluQU7MQ25ocHkcfHqaFSk9YrsWlGgNC
	 XgQgQy/B8HqTWpJi4UIA/C/l071xeitn5vR8fMoz3Aa9egz7LvQdPnYT030MOQ9UOYdpj
	 IwVCfv8D7WLKQ2kWYBqnMT3Fqc29pja7E6F6Gw54IcZA2wzqZ7DB6OrMe2Vb7zVlaEA4M
	 kYY8Qbwgdcl9YL/DD3LmPpRLVbDYRPyOM9xlQfCmvL17MD8oJLub99xcrVz/ZUA/oFyk3
	 7rkm25njC73ImHqPCSqmg1Dt/2PLPXmIQOXfIXIDET+bHYLtebuiDj8QTNP2VYCw6iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795762372;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MNeHYtelmuSre1UuhlkxnQnbrEWwCRImfv7AOAKbTvw=;
	b=0nsFFtjkU6XbsslpvAeOap7MkSDv8VRf8L7dDk4KMwmcC4LTe6Cd0k494rXy3Qnm4LRJ
	 LsOMxRUmy6eeXUbyVQZ+Zlq257YdO+Xm4ImGGWLmynb3QuK8BwloxzWC8T4j9UN0G27CI
	 UH96ERqiTFkfUupRW5FHtGOn7oxfvOEul2xV5UZt7weljye4sj2UDM4YOZpFE8wn16jFk
	 6IqHHb9YuePAzF4cI95bIImXxgoX/JNOC8c/9pIFG79Ne72lva6GPkoIhDfAmr+XmX6Nt
	 uZsnmx1vzrMGXsHC5a8R4tbpLV7BH2SQdlKY7eP3S8AlEZjbzwdSJUWN9EiQSTgAVWA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BF7A1F00897;
	Fri, 27 Nov 2026 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795762372;
	bh=MNeHYtelmuSre1UuhlkxnQnbrEWwCRImfv7AOAKbTvw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=fQ9VvL/XaFNu0FU7Y0hMVDAqgLsUIVeGBoGWgbtvNFLl0L5aby7INe4HuC5ibOWYd
	 czvUzUo5bVPyPgjJMpkfQHlSiqFoThCBqIQcFFxZ+qVXXsv0ObIcagACcBkUscnF8d
	 qv/jJ7L2yxjTLvleYQiiM9Bc9CXv92f6DdmBZmV2feOIsTIuih0Mw/Pfevc0Xme+e/
	 mhPRj/4utbMFbTZHWEVDdUI9JIzVJcHwZEIWxBxdoWbmoppPcHu1EPnejNq3otSvkE
	 R+TVpomDyLoQzYRZNXJCGO5W+0Ovak/D9N/PbuznQk3cwp2FBUSYoHI6w4jK8LnN1s
	 kJVkAI2TlR66g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8EFA54B5BB;
	Fri, 27 Nov 2026 06:52:48 +0000 (UTC)
From: Anh Nguyen Hoang via B4 Relay <devnull+anhnh.4work.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 00:52:48 -0600
Subject: [PATCH] parisc: pci-dma: Handle allocation failures in
 arch_dma_alloc()
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-kbug-l001-v1-1-db0b44ec71d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL8oCWsC/yXM0QpAMBSA4VfRubba2Qp5FbmwOeMgtCEl7264/
 OrvvyCQZwpQJhd4OjjwMkdgmoDtm7kjwW00KKkyRJWL0eydmKREYYwutEanXG4h9qsnx+f3qur
 fYTcD2e0dwH0/vn+DrW0AAAA=
X-Change-ID: 20261127-kbug-l001-bb38331f2f7c
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Anh Nguyen Hoang <anhnh.4work@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795762368; l=3623;
 i=anhnh.4work@gmail.com; s=20261127; h=from:subject:message-id;
 bh=LbWh1p0JWyiyRtWO0aSmkJ1gB8M+YbXem8D4tGZGGVc=;
 b=DJdh6gcbpAwHy70+KQkuktnNPas6c90im+HCxTO8qLwfHB4z5hX/Xy5hEyRxfG6wQMj8OIxBf
 3IsrWwsnSBeBw7oJQclHGzpPhL9uUtAV+O0Drfs3mZfRC/gaaQ/bRT9
X-Developer-Key: i=anhnh.4work@gmail.com; a=ed25519;
 pk=9NJ/0SKqaFZmt1/I5XY11TZSNY2ys6RWB3gvqzrLHmI=
X-Endpoint-Received: by B4 Relay for anhnh.4work@gmail.com/20261127 with
 auth_id=1662
X-Original-From: Anh Nguyen Hoang <anhnh.4work@gmail.com>
Reply-To: anhnh.4work@gmail.com
Content-Transfer-Encoding: 7bit

From: Anh Nguyen Hoang <anhnh.4work@gmail.com>

arch_dma_alloc() does not check the return value of __get_free_pages().
If the allocation fails, the function carries on with paddr == 0: it
calls flush_kernel_dcache_range(0, size), maps __pa(0) uncached into
the range reserved by pcxl_alloc_range(), stores __pa(0) in *dma_handle
and returns the non-NULL virtual address of that range.

The return value of map_uncached_pages() is ignored as well. It returns
-ENOMEM when pte_alloc_kernel() fails, in which case the returned
virtual range is left unmapped.

In both cases dma_direct_alloc() passes the non-NULL address on, so the
driver is told that the coherent allocation succeeded and then uses a
buffer which is not backed by the pages it expects, or not mapped at
all.

Check both results. If the page allocation fails, release the reserved
PCXL range and return NULL. If the mapping fails, additionally free
the pages. Call unmap_uncached_pages() there too, so that the error
path does not depend on how far the walk got before it failed; it
skips empty page directory entries and clearing an empty PTE is
harmless.

This only affects machines with a PCX-L or PCX-L2 CPU, the only ones
for which arch_dma_alloc() does not return NULL right away.

Found by an automated code scan and confirmed by code inspection.
Reproduced in qemu (B160L, PCX-L2) with page allocation fault
injection: without this change a failed page allocation makes
dma_alloc_coherent() return a valid looking address with DMA handle
0xf0000000, and a failed page table allocation is reported as success
too. With this change both return NULL.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Anh Nguyen Hoang <anhnh.4work@gmail.com>
---
Tested in qemu-system-hppa 11.1.3 (B160L, PA7300LC) with
generic-32bit_defconfig plus FAIL_PAGE_ALLOC. A test-only initcall calls
dma_alloc_coherent() and fails one chosen page allocation through
current->fail_nth.
Before: a failed __get_free_pages() returns vaddr 0x00048000 with DMA
handle 0xf0000000 (__pa(0)); a failed page table allocation also
returns success.
After: both return NULL (300 and 297 injected failures), with no leaked
PCXL ranges or pages.
No Cc: stable added; please add it if warranted.

Testing:
- Compile-tested on parisc (allmodconfig, W=1):
  arch/parisc/kernel/pci-dma.o; no new warnings.
- checkpatch.pl --strict: no errors or warnings.
---
 arch/parisc/kernel/pci-dma.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index bf9f192c826e..6e2d340921fe 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -412,12 +412,22 @@ void *arch_dma_alloc(struct device *dev, size_t size,
 	size = 1 << (order + PAGE_SHIFT);
 	vaddr = pcxl_alloc_range(size);
 	paddr = __get_free_pages(gfp | __GFP_ZERO, order);
+	if (!paddr)
+		goto out_free_range;
 	flush_kernel_dcache_range(paddr, size);
 	paddr = __pa(paddr);
-	map_uncached_pages(vaddr, size, paddr);
+	if (map_uncached_pages(vaddr, size, paddr))
+		goto out_unmap;
 	*dma_handle = (dma_addr_t) paddr;
 
 	return (void *)vaddr;
+
+out_unmap:
+	unmap_uncached_pages(vaddr, size);
+	free_pages((unsigned long)__va(paddr), order);
+out_free_range:
+	pcxl_free_range(vaddr, size);
+	return NULL;
 }
 
 void arch_dma_free(struct device *dev, size_t size, void *vaddr,

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261127-kbug-l001-bb38331f2f7c

Best regards,
--  
Anh Nguyen Hoang <anhnh.4work@gmail.com>


