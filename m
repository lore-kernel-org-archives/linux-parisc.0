Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BCD3ACA41;
	Wed,  8 Apr 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775672371; cv=none; b=OEpnaN2WhVAv/ATrQLb6az6N4WLDTTEqJl74CX2siG6so2XsyrqpsdYL81mrrUwCPfImiD38H4/XF8JjZf6Yn71qQhPuJPYNmF8N+k8N7P5oi8/7H12cT4NBBZxJFU//lirk3WdZj2AllQaIxoeN0yOQ0YTiY4Ul4JzcDrhS0HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775672371; c=relaxed/simple;
	bh=3CYQYj58rWURjXjzWDTOAFoGP8+nNKIEt/xhRRaDy7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NHsMlQpEe4ipQji6Pxb2fni5s/p3YOQxQmgpikTdU3unNx+OE/mmpcrZI+KRRqZosSqTG8kKY/B1wDFwmr7tsPyUg1FF3igVmg9wknjoeDCiauGuXq6Kl/BP0m8mutMZP1yoHVTCv8ephZHEotGIZADf3dNLOlRYxfy0d9vzznQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=p8jZ72LX; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="p8jZ72LX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775672361;
	bh=3CYQYj58rWURjXjzWDTOAFoGP8+nNKIEt/xhRRaDy7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p8jZ72LXgDcy2dfoZM9ppjbHQ8Ks7rPlhX6U8H8dj2kK4uc2s0jrjusY80EsZKNBQ
	 C8MHoIiOZFSLJmOriohLXSXv1nuhf+5uCesQUVc+DUeJwiQ6i+eXE8gM/YKW3hKiau
	 Zzu9XiUQ1WpqSG/UaK0ZevuxHkXzWRnbzqJ6eYxA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 20:18:41 +0200
Subject: [PATCH v2 1/4] parisc: Makefile: move CROSS_COMPILE detection
 before CROSS32CC one
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-nolibc-hppa-v2-1-7fe404cb61e3@weissschuh.net>
References: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
In-Reply-To: <20260408-nolibc-hppa-v2-0-7fe404cb61e3@weissschuh.net>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775672360; l=1466;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=3CYQYj58rWURjXjzWDTOAFoGP8+nNKIEt/xhRRaDy7E=;
 b=15ZmkgcuCOqeHGD5wqvdcyAkj8w0SZhVROpftlgAxGLQgFNNQPIQ1DsG0cqzohsZMmt40RZpT
 mYAo2kkfzSYAbyaZbxDLmBV4BrwfoY27sA7QRZBBb6LndavGX1w7psf
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

An upcoming patch will define CROSS32CC in terms of CROSS_COMPILE,
so make sure their order allows this.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/parisc/Makefile | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 48ae3c79557a..92b769f4bbe7 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -39,6 +39,16 @@ endif
 
 export LD_BFD
 
+# Set default cross compiler for kernel build
+ifdef cross_compiling
+    ifeq ($(CROSS_COMPILE),)
+		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu suse-linux
+		CROSS_COMPILE := $(call cc-cross-prefix, \
+			$(foreach a,$(CC_ARCHES), \
+			$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
+    endif
+endif
+
 # Set default 32 bits cross compilers for vdso.
 # This means that for 64BIT, both the 64-bit tools and the 32-bit tools
 # need to be in the path.
@@ -50,16 +60,6 @@ CROSS32_COMPILE := $(call cc-cross-prefix, \
 CROSS32CC := $(CROSS32_COMPILE)gcc
 export CROSS32CC
 
-# Set default cross compiler for kernel build
-ifdef cross_compiling
-    ifeq ($(CROSS_COMPILE),)
-		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu suse-linux
-		CROSS_COMPILE := $(call cc-cross-prefix, \
-			$(foreach a,$(CC_ARCHES), \
-			$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
-    endif
-endif
-
 ifdef CONFIG_DYNAMIC_FTRACE
 ifdef CONFIG_64BIT
 NOP_COUNT := 8

-- 
2.53.0

