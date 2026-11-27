Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750059;
	b=HsVeXn22d92UMAcimZHoF4ly9UHsUeAVrumTzggWGJ7yDeZcMGYCPtfdFo+BYIqolNnl
	 /9zM5OVHbJEPaU0ZwyELhQzgKcsC+YjfiIXerxqcJL6flvB+o0s2WdCMG0e0KeYd7ut3a
	 qE8Tg2hqGzawJRQxEkLaLsyiDnnXMKCCjVN1e0STr7jl/pwxE81x+FN6Ne+SD1sG6RYZV
	 Hr2r/K1F6JAUDxkPq5sQiZUZZ0e86qpVahlgE0re0ojReeno9+yzFOs69kxGnK5LnJY/B
	 0ThRCEM4bvcet7cZv/qjD70slpOBIS/3IDcL8Ix1WV7G2sm9y8kgG84QwGNIjCKZc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0aRR7bt+IdRDucoufUU/pxd19W+TetsGg/VG99RY/kE=;
	b=ze5mFhhlsZl8e9UTN6ho2kOTD/OFzuOFhTwCsgtkrkLCkr4HOt7vbKKkIZysbBttRhUY
	 srmpnBSC4M1wfrksxE+BgkF1iGr465dTaZx4EzPfW7raXu2p4hgLre6b3n7isGscABLeM
	 GApBtBPcNZXL0e3XAX4GdNdeAu1rQV1IFd86KuegNlLAFPeXIYMu/jvbo8sZvJuTHF5H2
	 Yzpus9jVg/MAkbs08WKmauo/1RYKaQfG2jMlhrKlzifDZV51h3ve/R0XMoBxr+rqormqj
	 FY8DchsVTkiVF/mGHjedY3RkTB+8AMpZ8zLi4MBMlvVImV+EWncrplXSIbv2KG/Z/aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkzQrSo+;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666BB606A31C
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 03:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HkzQrSo+
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4e246acc2so54414877b3.3
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 19:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795750058; x=1796354858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0aRR7bt+IdRDucoufUU/pxd19W+TetsGg/VG99RY/kE=;
        b=HkzQrSo+K4woU6qpntXDeoxMXzs2oS9JHhkAXlQp3X2luaMr/akLopRYffFSlWVzGf
         rX6sEzbVPei3AqpUykA4pghfWSEax6/be46iokoEiBcP89jOmo456DRXdDwzgt8Ce5jQ
         1j5KSgsL3LBW6E4MDqaN/my0bTKaVDpbxFK35FchfnjKO0wGAPZJL32szuGljORqxrhO
         rD/ZDPyOoUVVW6lmgzSxOJk3W4/VPDnt6lmZM2JrduiVvYzqJqkSgL0PofPliGRxDvpo
         LtPf/ZGlZ3xjIwhauCV1IgFI4Yzo/mWzkRKwcsbD1He98CwyROW4bluaiukwAqHBucqH
         BLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750058; x=1796354858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aRR7bt+IdRDucoufUU/pxd19W+TetsGg/VG99RY/kE=;
        b=aA/Ti+cpE173ZDw7+6xBOueS9sJFChgKVtHvBZRQW6bKF5g4JglPtwXYvoqdCrE061
         IOnqI5SfXObut5pHU9B2B7ykcwT/c9v7oul1q+i9coPGjkbfG1NKWbCEJgtZtGzq+zfp
         hhjjCIEXDHsgv7jIMAQ/Lg8zUMefPAF2xEbZigRb4oatPvXdHR08GGb9XlYyfebo/fXr
         v7uVQQtNgTdYjPmZyEgeKp6KCikUU7ohwyp/NhvwmHPjvBjZjXovm5c7yX1QbfG29UWu
         yByD8MkfjyIivwvS5UboIRnX+po3LQ/Kh6sclNcCk1QGemjUvmsJj4wr4uRwLjWGLzsC
         zN5A==
X-Gm-Message-State: APuU4Z8P64q1UB82ps0oDr6dLzPgMCpRu7MNJ2rFavJ5xceqV24M4xjm
	B99LY5WbbczFTufX7MmT5RMk54o6KCsO0qPkG531+OZYAe8Pg1SPwfNg
X-Gm-Gg: AZFdTZf3HzZKKmrs44TD3vv1wjryIR0WEdFpC6N9/YkU8Oc52UvdeDADdByGgqO4PxB
	5YzgGFE8v3Rg/vgNRuN0XG5pcKdoFhAv6GCYR16kO48HIiLdwKN//NE7GNSyrm9guZsCs+n0Jet
	UzWRqA9Vydv3bmBhtcpSAE7fBB6D4zkBnzE0CxkQ4JRV9+FJVWbIpJismBMJI4qr0k2/68WKVxX
	4WNPAuxvozcr/CPMVanMk5llYsqRx/B/6N3vIm8khcn3i8xoxjuJNT/zVTdxI+SXwnZHY70feX7
	Gu5h961Qcb0puK537jaC5mItsZMbM17o4Nc9Ww/VF8v1F4j0tZQsqzXrNMfGLIlAoPJEWcUAMmZ
	GsoW2jgo3yt3g1NJLqCXkE0mGByp6wMu8Zr47a303gdXiVdbVuHsCzkGoMHtOkCbW46rbKqPsxa
	WBzUgugfYpW+p3ue+cqWgx7Hr67GFvT+e1I8EyPjW5EYwc1j5UujgQGjVamcSJTM+7bWpqu2IoA
	mEbhaOPFmhFbsNwwpw7zQuzUYsiQs16AmkxDTeeJ/CRvgW8FLUJerh+K+y+VeSwuNp3MHghOrur
	qspul9AVe0g5xcO42lEV8rjHMHR9CtggQHwvEmFD07duDU0Vku72PqqZQocKAryX+yJccOk7AR9
	FVYOzFXoyZoBkY+SaHMMgQ0pj6t2B3YSJoYMXL6b7EpQGDU79kpB+cDDNt4ygLEA=
X-Received: by 2002:a05:690c:6b81:b0:8b0:aba3:a3e2 with SMTP id 00721157ae682-8b5204b13d7mr96994407b3.37.1795750058470;
        Thu, 26 Nov 2026 19:27:38 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354770sm92613577b3.42.2026.11.26.19.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:37 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 22:27:23 -0500
Subject: [PATCH 5/6] parisc: Skip the IODC console init in the HPMC handler
 on 64-bit
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
Message-Id: <20261126-parisc-hpmc-fixes-v1-5-80fb55336ac6@gmail.com>
References: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
In-Reply-To: <20261126-parisc-hpmc-fixes-v1-0-80fb55336ac6@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc: linux-parisc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1962; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=/k/wyXw0nkoctAYto2u60DcV7GITl56nF2iHL2q8YA4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI5fkz38fe/de25G09g241Dkw/k/zSWf9tQ53cwdj3L7
 UU2/5+KdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1J38zMpyonbN5fi
 6z2fmjF1ct5j06c15m3J61RsFrudh5Dtduv7WL4b/H77bjW1Rn29ySqblraTHRJ2pnhW3Jc7YLo
 qLLLazjXbkB
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

After PDC_IO, os_hpmc loads the console's IODC with PDC_IODC and calls
its ENTRY_INIT. Both calls take more than four arguments, and os_hpmc
passes arguments 4 and up only on the stack, which is the narrow
calling convention. Wide firmware takes them from %r22, %r21 and down,
so on 64-bit kernels these calls get garbage. On a C8000 (PA-8900, PDC
2.13) ENTRY_INIT returns PDC_INVALID_ARG and os_hpmc resets the machine
before Linux prints anything. Passing the arguments in registers does
not help either: the C8000 then takes a second HPMC inside IODC.

The register dump that parisc_terminate() prints goes through the
kernel's own console driver, not IODC, so the IODC init is not needed
to get the report out. Leave it out of 64-bit kernels, together with
its 32 KB buffer. With this, the C8000 prints the HPMC report and
panics instead of resetting.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/hpmc.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/parisc/kernel/hpmc.S b/arch/parisc/kernel/hpmc.S
index 04d01e183474..cdc19f496f81 100644
--- a/arch/parisc/kernel/hpmc.S
+++ b/arch/parisc/kernel/hpmc.S
@@ -47,10 +47,12 @@
 
 #define HPMC_IODC_BUF_SIZE 0x8000
 
+#ifndef CONFIG_64BIT
 	__PAGE_ALIGNED_BSS
 	.align 4096
 hpmc_iodc_buf:
 	.block HPMC_IODC_BUF_SIZE
+#endif
 
 	.section .bss
 	.align 8
@@ -201,6 +203,13 @@ os_hpmc_3:
 
 	/* FIXME? Check for errors from PDC_IO (-1 might be OK) */
 
+#ifndef CONFIG_64BIT
+	/*
+	 * The IODC calls below pass arguments 4 and up only on the stack,
+	 * which wide firmware does not accept. parisc_terminate() prints
+	 * through the kernel's console driver anyway.
+	 */
+
 	/*
 	 * Initialize the IODC console device (HPA,SPA, path etc.
 	 * are stored on page 0.
@@ -251,6 +260,7 @@ os_hpmc_4:
 
 os_hpmc_5:
 	comib,<>  0,ret0,os_hpmc_fail
+#endif
 
 	/* Prepare to call intr_save */
 

-- 
2.56.1

