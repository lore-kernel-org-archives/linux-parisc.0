Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D83F661D
	for <linux-parisc@vger.kernel.org>; Sat, 25 Jul 2026 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785001214; cv=none; b=CT92cxJoezzhG3KwFWzZmbc/Oytwa1+35KD2CCYhWyKaZ+HL5+je5CTVv7d1vNZcpjqDBtnXT6v04DzZ6FaxXX7AW6impuCDaxbYnSGPkFsH+5SceyWyK9x69bDNegGNp7pVdw53qFqB0AGty5CZwnh3NXHgsrTyODLfUYyWflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785001214; c=relaxed/simple;
	bh=EKY9IvWnE9V8hlMCD/hC3yVKIjplnzIBDYo8qXtQeP0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gJT1Oo6eAGwLf/mmw7rs8XiBvicgjIT2yiid5spfyxGwhMz3grFuSXWQoV8eRwfzyw8CzLfGS9K0ygWtXKmLK3MSH4E5B06UqDBk3W4Khw4D0LcGZfRubyhn+XZ969jK5PFrRDrCck7yl6kWJ0t0ErTf0H5xlszn2XnwqP+19GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwnyoiKx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwnyoiKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BC91F000E9
	for <linux-parisc@vger.kernel.org>; Sat, 25 Jul 2026 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785001209;
	bh=libfMq5NdgDZLW/lRVsP3tpKmXc5EDrj51OWIc6kMQU=;
	h=From:To:Subject:Date;
	b=QwnyoiKxHjl+TlmYVOGWzeF5uI6IKiyjwLc8QqwjGwauQcrnsadrZPR06V2f4YtSK
	 /CtKdU5kHoTELa2gfKCc6ZMebh+iTB8lWNRft3M3Lnz4XvgYlNucGUKdqqoJ0QurXV
	 4rItsZMZBguJuf8Ccx4/gV0tDB8vqYWkg0Yqc2CQp3+59LTtzQw/7I8OgJHG387oTE
	 beHz80b7tGzQfi3BmNUTKSY5TCjVbHtFzhhoU0fEr2qnT34+PjO3bwosdqDcrZUsx0
	 plUW/l2lHwFlKT+zrl/a3UBTaEEK19jf2MxkiU6LgOXlFsFvwrdmiQTABDd13UOb4F
	 1ohUvs7XQzoRQ==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Drop own implementations for ptep_get() and ptep_test_and_clear_young()
Date: Sat, 25 Jul 2026 19:40:02 +0200
Message-ID: <20260725174002.100712-1-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Switch to the generic implementations, which are identical.

Suggested-by: Usama Arif <usama.arif@linux.dev>
Suggested-by: John David Anglin <dave.anglin@bell.net>
Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/pgtable.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 467b8547ac8b..d92dee9fef3f 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -432,25 +432,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return pte;
 }
 
-static inline pte_t ptep_get(pte_t *ptep)
-{
-	return READ_ONCE(*ptep);
-}
-#define ptep_get ptep_get
-
-static inline bool ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long addr, pte_t *ptep)
-{
-	pte_t pte;
-
-	pte = ptep_get(ptep);
-	if (!pte_young(pte)) {
-		return false;
-	}
-	set_pte_at(vma->vm_mm, addr, ptep, pte_mkold(pte));
-	return true;
-}
-
 bool ptep_clear_flush_young(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
 pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep);
 
@@ -491,7 +472,6 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 
-#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define __HAVE_ARCH_PTEP_CLEAR_FLUSH
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-- 
2.54.0

