Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCE51A682F
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775600853; cv=none; b=FI7koh/TMHf0SrqJXoLGbCnAdNwAaHAcNEuqlAjf4HiUOrQLO2ZIiPUnGGWq0ZYV22eHrjMom65+fTl8IYo4vYEm0GpamJz49NLLpv5u1Qq58ApHiGFh5q+52heIJOYHOpeg3ZG6P1FiJVGo8Fp3FCV82gwWxksSLM5FKpemCO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775600853; c=relaxed/simple;
	bh=5KSn8QZX7vxNaF2vT1dKIPhRl55RnwMjy1UBxgtM6UE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ7y72XOJ7MbCPPhDOepqTDjYfsVtuQlwCAjhWdrD3KzXwxjPEr5tv0sYFSICv/XWtf7pP/mfhIJCCy6/2MdRIAzoiXomMhvxBCh/uxPYHQ2DGFzxXaGjgBKNrBfIIX+7Bp/7We+FAh+LAq/PlhZtlDIsFhA0TG6Hzlc8iVthro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5JrvNTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5JrvNTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED21C116C6
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775600853;
	bh=5KSn8QZX7vxNaF2vT1dKIPhRl55RnwMjy1UBxgtM6UE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e5JrvNTT2jjjn8Mu4pxNAVVwRaswL/CBayj6QLlucOpPP6yDir7sO6ix7c06UfbmY
	 T1N7du+F0unR3wjsGHso5W6H2wV8Ak/7k/zKQFkCV+IIHJ3vzf8PB6s16SskqBd3pz
	 esm1rHy4WNJoyYMvqJ7WhsBAWubQCjIBOwKGtMfchcxt1gocl1EanKt61gS+9ev87B
	 m+t0K53Uk/aquGsP3C9xQ0jwIuYMSTuxJragInDg2u8FCKzVQzBUqnz4VlHK8SaPti
	 WFPsJz2tJ0cUC+2HzPcFoEXP/1VZaRrQQcWTgGTyDlcd6ig0NHc2TkYI+jxd6N7aht
	 LCZ9CKOJs8SCg==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH 3/5] parisc: Fix signal code to depend on CONFIG_COMPAT instead of CONFIG_64BIT
Date: Wed,  8 Apr 2026 00:27:12 +0200
Message-ID: <20260407222714.178861-3-deller@kernel.org>
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

The signal handler code used CONFIG_64BIT to decide if compat handling
code should be compiled in. Fix it to use CONFIG_COMPAT instead.
This allows to disable CONFIG_COMPAT even when running a 64-bit kernel.

Signed-off-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/signal.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index e8d27def6c52..64a62006bb15 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -80,7 +80,7 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscall)
 	sigset_t set;
 	unsigned long usp = (regs->gr[30] & ~(0x01UL));
 	unsigned long sigframe_size = PARISC_RT_SIGFRAME_SIZE;
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 	struct compat_rt_sigframe __user * compat_frame;
 	
 	if (is_compat_task())
@@ -96,7 +96,7 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscall)
 
 	regs->orig_r28 = 1; /* no restarts for sigreturn */
 
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
 	if (is_compat_task()) {
@@ -112,7 +112,7 @@ sys_rt_sigreturn(struct pt_regs *regs, int in_syscall)
 	set_current_blocked(&set);
 
 	/* Good thing we saved the old gr[30], eh? */
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 	if (is_compat_task()) {
 		DBG(1, "%s: compat_frame->uc.uc_mcontext 0x%p\n",
 				__func__, &compat_frame->uc.uc_mcontext);
@@ -218,13 +218,13 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs,
 	unsigned long haddr, sigframe_size;
 	unsigned long start;
 	int err = 0;
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 	struct compat_rt_sigframe __user * compat_frame;
 #endif
-	
+
 	usp = (regs->gr[30] & ~(0x01UL));
 	sigframe_size = PARISC_RT_SIGFRAME_SIZE;
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 	if (is_compat_task()) {
 		/* The gcc alloca implementation leaves garbage in the upper 32 bits of sp */
 		usp = (compat_uint_t)usp;
@@ -239,7 +239,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs,
 	if (start >= TASK_SIZE_MAX - sigframe_size)
 		return -EFAULT;
 	
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_COMPAT
 
 	compat_frame = (struct compat_rt_sigframe __user *)frame;
 	
@@ -349,8 +349,8 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs,
 
 	regs->gr[2]  = rp;			/* userland return pointer */
 	regs->gr[26] = ksig->sig;               /* signal number */
-	
-#ifdef CONFIG_64BIT
+
+#ifdef CONFIG_COMPAT
 	if (is_compat_task()) {
 		regs->gr[25] = A(&compat_frame->info); /* siginfo pointer */
 		regs->gr[24] = A(&compat_frame->uc);   /* ucontext pointer */
-- 
2.53.0

