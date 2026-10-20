Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513937;
	b=UOomBLVrKCtf961ctK1q63/XB1VyQl/4kOKFSmIsDPlsb8esoiuOmtAOBRmQDXLhzQcd
	 IZF3ZV/wXUtELCMvllvecAZaVe1ZbHgeBTqKDlC6VodTYp3p17QUWZ5hq1UhFvptKfSUI
	 Wk3nvb4jsVtCOWITp5Y39kx6ubE4Xag0JeG1sBTpgHC8NruiHWW4RBZMi6c/3RTxeGs34
	 Oc6i4P9vUaDVebDjE7cVMjlMy6AJjZXdUoJhQBVGNmyZEhL0klQDhXMM6laXbptgI/8rQ
	 Z8OyyR6pGfoghmEM93iybRdBluZVeLSX7LSjQ/BW2b+Xx92x+lHvhhFSgoBi9tzo9AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=g5G7S+YsIRVvDin71nNUSA+oEZIPCQiXkSY0KKPHZos=;
	b=wCICBsVsgdPkou0JC+LcnMbudinSBy9/4HelxTlVLV9xMAaLGI8pgUr+R2eRav9SxQUR
	 ZLeoJTBK8CxLFUYYVkKqIbuRsTgISnwE5Wb3NrzIRz9q3ajfMdskP87f13UToE7nCTXKc
	 3Peo6giWFNFTAuIcz+yQzHPl8Jx8jfuFfUzUPByAGAlHvEzjozCWtfJDkMhpPrN8YhqY3
	 GHB6ztm1vmn0HbQShvVlitWxJY3hLW93m0vaIQkvYtsKYdDyaT2a5vflp/bb01QoSkClo
	 y/09Q7zty8EkWNW4JxIzAiM4cowcNSgf2YNnZZZxQosHjQ6/Ai3mnqVxB/U5ClToMqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jS2LDdiw;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CD4606A319
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 16:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CD4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jS2LDdiw
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93e2f72bfso40267725ad.3
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792513935; x=1793118735; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g5G7S+YsIRVvDin71nNUSA+oEZIPCQiXkSY0KKPHZos=;
        b=jS2LDdiwXB3GeE/IrntSWD8xp/d4iybLewr1e6pnvXE1YY4WKv82QlAK7zmZKAcyeB
         /FD4qdckIBRfpof+97rSc45DWsKRbaEh4diDL1rqWIxOBbjFv5Qy9tLrXuRAxBYH6d7i
         U8RA7ernxOIpoBx3X/VcH99oQsjmTPTZwCbofTsNXdAkNk9rZN0xWu+WrggRUhJDzedg
         rJOBQgguU5wn6YhLnoS1Yj0cjyALndQEPfTqtDZQAgDs8h2PwcB7IxuOZ/cx8txg5ziO
         UHu+z1up56S8lQRDWrDEVstroTnz/IkSlzpcu/4pW1LA6zFz0XcgCam0kVSlYu0/I7Ko
         GqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513935; x=1793118735;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5G7S+YsIRVvDin71nNUSA+oEZIPCQiXkSY0KKPHZos=;
        b=DHLPeTqnB4fCz9x8RwAbuaR6IC5JkqYM+D8VcyYu8XgTCDHISTrn3yuyRnGYtLtjXZ
         g9GNtrfnM3G/4377dP6hyvNxSr9a1YaTyd4KDwXPKJ3d/8MvU51H+qTWVBSrQj9RT4gx
         STG9rZ9bUPDuYvGmOALmkfPtrO3OroXSCJQMNS4o7G9Urw1o/80x7SiptHj22aRBG+tS
         J45xi2I1e6tyO+O2IPWPdRxaGLGC7BRFAIRBJTEHBkRNUwTiiNpVylA/viAutFvq72MJ
         dqczcgrupgbf40rTOYqcTb0vymqoVOParNsPvf4Zs1qzO01y5GfGOxfU1FlEDwi7Gq/9
         x+Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzlacjScpfw2Syh19Uwe7TjIYFQhDr5rpofKQOwOBYeS3c6JdKSRVqn4Vph4lkiIw9/WCnNHRwT6H8loRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4/QI5NYrQR084kkG7IoSTrWp7cNRzTn9XBVXsanY5PqtYfIDD
	3Fun2TMiuFGJdf4vSJzqBH0KsOqXe/cMi3+YvVuOMELL8sYVzMJC8n4pivutT8AXfZMFVDXsivH
	ZgEQw9sAiKA==
X-Received: from plmo1.prod.google.com ([2002:a17:903:18c1:b0:2ea:3bc:770d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e84a:b0:2e9:4b65:368e
 with SMTP id d9443c01a7336-2e9a6d1eaa1mr102977655ad.15.1792513935041; Tue, 20
 Oct 2026 09:32:15 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:32:09 -0700
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163210.742728-1-irogers@google.com>
Subject: [PATCH v2 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option
From: Ian Rogers <irogers@google.com>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <chleroy@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Helge Deller <deller@gmx.de>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct
to memcpy()") switched __get_unaligned_t() and __put_unaligned_t() from
using a __packed struct to __builtin_memcpy() to avoid strict aliasing
undefined behavior.

On targets without efficient unaligned memory accesses (such as ARMv5),
GCC may not inline __builtin_memcpy() into byte shifts and instead emit
stack spills or much slower out-of-line memcpy() calls. Add
CONFIG_VDSO_UNALIGNED_PACKED, defaulting to
!HAVE_EFFICIENT_UNALIGNED_ACCESS, to use the __packed struct
implementation on strict-alignment targets while keeping
__builtin_memcpy() elsewhere and in tools/.

Fixes: a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to memcpy()")
Reported-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Closes: https://lore.kernel.org/lkml/47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de/
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Default VDSO_UNALIGNED_PACKED to !HAVE_EFFICIENT_UNALIGNED_ACCESS
    instead of CPU_32v5 to cover all strict-alignment targets (Sashiko,
    Arnd Bergmann).

 include/vdso/unaligned.h | 16 ++++++++++++++++
 lib/vdso/Kconfig         | 10 ++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
index 9076483c9fbb..726fd15efc82 100644
--- a/include/vdso/unaligned.h
+++ b/include/vdso/unaligned.h
@@ -4,6 +4,20 @@
 
 #include <linux/compiler_types.h>
 
+#ifdef CONFIG_VDSO_UNALIGNED_PACKED
+
+#define __get_unaligned_t(type, ptr) ({							\
+	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
+	__get_pptr->x;									\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {						\
+	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
+	__put_pptr->x = (val);								\
+} while (0)
+
+#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
+
 /**
  * __get_unaligned_t - read an unaligned value from memory.
  * @type:	the type to load from the pointer.
@@ -41,4 +55,6 @@
 			 sizeof(__put_unaligned_val));			\
 } while (0)
 
+#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
+
 #endif /* __VDSO_UNALIGNED_H */
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 597f5f0f9681..2436c20ee0ef 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -23,3 +23,13 @@ config VDSO_GETRANDOM
 	select VDSO_DATASTORE
 	help
 	  Selected by architectures that support vDSO getrandom().
+
+config VDSO_UNALIGNED_PACKED
+	bool
+	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
+	help
+	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
+	  for unaligned memory accesses. Enabled by default when the
+	  architecture does not have efficient unaligned accesses, as GCC may
+	  emit stack spills or out-of-line memcpy() calls instead of inlining
+	  byte shifts.
-- 
2.56.0.212.g129ede20d9-goog

