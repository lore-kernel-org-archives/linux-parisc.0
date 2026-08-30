Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993C731714B
	for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123184; cv=none; b=H4Xo+2W2ZQ2tczsk6oU/uMA03uiQ3t19/jmRuB184FTZRELcaYwm/Ua7JwfAkh7nF0hAOXa00WUjrT9US77NIowUp8JNrtPFQb9lFT26ChkcqOVig1gY0f/OEUkrBPuT58e+1KE0dIIaJl677vJA9R8OrhMDM+yp00teAt90rus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123184; c=relaxed/simple;
	bh=/6qnuDkJ9Pht84ieqMDQcNLwfOfRm8nb+vO15yDAXbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFJcGXXaoKeT0vy1Uf7D62R/yHiYkxeCE1SE88mRtRTOQEWXKI6ayS6QANpsfPYt9CSMD5fbebKUJyJqVD0I67bituy+cer1glRJLtJPaWeATsXwXttaRGGy56llKcikDxx6dCRfX+x1zTcO6zRaDqn90Ej1zxgiXACPzG+TdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUvPLYQ/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUvPLYQ/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6f55a7089so28064275ad.3
        for <linux-parisc@vger.kernel.org>; Sun, 30 Aug 2026 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123180; x=1788727980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhuHXF4zjm1wA7Hdsp9+NElntybJGb7Ekfxcvka1Z1s=;
        b=ZUvPLYQ/ZkFAolW5sswKw9z38UVckOFX5wfnEvt3ks4/JgadPo4EVky/2AviIsCRdU
         QTWtE76sc1wB/KwaxeXdprpVPUTt9mA7BjGaadkJEmbcUW0ZA/NbTfLjdmu9Sahv4u02
         nD8LAe3qu6YO3ahLzbOz8mMa7robhkRtihjqPBKIYqWhhAo+V83vi9cpfuCG9G8Nn6Fn
         tgIShKE7vYazJWvysyUvSXyLgH/HVhwwrfYynhLO0txp/TDeq5ogZDp1X3xHsmOAjDoa
         EJEXNyElnk6KhcesOh3gdlu75eiWx7dmvUOI+suidQsuWc76MX07YTBTAqND3kLuJ94e
         vqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123180; x=1788727980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhuHXF4zjm1wA7Hdsp9+NElntybJGb7Ekfxcvka1Z1s=;
        b=pAMn/h30qs3uAEOe1TKhFTj0Pm56bYUyPc+vKrORNm6IHOew2VVi8tjE9+XAEMQuxd
         c21u/SL6hVpfzCVLz8FJ9ze72tfANukz6Qpjq4gDfnr1kX9WzeMEMIF6EuaflIvaEr9Q
         /fHtH+qcNtzzILLMXi01N225pXzb7/z/dKuD1c/OMDvnH6J4jNvz1A7a96Hvi2Q7D4ZL
         dTGzhTFv4KD6kWAx2S1wpjLnkoq3AJd2aLdC1vRSXARVmKJoJqxuJcmZLKD7nFjjh/0u
         fLwQXh+gx+78H/EWruw58vps7p4SyhpBfcEdQ5Sd8nwncopKUHvm4oGG6xlYJ6mhRwv+
         oGBg==
X-Forwarded-Encrypted: i=1; AKwUvByV/hcP9o6sLDIoVpb6gDmJvGuK8B2HrkHtJPn/jBUMF2ZTjoOoBR2dDXNZ2D1IBP/nnJpvAp6kehoKH/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lj6fnZHXOSao21yPU0v3I5+keGJ0XYbaNdYGXTSijazoN3wGPU
	6QJVJjzQVzkfriVANKqXcSkN5gTUFU7Dz/zG3cS6C9ZaMp18NC7+63nK
X-Gm-Gg: AYBFou0rWIy7CyyjWiLMIUSquvQchzqtgN7kNHF3Ocja1iVza5OE02xkmrFThql9taO
	i4zli/LxzrBzqaiLtXYr1SR7Yjku/hn74goj7P2389Q3Pg+ErmhiSi+3nVp1JFSOan6xVDSk/ZO
	baZj8NEFtTVwdGUFupJ1b0utNGtyBksIh54nFaqo2fLN1W4XQzXKn2o7Sp9RqqHCXJEwONJ+TT0
	KFx4Cf5OcDPlptNb29txrYqcoPylhvvySzBcR0t433GuG3LScz8tfd0/uBrB6Wkbp/d43Zfg3/a
	19+zScI/6HTQKQ/+KllgxYTkqsxVFmk7i2KSj9OToF2nf3quOybBkWveess9iCpAcGsDRk0E6ab
	uVdtGd/PiE5nchTYskYzrHl6XgpWHNEhGxGXxSFzGtbbwNCEWVubYoW5KwiJptqfoYs7TeNvInf
	7CPyFvkQFOAtp3ZWnJ6aiujbY23/gmpg5qDlWM9zFxU5bRJkqXP0CH3kVTIbOGgo+gkHdR4n2qJ
	IbndwerBA2v+PeRzUQYM+koUVQagX0/pauQtnQCJWbk1614vWm2e5Fow4PFWA==
X-Received: by 2002:a17:902:f546:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2d74df45042mr327708175ad.12.1788123180207;
        Sun, 30 Aug 2026 13:53:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm26849437eec.24.2026.08.30.13.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:52:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 13:52:50 -0700
Subject: [PATCH 5/7] Input: gscps2 - return IRQ_NONE when interrupt is not
 handled
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-gscps2-v1-5-c733d4cae7f9@gmail.com>
References: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
In-Reply-To: <20260830-gscps2-v1-0-c733d4cae7f9@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sashiko-bot@kernel.org
X-Mailer: b4 0.16-dev-b242f

gscps2_interrupt() is registered with IRQF_SHARED. Unconditionally
returning IRQ_HANDLED when no data was pending on any GSC PS/2 port
masks unhandled interrupts on the shared interrupt line and prevents the
kernel core spurious interrupt detector from identifying runaway
interrupt storms.

Have gscps2_read_data() return whether any bytes were read, accumulate
the handled status in gscps2_interrupt(), and return IRQ_RETVAL(handled).

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/gscps2.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 36c25db9ff7f..907fb1537595 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -236,8 +236,9 @@ static void gscps2_flush(struct gscps2port *ps2port)
 	ps2port->append = 0;
 }
 
-static void gscps2_read_data(struct gscps2port *ps2port)
+static bool gscps2_read_data(struct gscps2port *ps2port)
 {
+	bool read_any = false;
 	u8 status;
 
 	guard(spinlock_irqsave)(&ps2port->lock);
@@ -247,11 +248,14 @@ static void gscps2_read_data(struct gscps2port *ps2port)
 		if (!(status & GSC_STAT_RBNE))
 			break;
 
+		read_any = true;
 		ps2port->buffer[ps2port->append].str = status;
 		ps2port->buffer[ps2port->append].data =
 				gscps2_readb_input(ps2port->addr);
 		ps2port->append = (ps2port->append + 1) & BUFFER_SIZE;
 	} while (true);
+
+	return read_any;
 }
 
 static bool gscps2_report_data(struct gscps2port *ps2port)
@@ -300,11 +304,14 @@ static bool gscps2_report_data(struct gscps2port *ps2port)
 static irqreturn_t gscps2_interrupt(int irq, void *dev)
 {
 	struct gscps2port *ps2port;
+	bool handled = false;
 
 	guard(rcu)();
 
-	list_for_each_entry_rcu(ps2port, &ps2port_list, node)
-		gscps2_read_data(ps2port);
+	list_for_each_entry_rcu(ps2port, &ps2port_list, node) {
+		if (gscps2_read_data(ps2port))
+			handled = true;
+	}
 
 	/* all data was read from the ports - now report the data to upper layer */
 	list_for_each_entry_rcu(ps2port, &ps2port_list, node) {
@@ -314,7 +321,7 @@ static irqreturn_t gscps2_interrupt(int irq, void *dev)
 		}
 	}
 
-	return IRQ_HANDLED;
+	return IRQ_RETVAL(handled);
 }
 
 /*

-- 
2.55.0.897.gb25b4bd76c-goog

