Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9783264FF
	for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123185; cv=none; b=niSyAP4P768jupQL9QWKdYMQbuK/B8d7JZ1AKVLBrogQswPBI98k3fB4Ehmq8jvWZaC8tW0ZA1AcDokDV86ksH6UqCgYndmHVsax0cszwtZK0XiifiavZPjCBgdwIhMunUCYCCf+9LPO8Itq8WMplAk0Bif8ywN3CMAJxvZYaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123185; c=relaxed/simple;
	bh=EOnSXOVAAeXVYSqilMUhL2SUOzE8QoOUvM+prd9A1TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmYHXkFosy4qBUEEJhDUDogPUlJ4qlJPVFkK/gN6DgUBR4OKfOLveIPb5h6+YKoh085lLPXYPQGky0oxPBQTny34CG8PpUHVhEwULyViHNR/wRe1ynuwZOREWFFjJlvIrzy6Y7FUcByhjhZqa/cGwoUuSiMrjl37QGqt+HDerpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjXVZdSd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjXVZdSd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d712281f8bso31122295ad.1
        for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123179; x=1788727979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsQW+e9qFtWuEHb6msaYSCJD2h6v64jckrT0lnLqEOQ=;
        b=GjXVZdSdWxHhSfEhqJ8f4a51fhS4ThyTHXbGnhbNAG5wJt9Y3orej4TlIrgsnZcWxW
         E0s605c0keDlpf1+vdcR8rrPE9u+gFnSuNLwiRYuEuydLolOaAgrPjBiUAGU/O1JMtXo
         7QxH4YvFAF6fod38gVg0R9n0eY7SfPhToTCWyXYDaasKr4pI6LLnTO7LZwRBIDiApFV0
         mc4IYzuaRl7c28C0ron65xJ4zugSOjI1FRBBa/jTr6yOrvhudPqnpZOmY3j/p1zuT6k3
         gYzUEFj6VBB+icdKFVdEQMiVPrQud6tLQ8ZvtIakaVVjCF0BXNM9VGVezNQjHHjRXxTK
         r4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123179; x=1788727979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsQW+e9qFtWuEHb6msaYSCJD2h6v64jckrT0lnLqEOQ=;
        b=k3OAss0TAHihw77zGpNrdzupzPmc3zAZhR93Eik9A1MWwRaVzzCwdx/xewCnYTdQfo
         EFugxhZKHSX4U3w3MACFqVZpCvGk4HpohK2pR5b9sGi/tHLE4GhHZsN4eZ+L5UbRP4wk
         gBhJ44bAdVgk2ABVgH+0nh5ZUr0NwCbuR0QkQRYVHKxm0g09tMEMgYWgtm46wdA98aZ1
         5wCF6ONQVRDV3LRAGoah+mIhukOwVqAFtkl7TpTiXexml5TOYBne7kaNUrwjc5MT5R6l
         /NiaYqG7JqmURCduFpGo5FvJx92GypJsFaJVPNaXvlKCFXIXZY+/0ypC5NAyfNylaOaW
         gPJA==
X-Forwarded-Encrypted: i=1; AKwUvBw3sTkH1cHmUYLUkY8/VeyR4bivJknvOcFiR3VkFgk3C3kmyddKRoTAq/UyE8zRPt2/SMrnUpFH+NVXHX0=@vger.kernel.org
X-Gm-Message-State: AFuF++m9SKlsMob/UZtqj1apmTM5BM8mBiDcEBHelzFLnPxp4UbK+Ig0
	BQMnoi5PXRgkNxe5F3pxORM8ZE96BvqYaTsGSuqZwj5nGQkzFJ0R1fA7
X-Gm-Gg: AYBFou1j5xqS9L1Ni2TVU6GcXUsggeLrvF2oohPBbTX6KOjk08rTLDDuJi5V8hgEUCi
	oCFnpS26J+rSZob/IPU04M7P/7eFWUMg0J0Px00ni9gVFW/ma/QYVqz3VYVrifCZKi/xtuekL9i
	cX8/1jx3brFuZGnakVpj+KkBUXt0WwgSsYtLetLoQ6C6twdOQUqEyDXkYLsR7Q87fNxDZjhXWHc
	n3Wgk75ZrmeQonQkL3nvNG2mHPyf/qDUIUHaa0B6+5YccbkEqaS+QGIxOae5VHV5stuDOQfOZW+
	gFcOPNLvDgGhLjcBxFI/TeMpNyUc1nwXZUwFdDDEtuz43Tacg7KHzpMm530i/4exaGFIsuADub7
	6f55eIZCXmi2QZ0oeyBQyR+ayb4Gj3zldRfXTVwnEQcwzWxVYFN0pITBhP58yj9gCdfQdTSi3/7
	rUzPQ34n7YCqksbVKKwfDIU1DE/DaXxxTElWOdLiW9Q+JYuomK0ZP8eUhAvrk9kqaD+VpJuqAMG
	2egPQKoaFhY74Tipxb3v+yCtBUj8tHyYGe06HBj+AJm/9P8MCg=
X-Received: by 2002:a17:903:1aa3:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d74dc1065fmr279050945ad.2.1788123178954;
        Sun, 30 Aug 2026 13:52:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 13:52:49 -0700
Subject: [PATCH 4/7] Input: gscps2 - serialize hardware and buffer access
 in gscps2_flush()
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-gscps2-v1-4-c733d4cae7f9@gmail.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
In-Reply-To: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

gscps2_flush() reads from hardware registers and resets the ring buffer
indices ps2port->act and ps2port->append. In gscps2_enable(), the
trailing gscps2_flush() was called without holding ps2port->lock, racing
with concurrent hardware interrupts and buffer access.

Assert that ps2port->lock is held in gscps2_flush() with
lockdep_assert_held(), and ensure all callers acquire ps2port->lock so
that multi-step hardware sequences remain fully serialized without
unprotected windows.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/gscps2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index fef6fffb6f86..36c25db9ff7f 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -228,6 +228,8 @@ static int wait_TBE(char __iomem *addr)
  */
 static void gscps2_flush(struct gscps2port *ps2port)
 {
+	lockdep_assert_held(&ps2port->lock);
+
 	while (gscps2_readb_status(ps2port->addr) & GSC_STAT_RBNE)
 		gscps2_readb_input(ps2port->addr);
 	ps2port->act = 0;
@@ -364,7 +366,8 @@ static void gscps2_enable(struct gscps2port *ps2port, bool enable)
 	}
 
 	wait_TBE(ps2port->addr);
-	gscps2_flush(ps2port);
+	scoped_guard(spinlock_irqsave, &ps2port->lock)
+		gscps2_flush(ps2port);
 }
 
 /*
@@ -551,7 +554,8 @@ static void __exit gscps2_remove(struct parisc_device *dev)
 
 	serio_unregister_port(ps2port->port);
 	free_irq(dev->irq, ps2port);
-	gscps2_flush(ps2port);
+	scoped_guard(spinlock_irqsave, &ps2port->lock)
+		gscps2_flush(ps2port);
 	iounmap(ps2port->addr);
 #if 0
 	release_mem_region(dev->hpa, GSC_STATUS + 4);

-- 
2.55.0.897.gb25b4bd76c-goog

