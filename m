Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4283537E5E2
	for <linux-parisc@vger.kernel.org>; Wed, 14 Oct 2026 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950365; cv=none; b=IeBt3nbNxEICXrNAQbiZQ9zUe1lE8OZZlFWJhmcKw7dSzNYvqMX8N1ZbVd6hh4/Sq4GPy4xbEHsjflrQv0kphGBoz1gXI+g8Iq82pxbbYjUVGoKaqv+b+NkzPClv+3cwM08MKYpNj34sQylVKPX6/GZfqYEfNg7PGfuTHIUsVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950365; c=relaxed/simple;
	bh=A40w+35DIpgiCQxJt0/IC2OqyHnzNk9q/eF9E1VEJkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFkXMmGsQASRkmJh6MPnmX2B5OyCXay62lGwKlgIBzl/kSKq++tV4VtkPtqFFWrA+M3dIeNzijic5YM4Zz86UtrSbcNlRiCIq6Y3rnl0jra/Z/3AEt8uNYL6yBJdInb8Pgd8alFye4Y0LwOZSpWGM5FUzxYutY6o/HHoLLG06LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BL3PFH8a; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BL3PFH8a"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1423013a12.2
        for <linux-parisc@vger.kernel.org>; Tue, 13 Oct 2026 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950363; x=1792555163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+FSgGJMK2coGisR/hIoDuCVxcBu6Hr0f49QmgHJmrk=;
        b=BL3PFH8ajdp7Twcl+IfQr5q1xlW9qSiPjhSy3lFYfbK1ou55/7iwYdNLp9lccpAWTP
         iXbRYz1d1cRVJ0xnk98VQvvXZVIqk9qmg4cBw16k4O8xGBCCuYINZAk1jPMbHG53iRFi
         /LwMtICnQlHOnHWEZ13NWvvAYIyT1uJZIy494YsCtDO3xwzv+6uy44J3IbhSt7rM2Zqa
         yMEVpzzPPog6dy/gkbye3cR+0nyrmg7UczbyMpMXOLTKdLR4x9ZvJ9AWlQ/hpnhl4jIk
         wiB4hH6d1YC4yReHX/mI/pHU4uOBzBwIxjGnU8XxcCqe4bQZMDKHSdXU1vc3AvTWqMyp
         GNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950363; x=1792555163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+FSgGJMK2coGisR/hIoDuCVxcBu6Hr0f49QmgHJmrk=;
        b=Bd8aTUqnMMsw7l+MH808xg0DacjlwOqwDS9u6DG0w5q0VwJ8qNY4DA0D3Il3y56d2/
         pr9gWldj7t25MPBqgs84+IEKSmQCz1O8wHWDLePE7vgQRBQLyIhoZ09NW27mRuOvmBmz
         9bf+lxIfx7j9H+ZvB26IRtEtJXLrUYfeBSC+qgFYz3L6OslxYW7u2cnM177UbCl8v955
         43yjCU6b7J38Q2Jz4OYiKIsZ+W0fnxWeyA93s97Aa8ZL3R0SIcmUGgypfyoiNjWl2DJc
         5Yyq8wIJWle1+8vp/VfH+1yAqbOdCRTvEKQjzgWHMyehOBksV7g7zBG/1ERpfOErXi54
         PCgg==
X-Forwarded-Encrypted: i=1; AKwUvBzXKkGaUcZEPfvGVkcyi75dIyk5PsF7DS9gR9XLHIEBgfMb7zwGowolxDmZPzTDbOLTo05I9gL394xq/MQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrcC73VD8Fb+IyvTAGbhqVs9Vi5r7Ahi/3B1pFtZyXKb7u3RRk
	ZUAHy3XcSdG8ylE3serCC6ApBdXataWu0zc8wU9KHi29ly0K8bBWeY5DsPdwQB42RAU=
X-Gm-Gg: AYBFou1TqBg1hKUxlcvkmnQea5bVyup3p2m4gf6bb1Tcd5FS/FNZqd/uhpH/Wicxl1U
	s9oOXqUHGwrkFG5/TLl16huj1BRropZ2B/K5fgurvqGjXxyJ+klR7rYMlNXfxKzmzKpkcNZHXiM
	iiYeD4rZ8GjZ+q+cQsnaXHlugBIeiDdGuv5pDNSbYYA5x6ibcAgLk8jVffIxaLm8itMbHMGDdQQ
	B2xzgOdcEM3vjDJYglUG8diGU71fgJ0s5xt4gOnbY0lKIfgDw1Gvf41dc7C1Kp0qdDJM9I338wO
	hBFNKZcLsU/tOUaRM8U6s7MRK/GtEcTYkLwHCws0HrOEuABV54/pxtcX9BYAwH0wIQIPrtuzI+c
	7/A0ZJWOFWRPXiKrR1RknNHiSnIoR/bepRUDIa0q4ByxbOp3P8lV72EfkX2NOXGWmilDpgKD+zn
	IweusWv4/pgnzxQV0Uo2mh4UpC5NOcvkBLHkL1GOXJhFnD5cW8FzCmyHhYyB/4ulUOJTISDVNWx
	d7lFsPDMjGe+1PppR53
X-Received: by 2002:a17:90b:1dd1:b0:3a7:e0f4:2857 with SMTP id 98e67ed59e1d1-3ab3a359dd3mr10523369a91.1.1791950363442;
        Tue, 13 Oct 2026 20:59:23 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:22 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mm: generalize kernel PTE table allocation
Date: Wed, 14 Oct 2026 11:59:08 +0800
Message-ID: <20261014035910.687847-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014035910.687847-1-songmuchun@bytedance.com>
References: <20261014035910.687847-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures whose empty kernel PTE representation is not all zero must
initialize new kernel PTE tables. LoongArch therefore wraps
__pte_alloc_one_kernel() solely to call kernel_pte_init().

Call the architecture initialization hook from the generic allocator so
LoongArch can use it directly. The default hook is empty, so this does not
change other architectures.

Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/include/asm/pgalloc.h | 11 -----------
 include/asm-generic/pgalloc.h        |  6 +++++-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 248f62d0b590..a3f93a8b58be 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -10,7 +10,6 @@
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_ALLOC_ONE
-#define __HAVE_ARCH_PTE_ALLOC_ONE_KERNEL
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -45,16 +44,6 @@ extern void pagetable_init(void);
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
-{
-	pte_t *pte = __pte_alloc_one_kernel(mm);
-
-	if (pte)
-		kernel_pte_init(pte);
-
-	return pte;
-}
-
 #define __pte_free_tlb(tlb, pte, address)	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #ifndef __PAGETABLE_PMD_FOLDED
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 051aa1331051..a1de7d246754 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -19,6 +19,7 @@
 static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
 {
 	struct ptdesc *ptdesc = pagetable_alloc_noprof(GFP_PGTABLE_KERNEL, 0);
+	pte_t *pte;
 
 	if (!ptdesc)
 		return NULL;
@@ -29,7 +30,10 @@ static inline pte_t *__pte_alloc_one_kernel_noprof(struct mm_struct *mm)
 
 	ptdesc_set_kernel(ptdesc);
 
-	return ptdesc_address(ptdesc);
+	pte = ptdesc_address(ptdesc);
+	kernel_pte_init(pte);
+
+	return pte;
 }
 #define __pte_alloc_one_kernel(...)	alloc_hooks(__pte_alloc_one_kernel_noprof(__VA_ARGS__))
 
-- 
2.54.0

