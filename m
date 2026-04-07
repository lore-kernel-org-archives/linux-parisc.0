Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E61A682F
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600852; cv=none; b=cE8LasRjoUTCqI39xmsCUF+vNaTeyyJ+neHToCY+uf7VIGSboGuMaSsKyhclOfTir/9cvt9SZ4BxHOIoqjgOd/Nxz7iFaEriJuf6k4vgG+Sb4wDYdOAiGbqsYMhSndFc3IG+fTw/5z1llHKRini7NnFR6vd/QLgq4FK/+Tnupk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600852; c=relaxed/simple;
	bh=JZbozZJfo3JEqmgU5TH3L1HCGLqIQzeAQCeMzZcML34=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gErU0hUEEbZ6NOQTTz++hqG0O3d14s0QCGti/t6M/SB2W2RdFvaXr0QJnWtU8E1ZWGWVWsAo0ulUsk7RHVE/MXdU5zaIb/CW1tGsUOcOA55M19temq2QWc7JdLtmneZuNvXPemUSpNmoyEfxFcXPA6x3bnRT8nJ89TArMVLcnpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCr9WBCO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCr9WBCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A06C19421
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775600851;
	bh=JZbozZJfo3JEqmgU5TH3L1HCGLqIQzeAQCeMzZcML34=;
	h=From:To:Subject:Date:From;
	b=TCr9WBCO59TRGlU/MtNDIgSSm1WRuZDSQw1tetqA8WeUzfipWfFuOdIBbir8L7RiZ
	 NUhkeLrKfw/cbiz2Vy/DjqryyhtWEBucQgi8zUk/neTQTUOEOeJE/a7+5hLWL+hNcY
	 4ttf8NwgDgKwOz2Bu2OWK+Pky0derZNB3fPN3j9pkBCFbFVGokkSnk60x3vL6yJTho
	 sIvCAUIlshVNRZplv+3q7zmU+UAXETpowHfAD1jH9q/Cn8e6FXm7uJ5xHcDFYknBsT
	 Ah4yLBpg5pXgtt8rdKnJu0EkCLD8eDhD6h2qg7ppHyd3oODieMjH7rmGspYmW7tOkw
	 lK8duH8cQFRaQ==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 1/5] parisc: Avoid compat syscalls when COMPAT=n
Date: Wed,  8 Apr 2026 00:27:10 +0200
Message-ID: <20260407222714.178861-1-deller@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Drop unnecessary code and syscall tables when we run a 64-bit
kernel with conpat mode disabled.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/syscall.S | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index f58c4bccfbce..bc5421ca537f 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -241,7 +241,7 @@ linux_gateway_entry:
 	/* Note!  We cannot use the syscall table that is mapped
 	nearby since the gateway page is mapped execute-only. */
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
 	ldil	L%sys_call_table, %r1
 	or,ev	%r2,%r2,%r2
 	ldil	L%sys_call_table64, %r1
@@ -250,7 +250,7 @@ linux_gateway_entry:
 	ldo	R%sys_call_table64(%r1), %r19
 #else
 	load32	sys_call_table, %r19
-#endif	
+#endif
 	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
 	b,n	.Lsyscall_nosys
 	
@@ -374,7 +374,7 @@ tracesys_next:
 	/* Note!  We cannot use the syscall table that is mapped
 	nearby since the gateway page is mapped execute-only. */
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
 	LDREG	TASK_PT_GR30(%r1), %r19		/* get users sp back */
 	extrd,u	%r19,63,1,%r2			/* W hidden in bottom bit */
 
@@ -1326,16 +1326,19 @@ ENTRY(lws_table)
 END(lws_table)
 	/* End of lws table */
 
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
 #else
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 #endif
 #define __SYSCALL(nr, entry)	ASM_ULONG_INSN entry
+
 	.align 8
 ENTRY(sys_call_table)
 	.export sys_call_table,data
+#if defined(CONFIG_COMPAT) || !defined(CONFIG_64BIT)
 #include <asm/syscall_table_32.h>    /* 32-bit syscalls */
+#endif
 END(sys_call_table)
 
 #ifdef CONFIG_64BIT
-- 
2.53.0

