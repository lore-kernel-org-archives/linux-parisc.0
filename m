Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604EE19D065
	for <linux-parisc@vger.kernel.org>; Fri,  1 May 2026 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655666; cv=none; b=ASGlhX5ebgwXJggaSKyg2std6CTq/7FJYX9kv9RJQSMghlVgK8ZT24LOIKIyuQPSpp2xn0LJIoizT0Y8puSFTJz2cJSoCdr5EgE3SAk1ABuvp3eBeerWks0CD38P96hab/7XGcU4isZpZLV0nNb1MqTuD2bwKI+nHT8s67fDrQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655666; c=relaxed/simple;
	bh=icxnaFkEVg28ZmXseAGpykE2BK8Ofvtek55kJA/MBQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EqW4M6UMEYxaT85ARM5Opctzy8F7uSQgZpAx1GGL6/IQ+iVK6JpcDXICMVppsV+4bRUXeybIztZMo52VfmInrkilD9eO6i4KJkpLv/c639Xku85lYHe5rLQLik7O720ZOFuSo90IX9KWTVCj/VXO3W/ydPyEFbXHcLi7cMJqFpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPyPXsT5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPyPXsT5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59089C2BCB4;
	Fri,  1 May 2026 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777655666;
	bh=icxnaFkEVg28ZmXseAGpykE2BK8Ofvtek55kJA/MBQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=mPyPXsT5eZC4yPA2Fda9ha5TGFlXUG2v/YNGQUfa9GGyNvRhZH6xTR1c553XanEiK
	 R1qFVpnpxyBzADHYdBZsEN03dYCHoYsjhc7IhtSg/TKm/eb0+wOjaEcJ0rW0z18oib
	 zb9KfhyiV0VTkK3ntkYKq7/bgjdfU3WSBmgg1Mxy7PWbS4mbydSSbgIwEwiTSRpQk6
	 /9vTIUztol2bAmNAtovmZ3TcFO4+dgi5Ds6I063nqbg+apQw0SOFQI5yTaLuhHGZqj
	 tSGZ5kEtQYbqYVX+kvHxYYHopO1tpUjyL7IH30DaH2a58Rb5+mEj0cehcIviTtzkvM
	 Sy1xgWRmurreg==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: deller@gmx.de,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH] parisc: Fix 64-bit kernel build when CONFIG_COMPAT=n
Date: Fri,  1 May 2026 19:14:09 +0200
Message-ID: <20260501171409.9128-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

VDSO32_SYMBOL() is used in signal.c, defining the value to zero avoids
liker issues when CONFIG_COMPAT=n.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/include/asm/vdso.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/vdso.h b/arch/parisc/include/asm/vdso.h
index 5501560f5ffe..e5cca3c9c8e7 100644
--- a/arch/parisc/include/asm/vdso.h
+++ b/arch/parisc/include/asm/vdso.h
@@ -6,13 +6,14 @@
 
 #ifdef CONFIG_64BIT
 #include <generated/vdso64-offsets.h>
+#define VDSO64_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso64_offset_##name))
 #endif
 #if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
 #include <generated/vdso32-offsets.h>
-#endif
-
-#define VDSO64_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso64_offset_##name))
 #define VDSO32_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso32_offset_##name))
+#else
+#define VDSO32_SYMBOL(tsk, name) 0UL
+#endif
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.53.0

