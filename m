Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB63AA1B8;
	Wed, 29 Apr 2026 20:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777496368; cv=none; b=chNLX79+t80hJZo8g1hrsMvrhLSvty9MgERS7MlWQoSXV6EU5ml6B298jKfInYf6/T9yUsnfA1VGCfUOMRTF0uWdmGAFPSnfLOOTh/xre6RtgxwyLCC1zxGkTG+/CVuOPpnOpp4cSNfDRQ+E/7YCtdmee992pqS/ebkEQcla9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777496368; c=relaxed/simple;
	bh=SRrw/xjAblV349vpFYVxAfsHA6OjMVTqD64CMZMlsCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PkkJLB8G+kq52sGsMF5wdt9Lxtd0ABx30Len0gq4MyshhVHYpUHbceQ/i1oUDjhZ/f7EAc7oeD73nL2nMRQBorC1mbU3n/twgj8jBRgL8MDp7AOwinc8xeVgLsxGUqo/Cw7/o3bRTCYEFHXVsHHI95Jjn49cq/Q4WBYS4SqI3PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=n5cBWUGa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="n5cBWUGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777496366;
	bh=SRrw/xjAblV349vpFYVxAfsHA6OjMVTqD64CMZMlsCI=;
	h=From:Date:Subject:To:Cc:From;
	b=n5cBWUGaGuIj9fP5Q+bUg1/dIPYaYvqk9gv+jJMeqkNK0cU77p436oWMdEiA1G2y4
	 Zx1fusJKvc5ay4SrXre4WZMTLDfiUkqBFngEJ/HowSKIHleIdZUQQZipzyOL4XwoHn
	 gdKwlvDXpGBLmApyEvVA7g4z9TdBT6jnlZoE43iI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 29 Apr 2026 22:59:25 +0200
Subject: [PATCH] parisc: Only call VDSO32_SYMBOL() when valid
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-parisc-compat-vdso-v1-1-5242b8ac59db@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g1orFJ7leIijlFT0BkmKoJ49
 07b5Vv8f4JJVDF4ZidE2dXULwnFLQM38TIKap8MlFOd3+mBgaOaQ+fnwCvuvXlsqrojLpkKKiG
 FIcqgx2/6av+2rXuLW78nuK4P4qmyOHYAAAA=
X-Change-ID: 20260428-parisc-compat-vdso-956b2a3a2123
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777496365; l=1362;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SRrw/xjAblV349vpFYVxAfsHA6OjMVTqD64CMZMlsCI=;
 b=dvHpOF1bUJhHn2bVLR30+gnIl+Wuj0WZ79u5z6VUMXrgb8JCCH82tWumzsYqGLjy9yOqVnfmk
 ioz01v+ROCmDAQzDZ9JITAQ4JVPzvYIVJ9WiktmPxFVOqFFQjcAXgn1
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The definitions used by VDSO32_SYMBOL() only work if the 32-bit vDSO
actually exists.

Fixes: 3dce91790205 ("parisc: Allow to build without VDSO32")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/parisc/kernel/signal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 64a62006bb15..192121047633 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -276,7 +276,9 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs,
 		rp = VDSO64_SYMBOL(current, sigtramp_rt);
 	else
 #endif
+#if defined(CONFIG_PA11) || defined(CONFIG_COMPAT)
 		rp = VDSO32_SYMBOL(current, sigtramp_rt);
+#endif
 
 	if (in_syscall)
 		rp += 4*4; /* skip 4 instructions and start at ldi 1,%r25 */
@@ -514,10 +516,12 @@ insert_restart_trampoline(struct pt_regs *regs)
 			rp = VDSO64_SYMBOL(current, restart_syscall);
 		} else
 #endif
+#if defined(CONFIG_PA11) || defined(CONFIG_COMPAT)
 		{
 			err |= put_user(regs->gr[31], &usp[0]);
 			rp = VDSO32_SYMBOL(current, restart_syscall);
 		}
+#endif
 		WARN_ON(err);
 
 		regs->gr[31] = rp;

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-parisc-compat-vdso-956b2a3a2123

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

