Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ADE26E71F
	for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 20:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123183; cv=none; b=oxVgozmqERB1pcQY0Tx62Jc4cv4E0Dh7SENvE8S568/7SiJinweZC8Tu9FpSBvLxR7atKKW/WDjQRlmO6cY66bnSKApafgmFR3ySLJ4JWAHgvmacib/OfU/cJbjY/DM624BV/LqdgDrOvcyTTE57tE5/PHsB9LxOvVw+e2bpkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123183; c=relaxed/simple;
	bh=dgRlrPA0xNRpVH6a2orSrjoVD6Nad1aDhCkhQHF7NZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSzIOB8Wm2Av5QHtjdQHFdY/gXFrwvKO4qPL7jo0K/gFkkE6eR+DNEIAcY8ahKD7OdxlppJ1pRpmMyqrXrvaVf4EaW5RTSD+28gRM0stHK0dPEf67iGyyGh4Fu8QWWW5DsHO7fGiATujwMoSexdFTWoVCuKVZ0ZQs8f8G5HbOWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4ulL8SM; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4ulL8SM"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1826307a12.0
        for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 13:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123178; x=1788727978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUPfcFMxDXMk/XqBeY+4XwVjn+mvGP82psS7PbouEZI=;
        b=K4ulL8SMDxQGY9peYtUl96MNzOmlNI+cDtc9p4EoZ2NfPXPLblNsOnlFSu94jxZ9xf
         CwIjBZMSdGrzVsvZ+vg6/nJsXP9PkNXXnkBOX5hLcr5krzFtl9U9hV7ByhKZ5l+iFr+q
         179zMzQ6kX6VRCBUQR6AlSOQWtfMnKS21QPt80xe6ATIY9+4/E4GV1DMcze92KtRigOl
         yHLgf8HKJvT4d24v8y10rTS0vukPHfzqjWiBGB0cr13v6HXNaxdXWgn1s3/xAmy7OQmd
         l3zK6yeP1DBfgwSbl3RcFzPvhFDjcKhKV+qufAsr4BHPruRstaj+1jq05xNJIxkwiJRE
         leJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123178; x=1788727978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUPfcFMxDXMk/XqBeY+4XwVjn+mvGP82psS7PbouEZI=;
        b=gxz2hEgnro0uUjlci01m22cc4uoih+kfHNpVcjfrYhvsC9j1qQjgOcZ6xIwZ8VaRrz
         4yGWMNLPo190y2ztdfyU3daO1MtTF0yb0AlTTiGuXKbCIwlsAgjyrPf/eA5N0fTWChsK
         FdXjE90D241T0s6JxqXO1MHACuHEgCKIHpwnGZ+r6JYyT3aeeRFPgCwE9ssuHlLAhw2x
         PJQn1c7TjzOAZ+2RFrVMTzEGy/4GkHnkP1SRGIXnAoUipwzomOEibJxqzMp8aBGpnQIH
         PHZZIYN9YYu09gAfAFIwPPE18o8PZtG5XyhcP/nGmgjxmGYFiGSFwwnhYOqqCWtNuSYO
         6q8A==
X-Forwarded-Encrypted: i=1; AHgh+Rrp4/wetSLgqzOxWfOv3YPL/sksNsOAZ4YDcCqrPZeILYec3u6Ud82/L9R9XY+eS4U54xJk7pmceacDDgc=@vger.kernel.org
X-Gm-Message-State: AFuF++mrz3nEVE1SgHpj9CPR+tWJEMwVrAFiqpK/bx8zEqW6cIXXfqVE
	WF995b0Ldg3/3JC6sKEA2cAWVFR6jpkx3RL0NN8RZhWoEZK2vys/fPbe
X-Gm-Gg: AR+sD12BaeGM9cbjxW6n/8bWJc+atfwbq2AzWT3uwF2cewe5j+TsK8C9U5FNvbrlj9v
	s2BJa3w18ICN4LKnq02RenfKAKTUM1ZQZ7TuuHwkRD3RWTzNTSvGeMVpSLAykH4fIektiDqCeAy
	BMEpfYcapSx9o1tvEStz8OakXcAJ3AyLYokbqhGO3sy0PgWn/1/zsmeo3/KtCcpsa7hKswle2dw
	UV7YtfMUbtXC+8IyC0bw5+68gXuQA+kw0qj6qwau+bG5NiBi4IA88AtZdfPhC0Y9OWDiSuRfUeh
	EUBApfnr6nR0yH74tj2IZ9Fe8ndVbDopEvgEN0joZnBTYVelr1hi+MfoODX60P+6Sofa2P1pBrE
	lxtG9wFzT7zrc3LPWN8bO1AEklKhDEPmZYKC/28S0sPYrGidrjtVCCVo2+JqJq0WVWNuDH49lyx
	zdPgk2XGtgdsvFXpfesEM14vwWaIIzQe8hmPGKMUfbp955SJpSIU7l5Z+qE56JYG6rTJHV6rXtW
	gHf3J9cctOggdxlvzpLX1nvF2+TeQRKCN/U6C/g3w2bGt7ozMQ=
X-Received: by 2002:a05:6a20:a108:b0:3cc:f280:ebc6 with SMTP id adf61e73a8af0-3d265c4270cmr33755175637.5.1788123177680;
        Sun, 30 Aug 2026 13:52:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 13:52:48 -0700
Subject: [PATCH 3/7] Input: gscps2 - protect buffer access in read and
 report helpers
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-gscps2-v1-3-c733d4cae7f9@gmail.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
In-Reply-To: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

In gscps2_report_data(), the ring buffer consumer index ps2port->act was
read and updated locklessly. When gscps2_interrupt() was called from
process context (such as during port write or open) concurrently with a
hardware interrupt running on another CPU, two execution contexts could
execute gscps2_report_data() simultaneously for the same port, racing on
ps2port->act and leading to duplicate, skipped, or out-of-order bytes.

Protect buffer access by taking ps2port->lock inside gscps2_read_data()
and gscps2_report_data(). In gscps2_report_data(), acquire ps2port->lock
only when popping entries from the ring buffer and release it before
calling serio_interrupt() to avoid recursive deadlocks if the input
driver synchronously sends a command back via serio_write().

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/gscps2.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 5b6e311f8a02..fef6fffb6f86 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -238,6 +238,8 @@ static void gscps2_read_data(struct gscps2port *ps2port)
 {
 	u8 status;
 
+	guard(spinlock_irqsave)(&ps2port->lock);
+
 	do {
 		status = gscps2_readb_status(ps2port->addr);
 		if (!(status & GSC_STAT_RBNE))
@@ -255,7 +257,7 @@ static bool gscps2_report_data(struct gscps2port *ps2port)
 	unsigned int rxflags;
 	u8 data, status;
 
-	while (ps2port->act != ps2port->append) {
+	while (true) {
 		/*
 		 * Did new data arrived while we read existing data ?
 		 * If yes, exit now and let the new irq handler start
@@ -264,17 +266,20 @@ static bool gscps2_report_data(struct gscps2port *ps2port)
 		if (gscps2_readb_status(ps2port->addr) & GSC_STAT_CMPINTR)
 			return true;
 
-		status = ps2port->buffer[ps2port->act].str;
-		data   = ps2port->buffer[ps2port->act].data;
+		scoped_guard(spinlock_irqsave, &ps2port->lock) {
+			if (ps2port->act == ps2port->append)
+				return false;
+
+			status = ps2port->buffer[ps2port->act].str;
+			data   = ps2port->buffer[ps2port->act].data;
+			ps2port->act = (ps2port->act + 1) & BUFFER_SIZE;
+		}
 
-		ps2port->act = (ps2port->act + 1) & BUFFER_SIZE;
 		rxflags = ((status & GSC_STAT_TERR) ? SERIO_TIMEOUT : 0) |
 			  ((status & GSC_STAT_PERR) ? SERIO_PARITY  : 0);
 
 		serio_interrupt(ps2port->port, data, rxflags);
 	}
-
-	return false;
 }
 
 /**
@@ -296,11 +301,8 @@ static irqreturn_t gscps2_interrupt(int irq, void *dev)
 
 	guard(rcu)();
 
-	list_for_each_entry_rcu(ps2port, &ps2port_list, node) {
-		guard(spinlock_irqsave)(&ps2port->lock);
-
+	list_for_each_entry_rcu(ps2port, &ps2port_list, node)
 		gscps2_read_data(ps2port);
-	}
 
 	/* all data was read from the ports - now report the data to upper layer */
 	list_for_each_entry_rcu(ps2port, &ps2port_list, node) {

-- 
2.55.0.897.gb25b4bd76c-goog

