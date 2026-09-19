Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40722931F4
	for <linux-parisc@vger.kernel.org>; Sat, 19 Sep 2026 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789849078; cv=none; b=pR4R7bC9QBgyxs03LwwN8HdLnheFXBzXZpLh1BZIF3BO6ZjOCrB4AEnWlotm1xkaaOXvoj1pf08pi9dFMugZj0n8O39cghVoCehCNS4hohehR1YbO6Ce4hErFly/VMHBKMSY7uQT8gxwcolW3HbFWcn5uKuw3Cqkb8flkyXAnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789849078; c=relaxed/simple;
	bh=LKY8PvO20eeASq64/dhSrUDASUGpWtlu6Mc1JCoHvxI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BcFd61yNsZYq07u+2GOU8HfyY2SDdK+Mr7wW//ctWl9SF11nR6UdpONBfTyBxdb3YNUMTUpt2zZwfkwhe7bGONotpWaF/NmjdGDXkrNJs+UxQrM4zjREJvZQA76joxBFrAbvAjMGo4YfqcIy6EuZkyr4gQ79TI9+DUkUm4CvH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpN5Ag0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpN5Ag0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBA71F000FF
	for <linux-parisc@vger.kernel.org>; Sat, 19 Sep 2026 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789849077;
	bh=yTggLj3Ff9KyXG1g7ZnMl90yZsBWvyowCmXvvz00pcs=;
	h=From:To:Subject:Date;
	b=CpN5Ag0CvXyw53YhpoMk93oJJh65Gpdu1lwSEalHzgnp8G2q555pQ008VtLRs7IHv
	 C3gSTdLI79OcYCe/VyyaBizTlAEqjasaaqZODtbZaDUBY6m9jOcXyFzSKhUJGuRvCl
	 jKsfm4zlYFfGpKn6+wxYUqrmDcMydrQpak4/nCPKiAMLeoHAjgqVtvEbmH01l2pr6r
	 4N09pPyhQQIIvlxn9sbtgKVtmDGQGblttrDIxuMgq5X3L/T999wP9hYEFc3SMI948q
	 J/nugWp9logim3FWLPQsJmKf/N+O6QXRx/4WDomcBYvzVDoLnebqnYdtcr7gncCUk1
	 ORX5tlnwLqtZA==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Increase kernel stack size to 32kb
Date: Sat, 19 Sep 2026 22:17:44 +0200
Message-ID: <20260919201744.3057-1-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

Increase the default kernel stack size (THREAD_SIZE_ORDER) to 32 kB, in
order to avoid kernel crashes which have been triggered recently when
building the debian vtk9 package with gcc 17:

stackcheck: kworker/u128:0 will most likely overflow kernel stack (sp:179a83af0, stk bottom-top:179a80000-179a84000)
Kernel panic - not syncing: low stack detected by irq handler - check messages
CPU: 2 UID: 0 PID: 30760 Comm: kworker/u128:0 Tainted: G        W           6.18.46-dirty #1 NONE
Tainted: [W]=WARN
Hardware name: 9000/800/rp3440
Workqueue: writeback wb_workfn (flush-259:0)
Backtrace:
 [<000000004022f050>] show_stack+0x70/0x90
 [<000000004022378c>] dump_stack_lvl+0x124/0x190
 [<000000004022382c>] dump_stack+0x34/0x48
 [<000000004020212c>] vpanic+0x204/0x648
 [<00000000402025c4>] panic+0x54/0x58
 [<0000000040232230>] do_cpu_irq_mask+0x3f8/0x440
 [<0000000040227070>] intr_return+0x0/0xc

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: John David Anglin <dave.anglin@bell.net>
Cc: stable@vger.kernel.org # v6.18+
---
 arch/parisc/include/asm/thread_info.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index b283738bb6da..3fc8e79de331 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -24,11 +24,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#ifdef CONFIG_IRQSTACKS
-#define THREAD_SIZE_ORDER	2 /* PA-RISC requires at least 16k stack */
-#else
 #define THREAD_SIZE_ORDER	3 /* PA-RISC requires at least 32k stack */
-#endif
 
 /* Be sure to hunt all references to this down when you change the size of
  * the kernel stack */
-- 
2.54.0

