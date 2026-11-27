Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750055;
	b=GMfIRfD9SjhvR0npAA5CTCam/L4g62tputKePYduIY4XribKcv/lYd9HuNP4pCfPer/R
	 SMt07s8r2iRfZyPQEdeLu3Tn20FsA6oNCkra+YIf+AUof0+kVbN2tDTUAuzax6wX3iFIW
	 33nc4lnQA0mAKdZO+Tvr/nbMUtHCSGJzIVInGZ16/YHFOYR1xF8j/gKh70CotGbHtvcPe
	 tVy0L7Tg1qPgmw6TIn38/50wNG9+B0sN5Dbw3PvGFh+Z1q1teJQx+k+9v0dLt+nfvx8DS
	 j5AThYRzuzJst+g1tsg5rmLLc/8yDixQTneh9gLvJ8DayW7K5uOKN0071Xym45YTytw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/mHR8HJ9Al9bQqwkUtiyfMh3C3Sx3b1yAsM2Pctzq9A=;
	b=ntZhPal4S9ZIu60TTUpnOHQQykjTq9cdl78rwX5/01HfCMWbzgAg1V0IOA3zBaEZmh2j
	 0UHVsl0P74nGhZFc1F01DEeamyTCr5Ng5AUknrq+MmSDaXfoT/2jn5SX64LqzHAWdYUdj
	 OsN1e02b6It1byKgHi1bURge4Jr+plknddmjftoR4CgNLty3RuNon9wqpkWjceICuTBp9
	 kG0afTQPi5iTyvh3oB8aBGa1eFArzQIklCABxdiYF8vfakkmW6skuUvM8EOGP9GIxMZCs
	 o+LDcegktjP8oE050pQ0CVgR58dv+fmzLGQXQ5N7Q7JhiKrY4Tv9UuOf3mLLbDuTxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZZUfFQ9;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C4606A321
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C74C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZZUfFQ9
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67db0791748so8797508d50.1
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750054; x=1796354854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mHR8HJ9Al9bQqwkUtiyfMh3C3Sx3b1yAsM2Pctzq9A=;
        b=pZZUfFQ9d+l7wS7FnXklGX6+3O5F3SfcNgShbJtV9Cb/n4NoZiApcBPOtQ4msR2Njr
         iNU26NvagdAPaE3SsFEeyJfUmdrrFp0qgR76A8b3PKqUXJc2wwiNIzR6oyV8gwG2r8Z6
         m6FReet4XYNaHZFFZqy9HykJKOKjOIxvjHzgU1CIRkqqmc2YmvWuT68cGcwuhO44Aukl
         FA/opkwSRqsuBQmQ2Gpax6Urqsai1MEP4WF0mS1BlJhjEW3dha85OIQ1kklgbQlQTTha
         S9SaQgG+95HGyS4sXlAokPo9TjePp9Bf8PQe16B3NG57u2HojnkDvnrhKX2DeAu1NQQz
         J9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750054; x=1796354854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mHR8HJ9Al9bQqwkUtiyfMh3C3Sx3b1yAsM2Pctzq9A=;
        b=EZIPVZv+gpQ30nc+aBpaWM5Wf1I4AICfAq2nLXS5GPl3QOgJqKl/6Z5O5wzP8WZqEr
         NApY35W9MtyDMR1g97P52j7TKWxN3LjvMSTXId7lFLoB04JtvenspgBQlErE5vfxX17M
         Zk7U/YVGGDwoDbW86nhgqy24D6zGn5HuGQYPUtpdVnrcbZIyHDUehXMiCzjtTlAsNXcy
         I+vwr8aPrEXP6JzltYRMrB6f3UXHIyle0EfRbrA5VvYbzCek3A7SGiNC/DUkxQN2TTr1
         5fkahdhMKVNowjTxYOgXGNxHYTant8cOd7aAgeJk/cPrjYNCXKg89opfIRJq2Xa65Rjz
         SrRg==
X-Gm-Message-State: APuU4Z/y8bAMWTHXyeRkLLgLSRf8k7Cn6T/QLYXQ8u4gTkHNY9N9Wm0i
	p0S4wHexyvZIy7R8N9nm0FQVQVOw8mLWpsRnXVZVnN3Oj7ODbTvLHDEHP2ZzAy6I
X-Gm-Gg: AZFdTZd+c80HQ7w6llgNv2qLSMnK2x9rgAVXREVvj+MIq+Yy4DqPNGsCeQNROVJNt/Z
	9yRQtnNWM+qF7tVN7IbKAd996dO6PK08RT68yBW1bBLWxJRa0jzMBba+mdgVY2X9xRCVSPY92nw
	2qzv524PG3NEBX89JmP9lfWZUdlUpIVkCOHegEvd99lKX1/b4RRJauBosCPBjzeopEGuaHOP53M
	4ZZYPEM/fKSnIocsj3KX8grWXrV3+obBOilUc3pwwzohRtTBMHnJPojwCsL6RNodtoJ3w9nOt6O
	1RBJF7J77+4YwvVwQCfbeWoE3151TT6o9uP/MeQlKsnNZX3cqXvk6282/r32NkboRDzum7TTO7A
	wriKMJ4l1ZLsYNbfdm8CwlJXkRM3eW/WYHw8m9uL6HmZ5V3R/jIbOXyBc9iWkskv2kYsbGJ/Dvs
	j0AOlpEdyyCd5fEakNH9bG8dRB/Ccq52Uv3O4nuA+YqX/2NgepkpM0t2epJNzg8u+OZ6ctIN/Ey
	eTJG7ueGjPt7UtrOBXlXV0CrvAj7no41SotkgjUx1kHOQxTRiOiYWZHbA8Ph3kkfeh8NKRqnJfb
	u3wo322YQhSf8Oxr9PKe+Xqe7GCVYAIEnGbSr+hP+p1SbQBB3DkLmTBgTVDLGpAQ1emTXNJOHEw
	BI12OpIctx5cgY75kBX/TmDEpF8GfSbIl2Ritmsy1JA==
X-Received: by 2002:a05:690e:12c2:b0:677:d419:8a27 with SMTP id 956f58d0204a3-67df440ef3bmr11430295d50.51.1795750053583;
        Thu, 26 Nov 2026 19:27:33 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67e6aeb61d7sm337583d50.3.2026.11.26.19.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:31 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 22:27:21 -0500
Subject: [PATCH 3/6] parisc: Let only one CPU run the HPMC handler
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-parisc-hpmc-fixes-v1-3-80fb55336ac6@gmail.com>
References: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
In-Reply-To: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=dm0KN4QStYmJ2rkcMPeYtqwQ2zmCHjUNFuvjWRuingU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fky37VrK9UtBe+6Js6zpmju+952ZNlfCerHLjJk/d
 8fohj3t7/jIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrFtky/Hdx+PyZxW
 PNrCOOz2zfzXu9/Jfom5SDsmuDZ+mnb256wDOHkWE67427sc4KNTGrOxx70oN+Cj6RPbwvxe5Us
 3xFyPz12ewA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

An HPMC can be signaled on more than one CPU at once. On a C8000
(PA-8900), an HPMC caused by one core is taken by both cores of the
socket, and the firmware branches to os_hpmc on both of them.

os_hpmc was never written for that, as its own comment says. Both CPUs
then call PDC_PIM, PDC_IO and PDC_IODC concurrently and share
hpmc_raddr, hpmc_pim_data and hpmc_iodc_buf, and on the C8000 this
ended in a second HPMC (a bus timeout inside PDC) instead of a register
dump.

Take a lock with ldcw on entry. The first CPU to get it runs the
handler as before; any other CPU spins until the first one resets the
machine. Once the first CPU has invalidated the os_hpmc checksum, a
further HPMC on a spinning CPU is handled by the firmware.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/hpmc.S | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index ee39afb9bebc..b45604a09b7d 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -17,13 +17,12 @@
  * have the option to examine and print values from memory that
  * would help in debugging an HPMC caused by a software bug.
  *
- * There is more to do here:
+ * Only the first CPU to take an HPMC runs this handler. Any other CPU
+ * that takes one, at the same time or later, spins forever, as PDC,
+ * IODC and the buffers below are not safe to use from two CPUs at once.
  *
- *      1) On MP systems we need to synchronize processors
- *         before calling pdc/iodc.
- *      2) We should be checking the system state and not
- *         returning to the fault handler if things are really
- *         bad.
+ * It should also check the system state and not return to the fault
+ * handler if things are really bad.
  *
  */
 
@@ -58,6 +57,12 @@ hpmc_iodc_buf:
 hpmc_raddr:
 	.block 128
 
+	/* Cleared by the first CPU to enter os_hpmc. */
+	.section .data
+	.align 16
+hpmc_lock:
+	.word 1
+
 #define HPMC_PIM_DATA_SIZE 896 /* Enough to hold all architected 2.0 state */
 
 	.section .bss
@@ -96,6 +101,11 @@ ENTRY(os_hpmc)
 	 *   r28  (ret0) return value from procedure
 	 */
 
+	load32	PA(hpmc_lock),%r4
+1:	LDCW	0(%r4),%r5
+	cmpib,=	0,%r5,1b
+	nop
+
 	copy    arg0, %r3       /* save address of PDCE_PROC */
 
 	/*
@@ -110,8 +120,6 @@ ENTRY(os_hpmc)
 	addi    1,%r5,%r5
 	stw     %r5,52(%r4)
 
-	/* MP_FIXME: synchronize all processors. */
-
 	/* Setup stack pointer. */
 
 	load32	PA(hpmc_stack),sp

-- 
2.56.1

