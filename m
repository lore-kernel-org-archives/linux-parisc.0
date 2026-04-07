Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5C1A682F
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600855; cv=none; b=gNHXtVeRlXlG2pjbOexrnfB5xk6rlAEX+9qf5eQevgC5p9POJ/D0vJ8z8BE0vm3GSTHpWKG3fJ2oV9UpKU9hraMydL4hBVjIqYJ4Wqacapjde+OWTmV3y3slgX7pmwp+Km5A0k395Al/WsMG5oebdH8xjtKZHISkEjSe6Ldjv+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600855; c=relaxed/simple;
	bh=WMjn46Kc7dOrLNrANYxOctyG+WL0J4NtGPdvKs7scxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk3M/2PMKR2ye33wHCdNXNYupYGph3AavVhJA6WQj2srF2IHv0/NoDorGqiP0ffMrAD08xbJmXIsTkEflXxJNn1t/R2KTlxRqtQwVfG3RE5ojjwNCcbUqenmc1JhGMvmr1FxyL1JZkhimpdNOJoK7yH2zkH8k4Nb2/k+Hvs9iAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asiCZ0X2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asiCZ0X2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0167EC116C6
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775600855;
	bh=WMjn46Kc7dOrLNrANYxOctyG+WL0J4NtGPdvKs7scxA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=asiCZ0X2rjMRiGnzbwv7D15y3GvsVFb7fIKFGbou3XPQUOzoboLQecKaAnB2U4jbx
	 eV85ZeG+7w0g/Q8hPhxWTdkt2hTdRf0sFL/haacg8z7yjmlL56DK/6o2o1J9KdkRbV
	 DGCf4aBnm0AH3kpnR3nTW4yNZQv6vFxmp8NSSTmUpKTM9R6+/9g3upf8P++M9g4IJG
	 rx1gOr9lP+HjUSXdluDllhlRmtvUxcMS+aTnM/dDHArfYfJqzsoSTYHOs5jsHGYqlF
	 6SsF4r5TapfaejGc4rx2dju57hQiG5ASdXI2Wx+kj2i7zZyuUGrRraghUABsq83Mjv
	 7L6yeXbfcusyw==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 5/5] parisc: Allow to disable COMPAT mode on 64-bit kernel
Date: Wed,  8 Apr 2026 00:27:14 +0200
Message-ID: <20260407222714.178861-5-deller@kernel.org>
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

Although we don't yet have a 64-bit userspace, allowing to disable
the compat mode should be possible.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 5a8cd50e8d70..d2273d5c08a0 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -355,7 +355,8 @@ config ARCH_SPARSEMEM_DEFAULT
 source "kernel/Kconfig.hz"
 
 config COMPAT
-	def_bool y
+	bool "Kernel support for 32-bit binaries"
+	default 64BIT
 	depends on 64BIT
 
 config AUDIT_ARCH
-- 
2.53.0

