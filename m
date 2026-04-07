Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75B21A682F
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600853; cv=none; b=Nis4PyAXrv4h5A6chAVa441hJMIm+KIQCjWXZbkYyeZJQ60/ttPmA74tA8xPYgdnaEzq1dd4SQXWw2DrzKbnroAXQcFI/up/1Si4tplxR9H0Q2Chg3KVR/7LbKhb3+JfFkuP7vYd7HtwdqGsP14ZQXRJENWLCzZ68qn11XexT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600853; c=relaxed/simple;
	bh=67/uDW9roJOIM1MSoLr/Bvf44+WVuUtwi3OKzRlDfzY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzSrKe2muiwt1PWgS1Uq/k9QY0DYI5tJHMrJmYMkw6d5Rr3KiaaZCnloc+K4x+2+by+OAg8/KorWOfq0X9Q/QvBdxrN1FslLlDWh16sjX+8L34GtpsWxs8w22GZIE9WBaJMIyCcWkyZYljot/7oSyhh0dC9mykI0G1YXogDRc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kW7v+X6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kW7v+X6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD7FC2BC9E
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775600852;
	bh=67/uDW9roJOIM1MSoLr/Bvf44+WVuUtwi3OKzRlDfzY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kW7v+X6HEHTgIPh+ntqdUA2B4Q0wXuExUS+qtdYF44ebjMYv7ip7Cfo1mZ/eeuJGx
	 3uhvQ8DFOxLfS1aVTiJq/ScyLZS9Cm6NSbUpbUnwoxC7i5YCbJDm7rKL63G+aDYWj1
	 Yn8FmWbqLsDtju7lEYYaxtw/kKc//FsZJLV9rG9irQQe/4I1ip5ztU4E5/Hmt39Oly
	 pDodUbJgmpoKXDMUrOmKDrYxADCpIn0eq/x1VBbIulLgM9Ynoo+k4j89DFH4LOkM/L
	 Sg5QJmH75v8oQAEbywC/WuhOuOG6MGMfSngF00g88hOxeAf6tbt/zvv2zXb9FRclWc
	 TDlKAFdBJiwyw==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 2/5] parisc: let is_compat_task() return false for COMPAT=n
Date: Wed,  8 Apr 2026 00:27:11 +0200
Message-ID: <20260407222714.178861-2-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407222714.178861-1-deller@kernel.org>
References: <20260407222714.178861-1-deller@kernel.org>
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
 arch/parisc/include/asm/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/compat.h b/arch/parisc/include/asm/compat.h
index 339d1b833fa7..13a5a55dec65 100644
--- a/arch/parisc/include/asm/compat.h
+++ b/arch/parisc/include/asm/compat.h
@@ -130,7 +130,7 @@ typedef compat_ulong_t compat_elf_gregset_t[COMPAT_ELF_NGREG];
 
 static inline int __is_compat_task(struct task_struct *t)
 {
-	return test_tsk_thread_flag(t, TIF_32BIT);
+	return IS_ENABLED(CONFIG_COMPAT) && test_tsk_thread_flag(t, TIF_32BIT);
 }
 
 static inline int is_compat_task(void)
-- 
2.53.0

