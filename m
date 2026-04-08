Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7234AB06
	for <linux-parisc@vger.kernel.org>; Wed,  8 Apr 2026 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665465; cv=none; b=i6+yUqWY9kQSUXFZMnhxD1PYkUHVLxou5vyt+1NF8dHFiSCyKVhEKioSt8XTlkf3Bu+97Igimb7N+jNsSYYP4BLOGFAv2T/PPpgKxFyq/q54HAZZ1+usLYpZifvbyRBgbx2qgpyC0lklWtNCiiLw+MprYunFcMQK3ApohGMdNI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665465; c=relaxed/simple;
	bh=8rnXTiv3KASwodSU8xHltUik2W1G10kFFl8BJsXTLAE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dLWudqhbFNn9zwXpdXfeWOAcw0rbVf8g6+dfZZ8xd/4bS3nk+KaLCPVMlE1/MMQoq+8rUomTTua7KD9lzlqNNV86ccGlE12/hm4komfiftcZ5glycknW1e1Z3I0Sz/BeM5GHqxgHt2d13gKv2RmqAzigk4mDPBhJlesnMP6+tbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lcvtsx3o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lcvtsx3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31522C19421;
	Wed,  8 Apr 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775665464;
	bh=8rnXTiv3KASwodSU8xHltUik2W1G10kFFl8BJsXTLAE=;
	h=From:To:Subject:Date:From;
	b=Lcvtsx3oEfvmqxnobU1qnCuINydz525PMzLKhyy22mjgSyz1d+OPZrZrRThw7sVY2
	 9jU6RUjFCOp2oaV5WEwzYBwR+DzryV83rffIWJCS4m6ZIdXny5en1v1l5yR+3sR14C
	 Yecx9mgqNJ1LMvodMht0XxsNztd2ufgWK3/Jp8j/ntK9X00QgxHtb2gsonn1OmSfrn
	 RSEnfXnR/3CpPZ6D4ncZUEOZxRfXSOO/5LzNRJS/HRp+KETjV+snz9pnKXqagbBUMx
	 j5GPLxl4OHmAWHeTPcQ4tFFx/n6S8xhXE0qOowMtN3+8Z7p61gdhROg8aOJ/rLUGQG
	 RHprufJryIing==
From: Helge Deller <deller@kernel.org>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Allow to build without vdso32
Date: Wed,  8 Apr 2026 18:24:09 +0200
Message-ID: <20260408162409.55348-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

When building for 64-bit and without CONFIG_COMPAT, leave out the
vdso32 binary.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/Makefile        | 6 ++++--
 arch/parisc/kernel/Makefile | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 48ae3c79557a..edab2a948352 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -176,10 +176,12 @@ prepare: vdso_prepare
 vdso_prepare: prepare0
 	$(if $(CONFIG_64BIT),$(Q)$(MAKE) \
 		$(build)=arch/parisc/kernel/vdso64 include/generated/vdso64-offsets.h)
-	$(Q)$(MAKE) $(build)=arch/parisc/kernel/vdso32 include/generated/vdso32-offsets.h
+	$(if $(CONFIG_PA11)$(CONFIG_COMPAT),$(Q)$(MAKE) \
+		$(build)=arch/parisc/kernel/vdso32 include/generated/vdso32-offsets.h)
 endif
 
-vdso-install-y			+= arch/parisc/kernel/vdso32/vdso32.so
+vdso-install-$(CONFIG_PA11)	+= arch/parisc/kernel/vdso32/vdso32.so
+vdso-install-$(CONFIG_COMPAT)	+= arch/parisc/kernel/vdso32/vdso32.so
 vdso-install-$(CONFIG_64BIT)	+= arch/parisc/kernel/vdso64/vdso64.so
 
 install: KBUILD_IMAGE := vmlinux
diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
index 9157bc8bdf41..2f3441769ac5 100644
--- a/arch/parisc/kernel/Makefile
+++ b/arch/parisc/kernel/Makefile
@@ -47,4 +47,5 @@ obj-$(CONFIG_KEXEC_FILE)		+= kexec_file.o
 # vdso
 obj-y			+= vdso.o
 obj-$(CONFIG_64BIT)	+= vdso64/
-obj-y			+= vdso32/
+obj-$(CONFIG_PA11)	+= vdso32/
+obj-$(CONFIG_COMPAT)	+= vdso32/
-- 
2.53.0

