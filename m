Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959A137F01B;
	Wed,  8 Apr 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672371; cv=none; b=lt1SPYLnqlSflUXr+cThNFeLTGDlIWjB1MX0epfd/inLhdXugpqREOsxR2AKfqZN9DYlb8LmGIdGdJuyxXkGvEsbqu9BCB9AaPmUvctwby5BXqQEq+xmDKFlMtsjqrhpUSpIOLmJk6PevUKONmYNJC5EnzanSZnp2SGY78B40x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672371; c=relaxed/simple;
	bh=y+vuimZr1QEgf3cyUhn2VTovWRpjXL7ZNQrLPM/61Iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNahpXXL99+DovjVvNjVDX0MwH2sSMX84jHmSxIEI8kCV/xzJuZXSQIk6tI8k+tZazW8eXBGVFsvznQGqWkkYI+1HkOSwuEyPssy4XWj34GhgbMNf1IYFlGIP+SI2zMl65LXR9+7hzq2VF9FkfrSG9nCEZbsS37XYNd45+9x82E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ATezhdn4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ATezhdn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775672361;
	bh=y+vuimZr1QEgf3cyUhn2VTovWRpjXL7ZNQrLPM/61Iw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ATezhdn4Ag/qnLVEhQ5rqDOybLQDK21ojlshLWy7MYDPcxwUvSSTxopEJU/zLIn/J
	 o6EkJu/DXayYoXo3O8+0N+VEHJXsNlzLvpZxKE+N1bkIF29/1qv04zrU7tCDD+30er
	 TBhhBH/c2aSwdQUQLw4lpA2q6prhmfmVn3hs+4sw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 20:18:42 +0200
Subject: [PATCH v2 2/4] parisc: Makefile: use the regular compiler to build
 a native 32-bit vDSO
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-nolibc-hppa-v2-2-7fe404cb61e3@weissschuh.net>
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
In-Reply-To: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775672360; l=1055;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=y+vuimZr1QEgf3cyUhn2VTovWRpjXL7ZNQrLPM/61Iw=;
 b=wryT14LPe5rt4Gv3eCYREHAqOcX/wbHPqHsHA0OghjaEs0wkS7jsBWzyqFr+f//yVHgpeR+hC
 UzfjWVDVjPKBCblHLRKuJYPOV1xwwENEhsnAwKzBrlT+LPHew2hk8X7
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
index 92b769f4bbe7..ab8a93e773fb 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -49,6 +49,7 @@ ifdef cross_compiling
     endif
 endif
 
+ifdef CONFIG_64BIT
 # Set default 32 bits cross compilers for vdso.
 # This means that for 64BIT, both the 64-bit tools and the 32-bit tools
 # need to be in the path.
@@ -58,6 +59,9 @@ CROSS32_COMPILE := $(call cc-cross-prefix, \
 	$(foreach a,$(CC_ARCHES_32), \
 	$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
 CROSS32CC := $(CROSS32_COMPILE)gcc
+else
+CROSS32CC := $(CC)
+endif
 export CROSS32CC
 
 ifdef CONFIG_DYNAMIC_FTRACE

-- 
2.53.0

