Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADA3D75BE
	for <linux-parisc@vger.kernel.org>; Fri, 18 Sep 2026 03:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700671; cv=none; b=uYMVZUFmL5xttj6CIaESsGvW44RCSRko7bQPO0t4vRyE1wVljcVgt0oBFIh70EcsnpdOjdU2QUHHFzh2DySqJu5E8sTaLTyUVqkXaJUiAyGPrZG70TovZt0ysWJeEAIMzSHCYTvwTh4THEFHZksrIhmwJBZkazKzv2jyfcdKCQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700671; c=relaxed/simple;
	bh=pWXqVyPkZ1SwGp/BgZ2+TVrhDjg3TKwNRtZ+6tAh2AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtnbNxBOAxvmIOoVDRznX0Z71RV9iOjrn9qx6xnj1GIvQmlrnnDaqWzuWpLYhHbmetR+PUbrkwgO7fNKoR+RQSVFEbpR5Z8nSKWm7Rl7ROzDReDoFeD1Dnu7wCHPJe0Cw2BDw3aUiAUJ6LdBx9Nd16OkeMwKXsgO8aMxOziVOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdsowFYn; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdsowFYn"
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2db33361b2fso2295255ad.1
        for <linux-parisc@vger.kernel.org>; Thu, 17 Sep 2026 20:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700666; x=1790305466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NGcJIqHMvpXOCe+nwNp2JIkFFxkvjqUC5Jh84lAv4c=;
        b=BdsowFYn1/NwsP+wTbNLsH1dfcHMPhicaL1IfsE1i4Tc3SMppU2mPYI9wvtHQ9MY1q
         Kfw6jpfWw/iz1EYzY+Rrk+hVWWR2+kBMTt4gRr4f1T3tlwgY3yp9cBbd7V5HJ3qSy67s
         QAcCqvsvgD9n1G/bCB0xLjA4drP+L1GAjmvHbkZhEcYeOZltPJcE5jWFyvw8w3nb+cIG
         VUE7swSd0Yl5tdb7QTEDXBl2YjDNdP3AjcUMcK3kcbMfLgt8RJJaQntIoleqKnYC3O4g
         +F/gUo93DP+V+UeZLF/BMXNoi0CRAjFhw0tiXz7X5QKat4ONT/3jpMxS/udoMDyEfmqV
         /14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700666; x=1790305466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NGcJIqHMvpXOCe+nwNp2JIkFFxkvjqUC5Jh84lAv4c=;
        b=QmlTYTSAdYiLZHh9j6+g4jn8GNwpFeotJQmA1U4M1z9KYK2x20rKswqAL6sdMNkEHq
         oPfsoD0OPz9SgHYGBF4jqhYL7kHCkVR7y37sc8SteQ6/2I9ZhoWr8Uhmg6OOdjOcJvgu
         1yKx2jWFcYACdZDA+21PlA8+ZhrAUWC2rwofqM/jQjp5hhaKRAIdtknhecyVM6og1oVJ
         mMcZYtnt+BWL3Ei0mf0+LQ+5inN1mDUGTWI7DitLzlH9Vjz2mMc+PuUA4kngantGzyKs
         ZqbLoK9WT903rtf7ITU78BhlNEoFSNzMaesgRhBGxn6wiqqISQVgvecl2dPvkmwkvYNj
         DPyA==
X-Gm-Message-State: AFuF++kjMHoiXdkCvGUFwBVmqQM58SQ5/wHZqclczj6oSdd3hHhrlEuC
	f5piufWYydEL9qf/mc6sgjsoZCYFaVQfTDnSC+wjFQYgKsuAHnn2xNoQQi/fcA1IvkE=
X-Gm-Gg: AYBFou2zWHFvyVh5syVXqUKajgtMr/BdYYvK2BKcoWOZfxa6baFTMbmK8RM62rpnj6w
	uvppPR0RT9mo0rJqWRcusJVre6qfWgh9SewbkRcErirAMm6g2g6J/owmTsCtV8Hg9zi2Vm0Owv8
	qEK9MvzLlmTRjJpNALNCQlpqf//EsNBPswSVP+7L3/GoOgb5A3/rmL/bjWau0HfbK+XNLYou7zm
	aLqgEp8k+4lj6Sg6GB7Iz8dQI3X+M6aXAEDCLvs7pUemDIJtalBfoNRBJ4dQD3aJZCE0XkaJTOs
	+Glgn/JVpBh0stmObD6L1YDfSTe4UKf7eJWPFxYLFKGA4UgHTy8QqHgjoP5qVfc3NK05IucCEVs
	uXaSi09r2acY4i8Xx8FJI4rn3wSwrp+gVYMT4ak8/a5UTo3zlyVM5TtT+GcNOLWOwi3nszDYReB
	1Z/LSGkm8fDj7ETwdFVcvG2Kp4uB1qL63UP8/7WC3liAfijN32F5+aOYFZw+6YrDGed0EfVhlV5
	EcJxwAvzijU23t6gKT5gHn48+6nTL1+PgjjbGpi8cNeQVI/GpAwrgr3hFDfYN9/eVYtmLMamSNg
	PTu0zlG2CLJI+SUMonar/nrcvfdqKoLEAwSugChuaS/TTi0+L+0FWckcHgEiMnk/E01nY2x7MDM
	f
X-Received: by 2002:a17:903:2f0f:b0:2dd:88b4:6920 with SMTP id d9443c01a7336-2ddb1b9818dmr23699965ad.22.1789700665970;
        Thu, 17 Sep 2026 20:04:25 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2876a52esm417457eec.20.2026.09.17.20.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:04:25 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-parisc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: remove unused <asm/compat_ucontext.h> header
Date: Thu, 17 Sep 2026 20:04:14 -0700
Message-ID: <20260918030420.408737-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last use of arch/parisc/include/asm/compat_ucontext.h was removed
in commit d313d4e72df3 ("parisc: remove unused compat_rt_sigframe.h
header") but it was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/parisc/include/asm/compat_ucontext.h | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 arch/parisc/include/asm/compat_ucontext.h

diff --git a/arch/parisc/include/asm/compat_ucontext.h b/arch/parisc/include/asm/compat_ucontext.h
deleted file mode 100644
index c606f1bc891d..000000000000
--- a/arch/parisc/include/asm/compat_ucontext.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_PARISC_COMPAT_UCONTEXT_H
-#define _ASM_PARISC_COMPAT_UCONTEXT_H
-
-#include <linux/compat.h>
-
-/* 32-bit ucontext as seen from an 64-bit kernel */
-struct compat_ucontext {
-	compat_uint_t uc_flags;
-	compat_uptr_t uc_link;
-	compat_stack_t uc_stack;	/* struct compat_sigaltstack (12 bytes)*/	
-	/* FIXME: Pad out to get uc_mcontext to start at an 8-byte aligned boundary */
-	compat_uint_t pad[1];
-	struct compat_sigcontext uc_mcontext;
-	compat_sigset_t uc_sigmask;	/* mask last for extensibility */
-};
-
-#endif /* !_ASM_PARISC_COMPAT_UCONTEXT_H */
-- 
2.43.0

