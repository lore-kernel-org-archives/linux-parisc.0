Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679384;
	b=m0TJcsk262M3pP6mzag0vAy7QD4mHnOfbZ7Vl4jkVwnznqxXU1+GqQfn7unFEyDdff3f
	 7O/KmTO/dIyjjLi0NflB+VykJmYPLtrhm+CVGjTPxJ9sGyXkx/Pi6Z0s5uz+Y9X7DKoQP
	 3qF7+jlV1PuEV0ELGTaQGDf+BvvRGacfXOLXazsA2UgHxoyG6Ssoj2vYTgcYbB/Zvc0j2
	 88eYOc309IQ0f+MtBdQKHSmaCTlhEf5/cGh7pv68BF9wIh7PrzjgS9Fe0uXl7LgAiexNY
	 RMybanyh2I7Vmboiwldvs2dxg1Q2w67hzR/SxD5Kar6VLaI7Q8B4wK6Xf+AylqcHJ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VSe16UOk1kzVzD8ojXb7kA7BsT/+rEGWwW68R+M8TVo=;
	b=A/B95Lp8KkeGPIeBw3yAhP2/fSgDoSjx2z23PGDgxWUVPI7Io5gVDm4Oom1PLD8vPruS
	 beIHOKYpsqmr8g/DGb+59XqWBAYJrFxyEun2/eYSk5VPcITXy+XR//nmK6LYEx+dqkunE
	 slGPyDHaue5FSzqft0DsG6sgDuMrEWcfvGE0XYGxfdN/AWGEdPbDEIPK152wKJcqz3UN/
	 cbWA7YcKiBirQj+UIABCfnmYs5VwMYCuKtVMVOBSvRLyfl9LBWCpbkv2MsMabf+5TXN87
	 rEGvZqKCb2pITttngp8xLkXHraLY0uOnN7ncu5/04NeawButWngMAz7+ye7FjExxtdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7ni9Co9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4972D606A32E
	for <linux-parisc@vger.kernel.org>; Sat, 14 Nov 2026 18:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4972D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K7ni9Co9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso6514685e9.3
        for <linux-parisc@vger.kernel.org>; Sat, 14 Nov 2026 10:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679382; x=1795284182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSe16UOk1kzVzD8ojXb7kA7BsT/+rEGWwW68R+M8TVo=;
        b=K7ni9Co9vimifkbmxN3A/WMhYEcZTJAa1C52yWXd006xAi9Zd15s4JP8+mnRQMKbRR
         +lI9mw1x5iD1SyXapJ4LLXbLbx0W0aTPRB+ELwPu28rr9fFezG1vashJxl7czosPv08L
         /0pUylFdOr2pWdxDutsD1m2S7Mzt2PWvApJGbLVCFAwm+T1ANSQ0s8rM4K4t+FCaXsyV
         bnvoafdIa6uc31zELv5pQwpf8FGTBWABEwD5NGkHFBEaoyilWoOhogh92HJaGfDsZGNj
         lXmn/CT3BOXSka24PJrVu5INE3MABPZ5wIaSU3A+Z41k5D+mIHS6zyJ8qCRvBVhDc7yC
         t9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679382; x=1795284182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSe16UOk1kzVzD8ojXb7kA7BsT/+rEGWwW68R+M8TVo=;
        b=d/BsAXK78S847wBHTC9dNVeix2iE3Fs+G3RJRMrwR8TK3irEgGoES6LzWmFfrFbCXr
         xObINMIrypcCGzW20VteyZlW/ooNo4TmxGLv4PP+pzkLBO5v4RIIuYD6w6Xqc+mNCkWT
         0H8ioGXg8nRBsc/lC1Frb7NOYctyEzCdmyxK7t0UYkKtgjxtLIjAcKN/CxrQufvJz9al
         M0ac0dtbhNUAGf//XKzwLvT6pebWsvbVQfHKi7oDOFnIdQc5gwsd8lb2jNsdUasGJMEz
         FP413Z70N848s7rwNgK2b3GC1PD9VDakWptFAUidqt8yfvEXJ04iYp5RQwuNT4bA7GJr
         JwoA==
X-Forwarded-Encrypted: i=1; AL+hErFQyiTYCP9HDpvRuLb/2TIo8y1eIFGa2RlUG3l9dxeGfDUQG+gR4w1BXN1kvD7YjbkFFhgavEa7xFbuCFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z99mQFUvPPxGngNkD2NTEe5DXvZ/gEdstgNtvJgmXRfg6sBR754
	JYL8VMFJeKj+VZiQpyTq3y7qPxdFwvHbtkSMYg8Wuy3ekl89RXrMiLIrAlygD22+
X-Gm-Gg: AYBFou0e4DViakn0MtUqU9al+ZB6JE32RehtHeBNpeSezqCjwvAZF1GVBndCklCyvlP
	vHOko2d2JAikKWjUUKatngWOzA7lZa2inIkBlkxlG2XWo5PJJvNThqg8dE8R+MFPxud03nUDLTd
	A/OYEN0Kkfi76zir8D9o05dp+Su57PFE+sUIw/Svabx2wky8MJygrcSxhVpurB2pBfsBSND8h9K
	jFZtQTIac1HUgPxrdXn0Bxq/+RuFKuEp5I/iOy1siDzTfz2eNTT83Bh3mwvHeyss0IXwEpgXrdr
	V4QzljaRg73A/CEXckBMy0xS/rnfYFeafg/H9Yy00Ghke5Ui6c9uo4fX7E7igYka5zjUzSQ8UyZ
	crHjOB9oJOiA08Lv5/m1AMNutgPKFO84V91RjbOmascKZa1eRkSyUEz9RmjUTuvXKA+6wZVekDI
	v+weaDdWAYPkK5jvjoN+AoDJKFG0NSHJ/EikWJTpCNPg640cqnkHihDbUL3v0nmq3XL8143cV2d
	SRXaI6JR9WzuTRJ40mW/TZgz4IopE2fxVpBYe63RsyoOIHVUeIDYcURtOJhBNw/MIf8FOuCN671
	tQrOdVCbtZneo23WUYOQYtXFrOlMiorEccu+E2iEDIpvuRtQqqms33jo86HaNDLd63UexqiWBkg
	fJdL1DKGjVfOHptzHS9628Ok78q1+LS4XQPI71ywJTdopo+ooHqYSQMDVNgd3lYrK1Jut5aMMSP
	1iGxKyS4NDlNwghQfUHTrb+rWtGnjKcKo=
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr1309225e9.0.1794679382371;
        Sat, 14 Nov 2026 10:03:02 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b358-dd01-fd08-0f0c-fef7-8409.310.pool.telefonica.de. [2a02:3100:b358:dd01:fd08:f0c:fef7:8409])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm13422619f8f.0.2026.11.14.10.03.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 10:03:01 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Helge Deller <deller@gmx.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sven Schnelle <svens@stackframe.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-parisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: Fix register corruption in 32-bit dynamic ftrace
Date: Sat, 14 Nov 2026 19:02:50 +0100
Message-Id: <e184f942e0933a1618f161abe672ad8a90bab529.1794672077.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 32-bit dynamic ftrace trampoline allocates a 64-byte frame.
ftrace_caller() saves %r26 at offset 20, which overlaps the third
argument's spill slot for ftrace_function_trampoline().

In the failing build, GCC spills org_sp_gr3 into that slot, overwriting
saved %r26 with the original stack pointer. Tracing preempt_count_add()
then passes that pointer as val and corrupts the preempt count.

Allocate two frames on 32-bit, as 64-bit already does, and update the
generated trampoline instruction to match.

Fixes: 6ca6366220ed ("parisc: add dynamic ftrace")
Cc: stable@vger.kernel.org
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with GCC 16.2.0 on a 32-bit SMP kernel under QEMU 10.0.13:
function tracing of preempt_count_add(), preempt_count_sub() and
update_rq_clock(), followed by a combined function/function-graph
workload. No warnings or faults.

I used an LLM to help isolate the failure, inspect the generated code,
write the test harness and prepare the commit message.

 arch/parisc/kernel/entry.S  | 4 ----
 arch/parisc/kernel/ftrace.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index e04c5d806c105..b0728dbee53d7 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1949,11 +1949,7 @@ ENDPROC_CFI(mcount)
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
-#ifdef CONFIG_64BIT
 #define FTRACE_FRAME_SIZE (2*FRAME_SIZE)
-#else
-#define FTRACE_FRAME_SIZE FRAME_SIZE
-#endif
 ENTRY_CFI(ftrace_caller, caller,frame=FTRACE_FRAME_SIZE,CALLS,SAVE_RP,SAVE_SP)
 ftrace_caller:
 	.global ftrace_caller
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 10fd5b3e63e75..963a741faa42d 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -146,7 +146,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 #else
 	u32 ftrace_trampoline[] = {
 		(u32)addr,
-		0x6fc10080, /* stw,ma r1,40(sp) */
+		0x6fc10100, /* stw,ma r1,80(sp) */
 		0x48213fd1, /* ldw -18(r1),r1 */
 		0xe820c002, /* bv,n r0(r1) */
 		0xe83f1fdf, /* b,l,n .-c,r1 */

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.39.5 (Apple Git-154)

