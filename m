Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41A2CCC5
	for <linux-parisc@vger.kernel.org>; Wed, 29 Apr 2026 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777491557; cv=none; b=siJJsUhVZrHdPn1G6ZD6M/LiUR6lKOtU8Uum5WPgHu/msKAQsrhhuJGW1j1HOE6qkJLeBFC5TBZTHZke6p6A8IyMgVFNnUccme6wVSQ/25jWPzau3H4t/eucFiLX59ErdHQDUpmGs3/6VkBVN2Tej+GQJ4J0xRSCrlBHafatYqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777491557; c=relaxed/simple;
	bh=3afIHw+H8LvqKc9Lf6G84LcMVZVIV/nqNyI28gtOszg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdlpkL1lajWwrykk3rqQByrUE9MiOLzPnYAh7G27XQIvh8xwXgTx39dfcHK2ulyim4iKuLcrVdAzAXc30Y7ZJAkWFRCHAXJ0wpKO72WigNHj/9JeuFtck26poK5mtMDx89+olE87Lq6bCvdVDA4vaxCBNfzC0sX3el2MY4FXeBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6/H9pTR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6/H9pTR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8159C19425;
	Wed, 29 Apr 2026 19:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777491557;
	bh=3afIHw+H8LvqKc9Lf6G84LcMVZVIV/nqNyI28gtOszg=;
	h=From:To:Cc:Subject:Date:From;
	b=K6/H9pTRtcep/mZdT5D7rfLFD2WwZHZzoIqwZrl142Y4AxusolZvjD4Vvqke8a4s3
	 zsgiEKMBK2XTufnCizNRGsa+JMtETL86+89tEgVrsa9F4QEVvrKFNXXV0hWehupDiV
	 LYsDySQdFZ7BAVrj5aueg6/vvz/vNPZDQR845elLUF40OZg9UkvOnt2eYUGJP9wtXJ
	 Stz0aQ4l/B7kFAaVag1/EGr6vFWVbvtbH8VsdKxsQLGUYSJLwZKYaeia2KgLwLcjcX
	 XA6iSze0KAG4rr6KDE+ZTl1PvbcjBcQm5s4XDZ/BJSIIFTptRxmWtlFc2g2o0tDJQ2
	 pjHbO2z0ZzDxA==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Cc: deller@gmx.de,
	Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Subject: [PATCH] parisc: Fix build failure for 32-bit kernel with PA2.0 instruction set
Date: Wed, 29 Apr 2026 21:39:03 +0200
Message-ID: <20260429193903.76228-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

The CONFIG_PA11 is not reliable option to check if we build a 32-bit
kernel which needs the 32-bit VDSO.
Instead depend on CONFIG_64BIT and CONFIG_COMPAT only.

Reported-by: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Makefile        | 16 +++++++++++-----
 arch/parisc/kernel/Makefile |  7 +++++--
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index edab2a948352..4391783521bd 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -174,15 +174,21 @@ ifeq ($(KBUILD_EXTMOD),)
 # this hack.
 prepare: vdso_prepare
 vdso_prepare: prepare0
-	$(if $(CONFIG_64BIT),$(Q)$(MAKE) \
-		$(build)=arch/parisc/kernel/vdso64 include/generated/vdso64-offsets.h)
-	$(if $(CONFIG_PA11)$(CONFIG_COMPAT),$(Q)$(MAKE) \
+ifdef CONFIG_64BIT
+	$(Q)$(MAKE) $(build)=arch/parisc/kernel/vdso64 include/generated/vdso64-offsets.h
+	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
 		$(build)=arch/parisc/kernel/vdso32 include/generated/vdso32-offsets.h)
+else
+	$(Q)$(MAKE) $(build)=arch/parisc/kernel/vdso32 include/generated/vdso32-offsets.h
+endif
 endif
 
-vdso-install-$(CONFIG_PA11)	+= arch/parisc/kernel/vdso32/vdso32.so
+ifdef CONFIG_64BIT
+vdso-install-y			+= arch/parisc/kernel/vdso64/vdso64.so
 vdso-install-$(CONFIG_COMPAT)	+= arch/parisc/kernel/vdso32/vdso32.so
-vdso-install-$(CONFIG_64BIT)	+= arch/parisc/kernel/vdso64/vdso64.so
+else
+vdso-install-y			+= arch/parisc/kernel/vdso32/vdso32.so
+endif
 
 install: KBUILD_IMAGE := vmlinux
 zinstall: KBUILD_IMAGE := vmlinuz
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 2f3441769ac5..49f937c2abbe 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -46,6 +46,9 @@ obj-$(CONFIG_KEXEC_FILE)		+= kexec_file.o
 
 # vdso
 obj-y			+= vdso.o
-obj-$(CONFIG_64BIT)	+= vdso64/
-obj-$(CONFIG_PA11)	+= vdso32/
+ifdef CONFIG_64BIT
+obj-y			+= vdso64/
 obj-$(CONFIG_COMPAT)	+= vdso32/
+else
+obj-y			+= vdso32/
+endif
-- 
2.53.0

