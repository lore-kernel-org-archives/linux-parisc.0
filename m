Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8AF37E5E2
	for <linux-parisc@vger.kernel.org>; Wed, 14 Oct 2026 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950375; cv=none; b=D07a1y/ej0J7Ia5zf282g5nEV0Ig8mDhFcjoqUbgKxEeItPXbI3nZ4N/u5pdEdFt6a4un4l3A9ptBBMT3ILQklSRyneU2WI1QkPNDStLahZ/CzNP373MrcATVvQVp5fTdoqYwoGYnYoHJxRxIlmRrTAowu0rfzLhYoqCgBUcko4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950375; c=relaxed/simple;
	bh=VmhSKYg91t8FaQOY7PLXlCuiEpMdg/PrBe3jC/5xDCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzwMmzb9nZ5OkJiUgoGPZxTzA6kDcaH1SmUf8JD9ferXM6WlrXncPp87Qn7oCD6AYpvwC7gxDHqkwfSDHpnDRxZQHBDrZQAj8alN5jr522cvKpiQ62Bgj+fw9xmdSU1wZo3xZ53U7iMaTACI5rVN0dCjFmZSwQ2J4z1KlgNWUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kqTZnVp1; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kqTZnVp1"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccca948203aso1384768a12.3
        for <linux-parisc@vger.kernel.org>; Tue, 13 Oct 2026 20:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791950373; x=1792555173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaAy9NFbsaWAIqgLcyoOERlKyqqeQpYUYBxUTmvTMEc=;
        b=kqTZnVp15BzlwlEcIFdqDpTLKhQ68pAqOMqfdDbpM1tZP8lGqnJxDxivpVQ4zfYmKh
         lDw0/zH3cZfx9EBO2+UcYKvTc+FBFXM8r+k+TWzOt57h0f/oblx2DBC5bNGPDBcpYAQT
         PV6uwSQdl0MVHLdcHqP4y1He8VKGj1jsBuxpTDggfV2OJ/NLhH2F49bxda/RM+bwbdqa
         bQrrEgK7hallbIXGdgybND/vmm94+gUNSs1QfoMRV8TU7YyrEB0vRdLCUGcIVad8mwdu
         GwbglmgVEAynIeF9xWjs9wsG7rS14gZ/EOj95hcclTXVf4FByVThtUU0QSulLNCe5ZQ4
         aL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950373; x=1792555173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaAy9NFbsaWAIqgLcyoOERlKyqqeQpYUYBxUTmvTMEc=;
        b=Y9T8dn2mL70jmBD/J8PwyuPaeqGJQtmOagWJBeNvz2XyXQc0YkRtOQXZ7TtX0XTDUB
         7UO/0sUaJaZFn+XQnc/Al+EPeLJi/7a0hHktDZENtU4cfjxnnu0SuEqZ9ao7LitLCfE2
         TmD9ImIo52UyIC4xmtXXs8xgvzVZeIpTmzM+DQCzsbUWeHbnrMNu8v6CU8MQmSzyTBC+
         TNk1CIuKKKt4ieMpyrQh7hjNKTwDbuvwphuBjUqxjRhpjQsLv2cXGxbHF5nKvqTwxJOE
         A2frkykbJFIrQSOCS8ZlRp0OYJ5DRNg/K8BOa78H5ej8jVjwMDmyEk2bFSKTThs/HPlf
         vjhA==
X-Forwarded-Encrypted: i=1; AKwUvBxxtLjVjPFMhKXdBc6eAp+ixnEYs5PPKieWyyOenosB8G2oMrBeLK00B2dcoVe6IPtP4Sz+pBoq6lC88t4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiziUF+Xqngo9VgAveQnItWal2NrRPcaL8YhGMDLd/wvWGZqVO
	OZ2lDTBwLfi0zs0p7Ge1VTjK8kQU7dCVextJKz/9Z5y9n0EPSb3b2005a+CM+inDI+8=
X-Gm-Gg: AYBFou1BXVNrarDhNkgadatrEysflukZ8DOc9OphfB/e2oOQcmXGnTpOxrQleD/O8xA
	rROg7oqcvgv5KP490pp9Ma6+KxHapClQtzdWQEOCij+pyR3qIUN6uWlHQptSu+1Id1AqamTIO46
	m6yHZN7XGWJZCPek8vXojmxNtJaM36JB5kRwzHtigS3baU3xo5CpoTFU+/R5ojRuFkJoM6HvpdR
	D6IWULSq4Ey/DJIFu9JdLlFE7mXhdFkpweA7MTiKveigEoTdTkG9QU4lohlCwD5oxXZILkhTMLc
	ZAaTTTU2X6qOr2Lnm4BzNm8sKRiSgBAqHTzkwvK8k8fs26KBhT9ltr5ur9dP1FdA2cPgsPOCLUY
	wwWspbY5m6I7s9CXcGBy5HZJpo+8moyzFk7R8x+fjVjCixnhoD0KSr9FkzKbRiW2ZTRyEHwywpn
	zeuXxPoKplityqYtta7pWn1n2BxHCBGtzOBdmdTMrMgpvn5AiaiBIYBK+SN9Y3yZjaa68oO2OZs
	GfmXJAdkuftVu+43pVx
X-Received: by 2002:a17:90b:384c:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ab3ac86fbamr12973731a91.34.1791950373230;
        Tue, 13 Oct 2026 20:59:33 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f24a538sm2492305a91.9.2026.10.13.20.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:59:32 -0700 (PDT)
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
Subject: [PATCH 3/3] mm: generalize PUD page table allocation
Date: Wed, 14 Oct 2026 11:59:10 +0800
Message-ID: <20261014035910.687847-4-songmuchun@bytedance.com>
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

The generic PUD allocator assumes order-0 page tables and zero-valued empty
entries. MIPS and LoongArch need pud_init() to install their invalid
entries. MIPS also uses PUD_TABLE_ORDER to describe the allocation size.

Default PUD_TABLE_ORDER to zero, honor architecture overrides, and invoke
pud_init() from the generic allocator. MIPS and LoongArch can then drop
their duplicate helpers and use the generic constructor handling and kernel
ptdesc marking.

This also switches their user PUD allocations from GFP_KERNEL to
GFP_PGTABLE_USER, so they are accounted to the active memory cgroup
context. Allocations for init_mm continue to use GFP_PGTABLE_KERNEL.

Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/loongarch/include/asm/pgalloc.h | 16 ----------------
 arch/mips/include/asm/pgalloc.h      | 15 ---------------
 include/asm-generic/pgalloc.h        | 11 +++++++++--
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 1fc9a0751f19..06a36da302d3 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -8,7 +8,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -51,21 +50,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 #endif
 
 #ifndef __PAGETABLE_PUD_FOLDED
-
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
-
-	if (!ptdesc)
-		return NULL;
-	pagetable_pud_ctor(ptdesc);
-	pud = ptdesc_address(ptdesc);
-
-	pud_init(pud);
-	return pud;
-}
-
 #define __pud_free_tlb(tlb, x, addr)	tlb_remove_ptdesc((tlb), virt_to_ptdesc(x))
 
 #endif /* __PAGETABLE_PUD_FOLDED */
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 2f123455e363..4346802e283f 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -13,7 +13,6 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #include <asm-generic/pgalloc.h>
 
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
@@ -52,20 +51,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
 #ifndef __PAGETABLE_PUD_FOLDED
 
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
-{
-	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
-
-	if (!ptdesc)
-		return NULL;
-	pagetable_pud_ctor(ptdesc);
-	pud = ptdesc_address(ptdesc);
-
-	pud_init(pud);
-	return pud;
-}
-
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	set_p4d(p4d, __p4d((unsigned long)pud));
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 68e473908758..cc8445e6078d 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -182,24 +182,31 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 #if CONFIG_PGTABLE_LEVELS > 3
 
+#ifndef PUD_TABLE_ORDER
+#define PUD_TABLE_ORDER	0
+#endif
+
 static inline pud_t *__pud_alloc_one_noprof(struct mm_struct *mm, unsigned long addr)
 {
 	gfp_t gfp = GFP_PGTABLE_USER;
 	struct ptdesc *ptdesc;
+	pud_t *pud;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
 
-	ptdesc = pagetable_alloc_noprof(gfp, 0);
+	ptdesc = pagetable_alloc_noprof(gfp, PUD_TABLE_ORDER);
 	if (!ptdesc)
 		return NULL;
 
 	pagetable_pud_ctor(ptdesc);
+	pud = ptdesc_address(ptdesc);
+	pud_init(pud);
 
 	if (mm == &init_mm)
 		ptdesc_set_kernel(ptdesc);
 
-	return ptdesc_address(ptdesc);
+	return pud;
 }
 #define __pud_alloc_one(...)	alloc_hooks(__pud_alloc_one_noprof(__VA_ARGS__))
 
-- 
2.54.0

