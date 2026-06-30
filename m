Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00B83F86F5
	for <linux-parisc@vger.kernel.org>; Tue, 30 Jun 2026 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811551; cv=none; b=YNrYAVxIZObwS9Z1c8KAYOs7K6mbUGJ99GBxmYZpRCoxtQA1fdp/GzaRSifuqKsEsth9DUjwdrVnSV7guHHBiKXXE/4Zq2BlszNrTDM3pnMWQN31EfPzlC1xF7fQ5lpFwm0luUttfPndpsiML4JW+SoscWlFSyoLYC53bBWBGhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811551; c=relaxed/simple;
	bh=MRvLY17pbM4TTs+QySmJ74+XzDsCvr5hq+uHOeZJA8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTtQLuf4X7sKo0HbOTQe5xT0PizTGXY6GisJd9ZMB+3+RptDvKAQ14Wti5RF9EvsHLNQgfMZtrDTUSQYfF16nsv5InFqZeE2/vRU2aawjlUcdaiB99T/vHwvUEORcxacuYwxr4RrhzcqoPbBAdzMX1h4mu6Ipb3y+Zp+pY3YS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=c5BypQhv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="c5BypQhv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so2486785e9.0
        for <linux-parisc@vger.kernel.org>; Tue, 30 Jun 2026 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811548; x=1783416348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXxk8WYvRbGG7VeDgVB8LyavPKJyGQ2lYgVSE1kaTfw=;
        b=c5BypQhvKYEh95TjF/60crvxj1DUWp7ifPKygeH03sGebkPqP0GHZvMADOHl8IdBr9
         3GkKdZjnE9DQvUqpHOzJMmfcvkzaiHwUbJt+x92l9jQnOFl8GuwKSvTfM5pgMlqAIqMc
         s6pQKVzrG/GOapErT7Layi82K+3mLK74GWbJTRcmR0tFW7uNoVD5kOZOuwxH4pfGlRZB
         lcPnalpKV7AJmhnXzpzf9PSJYoRicGMFH8wcmhYtvmkGeXa/2i7dPP8buEpxOV/KEtOV
         h49wMqtK9OD+TbnK70Oe1BYClWW7zDhVMI0twWTGWOWNbh82Z/a/I5Vl5mc1EyMK7X34
         2VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811548; x=1783416348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xXxk8WYvRbGG7VeDgVB8LyavPKJyGQ2lYgVSE1kaTfw=;
        b=aL2ral3uyR2rpvHwMGVq2jeow2hLVpFlQTecZGk7I1CNeFQVuQVlXnPq5CWKPJiovN
         1WCFDaMdRODV3HYDv+4I/jC08FWH7ofK157h6mns2nxzAqFQ1LVWV38xlC9H42469xf+
         4LKUC4k1dPggRtx+uSgqS02CidE7V0innpvjERu01NasGtRdaO1/IVAe8btGMKy+9B6G
         sYSRHlCGN9/CUw/oPYbD1D8V9NvwLDgPIx16OQgCoNBKkp45puSGnelE83EKtbQ8Amx4
         NX5BCesp1CxClJpp1GSsMzTXHZ8O1OxdN7wrf00nyHV4d6d1WVDO+1DpUoKqtG7Vjsml
         d9cA==
X-Gm-Message-State: AOJu0YxFrla42hbd275biPn9E5JWF8Yd8aEiqA6ixELapVzYsGDh4jWg
	z5gtmPm4osQqX+869EI+TxbNf1199uDDYgMXKTKTq7U/qLWo+K6YpWD6HLpfie8jMHo=
X-Gm-Gg: AfdE7clL5UMA0WX/+OawsbBX66F0iU+EWVc2Uhiy6hY33Iq+czkid6CYBXY7P9S0BHB
	p17T8Q4J2cGAkhjoejMdugTSYK3TS7w7uZMYuElC7Tr+gGVTeC47Slp1Xe0oBU9N82rovsNS79Y
	i3g0FLDH+YeiPOhpRKB5Boo13i/2N9PCfULxOYVWq947W9t/ARb0rkzP8ZBiJ2ZJy1GgAeXDRWb
	4czoXJ+OlWjOYTLvdvc2BFkqEGQTh+uon+OnNnupkSvLNjG7GC7lJZ7BXDJ/mZQBLplvOkgW8Gq
	2tPOD5RwkG+t76ScjhrlXHmYf7AbIWk8TsLd7TKWMwuVJ9mpUNTrrNiJLBjC1pIHfP5artByHqr
	broURao5zRt6qz7Hz0ipM33mFv4aTU5Jz7yef8Z1d41h+0uISRlINejt1T4xpB+J5B2lZDHBP6w
	PE2bqkgCO9dwC/7QrK5ZJ1EVtlULa+iddV6Rq+NTZ8sW+hfNkbetkCb7E2WMsBcSzKHexco+X2k
	tUh
X-Received: by 2002:a05:600c:548c:b0:493:bb45:d52c with SMTP id 5b1f17b1804b1-493bb45d5fbmr18291765e9.25.1782811548376;
        Tue, 30 Jun 2026 02:25:48 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bc19f4b0sm26290415e9.1.2026.06.30.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Oleg Nesterov <oleg@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/17] parisc: #include <linux/compiler.h> for unlikely() in <asm/ptrace.h>
Date: Tue, 30 Jun 2026 11:24:34 +0200
Message-ID:  <0574a2b73363c3cbf21c55c27455c3cecfb33583.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=MRvLY17pbM4TTs+QySmJ74+XzDsCvr5hq+uHOeZJA8U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4tvhvvYxM5X83NpM+WshHM956pp4PuSnhBXJ B26XGCIaRKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLbwAKCRCPgPtYfRL+ Tvo/CACck5TBX1kQca+6xZAvCzOaAzsoSSIEIJek3VXR2FNDyjpVjpmXsPlRsOyOMqp1G6g4SWr IRnCr2fr7zF1O5hfmT+D55ryaUOwsqkLfrrBXOxb9zmgSZQQK1WCvOYEtwQynVJClKq7l2+n1LM UnUE+srbkmWf1BCRXeZzB6E9aMK2kzoYpn206KvTHb7YTZVUABnayjf6uNpoJ5V3335feag9WaR cwL+e7H/pL21GXe0kln2omhriPFeAE0Mnr5Co0BC0JJ29u78CNPXRZEuCsvyXNqq2qTGmUpcXAJ Sg01hjUxrL6TWwMbz8ndhV1aFSzzy6KHCIKNnDcrmhIOyK9o
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/compiler.h> isn't included at all (not even
transitively) in <asm/ptrace.h>.
arch/parisc/kernel/asm-offsets.c just happens to include the following
chain of includes before <asm/ptrace.h>:

	<linux/sched.h>
	-> <asm/processor.h>
	-> <asm/hardware.h>
	-> <linux/mod_devicetable.h>
	-> <linux/uuid.h>
	-> <linux/string.h>
	-> <linux/compiler.h>

. That chain will be broken, because in one of the next commits
<asm/hardware.h> is changed to only include <linux/device-id/parisc.h>
instead of <linux/mod_devicetable.h>. So to ensure
arch/parisc/kernel/asm-offsets.c knows about unlikely() even after that
change, #include <linux/compiler.h> explicitly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 arch/parisc/include/asm/ptrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/include/asm/ptrace.h b/arch/parisc/include/asm/ptrace.h
index eea3f3df0823..5e1f52b3922d 100644
--- a/arch/parisc/include/asm/ptrace.h
+++ b/arch/parisc/include/asm/ptrace.h
@@ -7,6 +7,7 @@
 
 #include <asm/assembly.h>
 #include <uapi/asm/ptrace.h>
+#include <linux/compiler.h>
 
 #define task_regs(task) ((struct pt_regs *) ((char *)(task) + TASK_REGS))
 
-- 
2.47.3

