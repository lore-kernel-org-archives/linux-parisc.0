Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21543EFD27
	for <linux-parisc@vger.kernel.org>; Sat, 25 Jul 2026 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785006135; cv=none; b=tS0HhQWA5iyAdDgbe6U6CyrrDYXBiTsoJIDM1q2yQotaXfTRB/eHqk5ZwsymsQAbvUkxaH7VNDmfTQQ9htHInRmF29+5mJnDKiJSDsjfB/hq9kE513vHWk5FBHtnGtcUTT55e5rvTMbYc/SUkpuzZdyDhgeKuHi0+tpFng4SgN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785006135; c=relaxed/simple;
	bh=JYL2Esp1k+dQTm7sDHTEsDt5E4SfF2psBp15HMU3tdE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=PCdb9usbMA4Hn1kGxBr7s7/+nDg9BuJgIoTBieuQHNy4qy0nVpELFylzwy42HYaL5yxNb91+k10s7X+Yf+3NmthRpWNoHV7LnJkdGqVmV+R96O/UoNzblyl3k05eBPGJBsEUb0fil9XM9CDI4sWEj0DNAS/Y1ErDfLGPN5NOJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxfGQORO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxfGQORO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F571F000E9
	for <linux-parisc@vger.kernel.org>; Sat, 25 Jul 2026 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785006133;
	bh=O0k5CBlvr2f/MNq1/6VnAzjsF4jw71hV0IS5Zy72uyA=;
	h=From:To:Subject:Date;
	b=mxfGQORO5ifw9VXqZaDiuStvDayt0IUUhaKLp4LXlmR1vRxT6+jr0bYDttn9iD5q6
	 SjOzPM8JXv4yfgH+Xq3yMGxE0H/6diKbnsqjlw9Us15MmBGQ13Yx3GxeZq2FfVoaSM
	 8sZy3jJJK8Nf4UuDOdu5+a0mlBPjH42SoTF0wnj/SdvOQCJs+ypW6IDPDYTAGMNQDh
	 CEEiNUyGPQph6pATxlwYijUJgRV6PvKeegnDw3MMie93GoTWluwK2LW7/2f4S2zpoX
	 wCylgBGldP625vhYBfLhJMyjR4IEYzzJfUF74spfIwdB7LdtcXqwD2hqH+5piwN5nJ
	 YRZv+znNYBpFQ==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 1/2] parisc: Drop redundant implementation of pte_same()
Date: Sat, 25 Jul 2026 21:02:06 +0200
Message-ID: <20260725190207.113620-1-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
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
 arch/parisc/include/asm/pgtable.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index d92dee9fef3f..a042131553d5 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -441,8 +441,6 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 	set_pte_at(mm, addr, ptep, pte_wrprotect(*ptep));
 }
 
-#define pte_same(A,B)	(pte_val(A) == pte_val(B))
-
 #endif /* !__ASSEMBLER__ */
 
 
@@ -475,6 +473,5 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define __HAVE_ARCH_PTEP_CLEAR_FLUSH
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-#define __HAVE_ARCH_PTE_SAME
 
 #endif /* _PARISC_PGTABLE_H */
-- 
2.54.0

