Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4343E558D
	for <linux-parisc@vger.kernel.org>; Wed, 15 Apr 2026 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776272728; cv=none; b=AdOHyHsUGlPxLAK2aEs7jMpVMSDSPYMkGGwAisY4f8JAB5aiAdfLORVqEprRk9PrYD8ut2PthK6c8KixogaQ+oAnizESgs7n6ia1+ZsedLo/PrVYErHWKAfeOGqrirJdde5E2WjTNqfciBuwEyC2ONMSt0qLE4D4DcWutW0W+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776272728; c=relaxed/simple;
	bh=1Zn3MdRMyjWLIyrQcNN+35GVvqWTDtyPLOv6jmk0AwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lU56aAdpEdpyPyqHImI3d0rok/CgUGOWhPclJ+tzZa22XAaU62URqSt+ppaaUZ4MDdLhhWqSjLcoLDsX+u0pasOQRUUQUNdTw2j9ymQXrOcJLigY9I/dJpn5EVhq+JNSMx2Z0sSMiL5Vqfbyc/DZHJp7I3dKCMc5EbfdY1+BQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3DiXkGL; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3DiXkGL"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f1dcd5886so2983815b3a.2
        for <linux-parisc@vger.kernel.org>; Wed, 15 Apr 2026 10:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776272726; x=1776877526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=veen0Vc8lnvEHEqHsNTL0m1ag5OPOf79GJ5X3Fcd3Ls=;
        b=m3DiXkGLSr6L5u3CBK3ogoVclqgKduUsQqIqGcYjV7dsAhteqnrPdqe828tv5JfRnw
         S/yVa7m3Xfel32YuvAsYHrYCcZ8dLuZHnCzCdWbX63UMT4p7yt9P1ugnrAkB3Ae6GthE
         FjHIpYFj+K8kQSCnD6yrZRZnIFBfVkUowqI2rXQMCX5+5PaMAduyURwYm2VsN/FbXOLa
         9NArOJxH5aDzffWGKGdHWjkoPm7CpcFdXzv176PUWN6DsyfKJE4LsvhSzAhqSaUXrXLG
         5jpxjJzmEXL/B5xcSWpp4nj1IU/paFK/Zr3csa2fsyq3O6J8v4/LIcDx+oyOr3LLPKXJ
         O7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776272726; x=1776877526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veen0Vc8lnvEHEqHsNTL0m1ag5OPOf79GJ5X3Fcd3Ls=;
        b=FpHWWF/KxAe62Zc13OcTt7aPKhs0XNRcwnFbaJu/Hs1jhhc2S9muS9BkoUY7FjFc4o
         HBai+/z5aFPpPA+SdysqqNqbj8L/hO5p0XTtQJg5G0tcIFQcCWn/jGE7pz9X3bNrukjA
         Hdl/lvjrScWZ6bIn+g9SizJIZ1dyPTCd31c5ClMD22AXRT8SCX3d4DTn1S0mkuB7Nhg8
         FTnxf3tCBMctXG5pjB0rIv1d0VP4vcLRnL34YMHsuB078wClb1CTcE5QAXNyKZA7Anqj
         VVF7M5lHL1XokxCxtymgfiitZPaOdiHTudHzQ1KQYy/Z1XNi3OWQudyiGWAOVAM6tRg+
         TDHg==
X-Forwarded-Encrypted: i=1; AFNElJ8k7dA1WcQMELp5ZTGzjjl0HBVenSejnheTLAVxfJqsmTIBkrkqVDX2Uvqi8wtwXiga5j25cge3bh2JO7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJ9+V2zXFOM/+8nBM96Kj6GwAzYcT0stWc8idCaCLMkkK9vtD
	7zZ6k2Z4AGp20OiiG+F6zfN1VKASilmyp4ZA6FYHrvPh+dxCW3vPr8a8tGW9Tr5pdyheEv9L
X-Gm-Gg: AeBDietYE8eG8Fu9dKIBgk2C7mTrP0xpcRHbVZvNYrECPPMeIP4vE2pSjWaRnHHTU51
	4CxBhdvv90bKU+USqSfqzA7pNPOUSpSX9dyTc3XjQ0x0cQJJ3TxIuDPcaxuZyKAvlJjnAYtIVf7
	C7QbQ0bhWA4OXGszaMrqhkTpX0w3VNTuIhNhghhQ181uBUmiWU5R595NWg6DTJ21yoJJ1raOwE2
	/fVvYo0xJFhsRboGJH/96xQHm5Ba+lJxnMm7uIsQVijE4A84jqVCb5CDm0McBflfe+BqdMW6Fi0
	rFWFwbOOiqfwfTQ6+HNCtwaeoaR5PP0fr7noBcbE9ZiNHwS+P0PwKD9HIlthUyRqOuBH99nry9x
	c9PjUDL8RjL/nDroS2H8kkJdt6/uFk97LarBKTTdfw1Z50gY4mKYw0wTxZtefMdjZ7E9TKH5hI6
	5hH8wRj6WfUkhO29FLlZnJobjKTu9jiOsxgTEw
X-Received: by 2002:a05:6a00:8c83:b0:82f:1b50:d2f2 with SMTP id d2e1a72fcca58-82f1b50e2d6mr13938223b3a.18.1776272726443;
        Wed, 15 Apr 2026 10:05:26 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:48dd:8f21:beaa:cec8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6f52d45asm1522337b3a.38.2026.04.15.10.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 10:05:25 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] parisc: led: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 01:05:15 +0800
Message-ID: <20260415170515.3605095-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in startup_leds(), the embedded
struct device in platform_leds has already been initialized by
device_initialize(), but the failure path only reports the error and
does not drop the device reference for the current platform device:

  startup_leds()
    -> platform_device_register(&platform_leds)
       -> device_initialize(&platform_leds.dev)
       -> setup_pdev_dma_masks(&platform_leds)
       -> platform_device_add(&platform_leds)

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() after reporting the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 789e527adfc33 ("parisc: led: Rewrite LED/LCD driver to utilizize Linux LED subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/parisc/led.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 016c9d5a60a8..b299fcc48b08 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -543,8 +543,10 @@ static void __init register_led_regions(void)
 
 static int __init startup_leds(void)
 {
-	if (platform_device_register(&platform_leds))
-                printk(KERN_INFO "LED: failed to register LEDs\n");
+	if (platform_device_register(&platform_leds)) {
+		pr_info("LED: failed to register LEDs\n");
+		platform_device_put(&platform_leds);
+	}
 	register_led_regions();
 	return 0;
 }
-- 
2.43.0

