Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81F41A682F
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600854; cv=none; b=eS3IikUOmtxekh89jdabhL8U1EN0oV9u+9OyykcLnsBzVogUxoeklrZo+speLxCpl/IJ2BspVQaMZJPqnWvlOangEy8Nir7rFUnyruGU1ZnRKpKe5fpVRw2/ejwKpMjtrLQi5ZUKC83YeBWVibx7Pj5aimoGNzG2ayyi8XBnr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600854; c=relaxed/simple;
	bh=5QI+vpem4Qjc5N2iIoeyVzDvUIVSa4yofmez8yrC2FE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv5c/4mtUQ/QFxLS+QdNJlKGEDnneqO/0MwyT8fbjawi4Uj2nKjb/VKz9vNSt9Q017uwUfacIzs3s1nR91GBjW4dtsC/xoLG17S9TPjLBTpk31MmkTFgnEepDV+nvDqom3h+HpbBj96RJwRPQ3HAvquGCcOmtJuXf1dsAMEpw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVMfRb25; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVMfRb25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FACC116C6
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775600854;
	bh=5QI+vpem4Qjc5N2iIoeyVzDvUIVSa4yofmez8yrC2FE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WVMfRb25QY+fX+Y2zeYyOKVuDky8cfrMPRz3nHEXocgXWcPGfoHy3HOk3a8yEMUH6
	 vBXjaecFl9LyUKP1hnljL+QsC7MNDNZkXc4RmO/zhKFZSjW/0MtrKKC1SbFYWJIWjg
	 xIPWi2tgBqeeVGA73Tqrxnm1dsHve9ukubylvHwwtzsbY9ddbvsqO3XXscX/ZpXo01
	 WTsZwFbX+ThgumVlzQq4YcXLOtiacEUQhq4Yn6Btho3ge5mWGHXnig+JlgAqRUZbrv
	 M9mC9V+7tV0+APVUt8fesu2+mn8XZ1oJOmwTewiobSHGRB88bB+s3OcC2aIyMTx9nF
	 I9lblcpSxQSBg==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 4/5] parisc: Fix default stack size when COMPAT=n
Date: Wed,  8 Apr 2026 00:27:13 +0200
Message-ID: <20260407222714.178861-4-deller@kernel.org>
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

The CONFIG_STACK_MAX_DEFAULT_SIZE_MB config option does not exist
when CONFIG_COMPAT is disabled. Use default 1GB stack in this case.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/sys_parisc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index b2cdbb8a12b1..0ffe91d214d6 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -50,9 +50,13 @@ static inline unsigned long COLOR_ALIGN(unsigned long addr,
 }
 
 
+#ifdef CONFIG_COMPAT
 #define STACK_SIZE_DEFAULT (USER_WIDE_MODE			\
 			? (1 << 30)	/* 1 GB */		\
 			: (CONFIG_STACK_MAX_DEFAULT_SIZE_MB*1024*1024))
+#else
+#define STACK_SIZE_DEFAULT (1 << 30)
+#endif
 
 unsigned long calc_max_stack_size(unsigned long stack_max)
 {
-- 
2.53.0

