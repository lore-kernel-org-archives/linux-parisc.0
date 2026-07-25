Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8FD392C3A
	for <linux-parisc@vger.kernel.org>; Sat, 25 Jul 2026 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785006136; cv=none; b=Rxo7Spz61hWf4+fmfeZ5SXkCT0QgKiPW7vTqiOJ/o6S95u2sVpQTNr7WWo8YN3PM5sDACvLATbQl3QCQcT+F9Xz8LpCsEjpImWD1sPf7e1nEOhXL+XJpKipHlTBUW35sjoDKgR14wo4ylQfGIIufJG0eBHHv4e9ATdFOZ/TGfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785006136; c=relaxed/simple;
	bh=mAEzY8haP3S0e4OCqrGXq3I/9UKl7k1uuelyxlbnXYQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdIKei+za19q4oBaWukW3oalA8v56F3MKShEMBuQS5nqcl/HflaqV6aL6qM1BEtw/gFLR8eXd0WdMUdOmv8M6TrRtnCRSaylsT8A6DoOdDf8zx6hR9weZGcs5Xx0h5SGWpgvLOR92+9O0ngUtyMdZGCWoSHiSqDIqimuAzX03Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyR7E+Mw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyR7E+Mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CF81F00A3A
	for <linux-parisc@vger.kernel.org>; Sat, 25 Jul 2026 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785006134;
	bh=4BBwS5pvB3TXgp1XMgt3eses9lq6qX2ExyV2ZHx3u08=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PyR7E+MwXs4VAA36vaYxRkreaKbDitO4O/ZSkcS9Uj6B5sl506R+bUmW12OXzGrhq
	 aYT9Dmk1jn1XwvlRXGUgoVzzsC7z4TjVRB/h4mqm1Ma1e2uE1UP+5SyyoH2WmyR8Y9
	 K6KwzROzUZPS6QpYrJOvYoKmZpvpu0edpcZyYn3uasNiiEd+n1Q7fLDEavQrrjtVHm
	 3s+5jWlfuG72/nuX9Lv8id2jDjl3LrvwCalsfooCp0EmtYPKrzgAclopWa4H7vXqYl
	 234neQG4a6OHZ012OZ4Kk4UUi7ne6dFemeMlmtjaN5cSJVgMTBr4vExBpDg03DiWSj
	 D0ILLpLXnxing==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 2/2] parisc: Drop redundant implementation of ptep_set_wrprotect()
Date: Sat, 25 Jul 2026 21:02:07 +0200
Message-ID: <20260725190207.113620-2-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260725190207.113620-1-deller@kernel.org>
References: <20260725190207.113620-1-deller@kernel.org>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/pgtable.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a042131553d5..2dda06fcd35c 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -435,12 +435,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 bool ptep_clear_flush_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
 pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
 
-struct mm_struct;
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
-{
-	set_pte_at(mm, addr, ptep, pte_wrprotect(*ptep));
-}
-
 #endif /* !__ASSEMBLER__ */
 
 
@@ -472,6 +466,5 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define __HAVE_ARCH_PTEP_CLEAR_FLUSH
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
 
 #endif /* _PARISC_PGTABLE_H */
-- 
2.54.0

