Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A008420469
	for <linux-parisc@vger.kernel.org>; Mon, 21 Sep 2026 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022090; cv=none; b=kkVClmhAESZTMx7VKnylu8jmeCWzdbkBQIxUQsfd2aG5pSDa9zxb185p8IjP9u9R1YhbLmm8JwvKdLSdrWmqeNJ4jZizBxd5247NvWUFsv+gSC3tsb4Gz3VBNnfPpON0odL8MNOfLpc6eEI5jfk8zU5nv3dJSawY+3SoVpGTKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022090; c=relaxed/simple;
	bh=6nMLbNhaQEgDo98muzZTjTviXY1YIjfT2om5I9WVDAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MvVqpDcw9+NxG2cWtV+2btucfvwMhl9JchzRW5qgOykRWoDNYspnZmOA7iGzMOufUdOSOMkwkVAZ3E5F6diHnATa4OOvV/o5ffIOopOrMd0LzQu5XPGvTnaPdN2TZn1wZ/yQ0LohGlNh4SF6jVrofGlEWYz7u4Xh5apzwJZ/aIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCAgr0kC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCAgr0kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5664C1F000FF
	for <linux-parisc@vger.kernel.org>; Mon, 21 Sep 2026 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790022088;
	bh=FwAc80JT6guNDC7bETP+6RF8VzGTXT8JTae4EScH23A=;
	h=From:To:Subject:Date;
	b=SCAgr0kCb01ASCajJ/eQ5GHQ0+is9ndqzTfWoMn/wfYjJDBK28/LHaIvrnVW/1sA7
	 lZnVa4oWkyTvq0bTampDm6c6BSyAjf7COcz70ZW8ORYbshwqtKDSug9/AOlwexRs7u
	 DDlku1CKXJVuR4tVh2rxxNkNeC2MiKM2zL8ASMpUkv/sQwVxD4ulU3rgSMX4IX66BY
	 b+pzkV3P0V1xMR93SEni+L9MbGPC7L3+Cxd+D9xCySmq4pl3fD9Z71Qmed9gXujBtY
	 0E08cNzQO5KaWnSTdYB77aV02+YTSGy0HFv6cOxPa2GjEOr5Knl92LKr+ABiJzSxn3
	 52fFw6bq95uTw==
From: Helge Deller <deller@kernel.org>
To: linux-parisc@vger.kernel.org
Subject: [PATCH v2] parisc: Increase kernel stack size to 32kb
Date: Mon, 21 Sep 2026 22:21:10 +0200
Message-ID: <20260921202122.3102-1-deller@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Helge Deller <deller@gmx.de>

For 64-bit Linux kernels, increase the default kernel stack size
(THREAD_SIZE_ORDER) to 32 kB, in order to avoid kernel crashes which have been
triggered recently when building the debian vtk9 package with gcc 17:

stackcheck: kworker/u128:0 will most likely overflow kernel stack (sp:179a83af0, stk bottom-top:179a80000-179a84000)
Kernel panic - not syncing: low stack detected by irq handler - check messages
CPU: 2 UID: 0 PID: 30760 Comm: kworker/u128:0 Tainted: G W 6.18.46-dirty #1 NONE
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
 arch/parisc/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/include/asm/thread_info.h b/arch/parisc/include/asm/thread_info.h
index b283738bb6da..249370706242 100644
--- a/arch/parisc/include/asm/thread_info.h
+++ b/arch/parisc/include/asm/thread_info.h
@@ -24,7 +24,7 @@ struct thread_info {
 
 /* thread information allocation */
 
-#ifdef CONFIG_IRQSTACKS
+#if defined(CONFIG_IRQSTACKS) && !defined(CONFIG_64BIT)
 #define THREAD_SIZE_ORDER	2 /* PA-RISC requires at least 16k stack */
 #else
 #define THREAD_SIZE_ORDER	3 /* PA-RISC requires at least 32k stack */
-- 
2.54.0

