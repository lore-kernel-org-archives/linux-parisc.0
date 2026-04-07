Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A5D389444;
	Tue,  7 Apr 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579874; cv=none; b=sWuWvSlGVgjpIErcxxn6J3tir1jd87+1Ircx9TQah4P/Hc44eunEFGrlPAzw1U8awNMXxECXpasIXjnMsRMSlsPNmcqL1FS3W1I95nQzhML/pbOtJ6w2TiwpZTu54+cWPrUwNsQQVLTWX8j5/x1NjCTyRul1tS5f3ZGn79AA8v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579874; c=relaxed/simple;
	bh=rdx5yAm5WgRcvOV/xO2ZOgDn8Fsg7c8dxU+ndBRjzZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FN5k/+1XvUfFOxd2SMu9XOv7Z4A0V66DLo5kG4eOHoU3phy+A6aQkvmY70Idcixdn/zOeXR1v7EqqKcVoN2Yzeq+qNTygigbpZFdC8Phi/2P+SVYWWYY5iEP2syVKK3y9eHj5yR5Ho9SQnY/eIe94JupF24CgoIzFdb3byv1F7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MSllPerI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MSllPerI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775579865;
	bh=rdx5yAm5WgRcvOV/xO2ZOgDn8Fsg7c8dxU+ndBRjzZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MSllPerIpo4wEd6X7SmqMFwmi6QiFJkl/7wEiWsNWtysaR3LkFwz2lfTXwkmDXRVE
	 RbcxmAAiHqDypeU0zjrw0V6/vou1WJeNk/qGtxaTmxRwxMwiZ4bycNpcxjlghXjTRx
	 /FgsMjoQUjynwNjxOMEzF/OC5iOXgT6L2U/DzeVs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Apr 2026 18:37:43 +0200
Subject: [PATCH 1/3] parisc: Makefile: use the regular compiler to build a
 native 32-bit vDSO
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260407-nolibc-hppa-v1-1-f70b4509c44a@weissschuh.net>
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
In-Reply-To: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775579864; l=1056;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rdx5yAm5WgRcvOV/xO2ZOgDn8Fsg7c8dxU+ndBRjzZE=;
 b=3Ht5Skl0HbWmSNcUAMFpLqol5T8MByqT8ysCLFh0nekNXJ8NRXgnPPx4Z0R62aZDPvPJGIghZ
 1m5sfTMAAgUDRPS0+YJzfd2eYwjpybEGo41lF5AY9r9X8iZEtRFyrQ6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

When building a native 32-bit kernel $(CC) the compiler is obviously
able to compile 32-bit code. There is no need to force the user to
configure a dedicated 32-bit compiler.

Use the regular compiler for the 32-bit vDSO when it is sufficient.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/parisc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 48ae3c79557a..57320e1d8396 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -39,6 +39,7 @@ endif
 
 export LD_BFD
 
+ifdef CONFIG_64BIT
 # Set default 32 bits cross compilers for vdso.
 # This means that for 64BIT, both the 64-bit tools and the 32-bit tools
 # need to be in the path.
@@ -48,6 +49,9 @@ CROSS32_COMPILE := $(call cc-cross-prefix, \
 	$(foreach a,$(CC_ARCHES_32), \
 	$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
 CROSS32CC := $(CROSS32_COMPILE)gcc
+else
+CROSS32CC := $(CC)
+endif
 export CROSS32CC
 
 # Set default cross compiler for kernel build

-- 
2.53.0

