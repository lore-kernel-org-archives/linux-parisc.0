Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747138;
	b=bI8VLTmg17herupAV8o6scswiPZjMuXe6PfnSkam0dV/OH2elM8XoSR535i6MGmeTXm0
	 uvNhBrsuTdkjE09Sx482hCK7zjlHuE08mLvo4DutJJFIdHtxCeQDLqLHFBidfeUe5kWVO
	 qvra9bsYNn5XT/2XdCHtTu4FXyMQJoszIN68BlAsaJhhSj2snBVK0XnkANRO802Pl7Et7
	 OUjR1ueaLx981kf9DMyUa01SQqCUklwPtHkjmiMlLLkcwstZlZF31IUcvh01fLPGW0ZbN
	 3RdnrzVcpO6hktb6CjcamSrn907mmqBXyMLJ4dmETLH9DEWR2GB5FWdYCfdZmMZenyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YfuOTmof2gsRmvim2eXfKzstnIYN97rqaWOcrpsbpsw=;
	b=tLZyoZyfSHiHoP75l45hj+2xQU7xo/Oy2+km3k1/RUmH1G1M4UGl8s0osg/xF3TuMLxL
	 a51yz0oZfSUVqGY92OYtB8ZUOAhqBuUpUP+apxGLYkWiGuiRmAmPSwDktrdSSSEWQl40D
	 03pIPbxHOLoNU3Qw68iUqrLa/zJ1VUYD/9YP8KOjoCzcHjafuhABAHoj9coehy083zvvl
	 B/B87ytK6SkV+WayEY0lrSaMWGCT1ikGMPjAQ0p7+5QodmdhFD9aG/OF5LCqBiQIGU5c6
	 YAaaV+TbjwmC62zp0Jj2tvpB5h6f6AzmXus4ZbeHVFaZxow5PaLaBO/ezp9guQjFssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sygmKrOD;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6091E606A31E
	for <linux-parisc@vger.kernel.org>; Fri, 27 Nov 2026 02:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6091E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sygmKrOD
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67daffde88dso4451101d50.2
        for <linux-parisc@vger.kernel.org>; Thu, 26 Nov 2026 18:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795747137; x=1796351937; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YfuOTmof2gsRmvim2eXfKzstnIYN97rqaWOcrpsbpsw=;
        b=sygmKrODaACAkAAGV3Wb+E0VIB1YGKLOS+rXSXqA2u6b4VVRGZXDQVOPKOF7sSlBdy
         oLojVZhwv9ZcstTV+uvW01uass1hJMz61MocsK6DceNXiAssf8tm3wmbEE/W9CJ2bSw0
         ypssy2dRrC1/kbI22YRfJdwGzSG6+KxjNVWW+sNvita95vO1d25dKAZH0LUCJFq/Wk1d
         zzSFumpt7baQSKwkxCPQxtidPyyb0rc1NtOnLY/EEQcxfuF6zpznf6rEcxYVSIfYLeiY
         s5pn7dEVlPW3KrPAWU6mVOVwl9KXzQ+j8YN/hqLl2bZNJPMkN7TgcSBkEd5SIRGOowPg
         /+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795747137; x=1796351937;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YfuOTmof2gsRmvim2eXfKzstnIYN97rqaWOcrpsbpsw=;
        b=Aw77qjbdQCvmRyYy3dO8LM5+ejE07GwK83VKUeXHFw2rfDr3fo+MyijErRt2mz5jaV
         7ym1ENEoIPdP4azULxfLz8H5fURWqRSdaBS2gvgvG7v0STowtVJhPwIsbC6lRaKg46sA
         Uuv9Z4lMQLHHMZXZTW3ksMc9wXBoi1hIbU2anVF5rPHP+XcLDea6Jov03Pp5jRfr5jEx
         w2MUd3976/tiBWq7MDd5IXk3v5u+MCDfiUKxX8gNgaXdJDzdeVjin3DshkHNUUltfIBK
         nkyvRG89M2CGpjDDcU0FY4+qR5ALQMIAcOIICRdCP5jnE/w9MzhEwvhFkghDzjiYP553
         ZcVw==
X-Gm-Message-State: APuU4Z+4sMatZABB6QmbFpy1OjNB3SA9Jn41ywYgiTZBj6W5yX661clv
	N7kSwVw8h6ZNdOjPc9P6mGYo4ulG1bZQijqpuiupgsAygD4AwHNHQNw1
X-Gm-Gg: AZFdTZeXtKnaYiHQYyd+KdQNhgi7SKyESoF2SBNGcx29N4xH83xp9q2NAbp9XUSaivX
	XcC5cGgdeS22vCQEur489gmAANfIAQRyv5DOrFtAxH/RGQ/LaIRXPWd2HZQ3hTf4sninHSZI+R6
	SRDL+vq1WPA+9YB0+NJ9pp8pKh5v0zGGJZTOhPN/Azlf28rZjMkgqDzfPl3WxJI4GVISROZKfub
	+eL1DhQwrScQNP5UbZQNwh4Mqg8R9HnfQcSUZAF3FrB1sBcA68vMBKs9K4JbSRWQgpCNdJ7ii0+
	xmds0+Nlf/oR1RIxA47NbKy9248RZpNyqtQQYK5ko/SOmeoPVIi2MqYM50p39XB8LCAEraqwPtF
	LOFSnS9imsd6PPNtWMi0ptnE/0rB2cjZvDD5e2rJb7M4KM7ZMeUy6TzVpgohNyfyf/EhKKOG2Ai
	ywORTP7cWTb6Wdg/gvFkR/QXqYvj5hG4NB202j+9hX+iqIkRcpHoSW41E2e+V8+HzaVuDsdKJYc
	48F+P339uw5veBPk9ofg0r9PLUpF/1gyEcF5Ph5RFxbXsBb2+RCB6ZoFMAEtjslThH6QhjrDdU4
	ygBcAOHU6hVJBmlMqPpFTLCYP5pCUJmjzCBvWeVrQPPuIPwe2N0Bd9xiOoXxr6nTUTe9DVduP4J
	+jmqi/FO49Jf0fsavGKFVgmaxhbqNRS16X+etRK7uFdc=
X-Received: by 2002:a05:690e:812:10b0:67d:ea5e:e50a with SMTP id 956f58d0204a3-67df442605amr5491951d50.46.1795747137114;
        Thu, 26 Nov 2026 18:38:57 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df3354fe3sm10610891d50.10.2026.11.26.18.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:38:55 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 26 Nov 2026 21:38:54 -0500
Subject: [PATCH] parisc: Mark cr16 clocksource unstable on SMP again
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
Message-Id: <20261126-parisc-cr16-smp-v1-1-fb8e1f730eca@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gbMKKP0KsWFxrSNoB2SVgri3
 Z22y7f4fwcXU3G4FDuYbOr6XDOoLIAfw3oX1CkbQhUiUYiYBlNnZKOIviTkWIeWG6a2E8hVMrn
 p53e89n/7e5yFX98NHMcJOCSLqXMAAAA=
X-Change-ID: 20261126-parisc-cr16-smp-c6327c4c178e
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, stable@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2312; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=cteIzx29elWlpjr9bUBZsIRGIRHKEBsTO5rCfT6X+o0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLI53trusOqPC5U7w9Ky4sKvVq2d6xtemZxIzqt7/6Yxa
 NrzvyeEOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYa47+MDP8UHzrPe/
 Fy6QMR3zu5T734PNO0HTIWb3R+zRw4P5g98Qsjw4mH6z7xzEqwWfon5LZqbmrIB312h8Qk9a8ya
 Vr3S7n2MgAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Commit 340233dcc016 ("parisc: Mark cr16 clock unstable on all SMP
machines") stopped the kernel from using cr16 as its clocksource on SMP,
because the cr16 interval timers of different CPUs are not synchronized.
Commit b5ff52be8913 ("parisc: Convert to generic clockevents") moved the
clocksource registration into time_init() and dropped that check, so
SMP machines use cr16 for timekeeping again.

On a C8000 with two PA-8900s, the cr16 timers of all four CPUs differ,
by 0.5 seconds between the cores of one processor and by almost 3
seconds across processors. With cr16 as the clocksource, time jumps
backwards whenever a task moves to another CPU, and systemd-journald
keeps rotating its journal with "Time jumped backwards".

Register the clocksource from a device_initcall() again, once the
secondary CPUs are online, and mark it unstable on SMP as before.

Fixes: b5ff52be8913 ("parisc: Convert to generic clockevents")
Cc: stable@vger.kernel.org # v6.12+
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/parisc/kernel/time.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/time.c b/arch/parisc/kernel/time.c
index 71c9d5426995..c14fb9002cdd 100644
--- a/arch/parisc/kernel/time.c
+++ b/arch/parisc/kernel/time.c
@@ -229,7 +229,23 @@ void __init time_init(void)
 
 	/* check for free-running 64-bit platform counter */
 	parisc_find_64bit_counter();
-
-	/* register at clocksource framework */
-	clocksource_register_hz(&clocksource_cr16, cr16_clock_freq);
 }
+
+/*
+ * Registered once the secondary CPUs are up: time_init() runs before that,
+ * when num_online_cpus() is still 1.
+ */
+static int __init init_cr16_clocksource(void)
+{
+	/* The cr16 interval timers are not synchronized across CPUs. */
+	if (num_online_cpus() > 1 && !running_on_qemu) {
+		clocksource_cr16.name = "cr16_unstable";
+		clocksource_cr16.flags = CLOCK_SOURCE_UNSTABLE;
+		clocksource_cr16.rating = 0;
+	}
+
+	clocksource_register_hz(&clocksource_cr16, cr16_clock_freq);
+
+	return 0;
+}
+device_initcall(init_cr16_clocksource);

---
base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
change-id: 20261126-parisc-cr16-smp-c6327c4c178e

Best regards,
--  
Matt Turner <mattst88@gmail.com>

