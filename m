Received: from out-163.mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EFC45BD78
	for <linux-parisc@vger.kernel.org>; Tue,  4 Aug 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849724; cv=none; b=RzxOiMn2gXkDlAU76bxkzqJ/a65ucHvoMeq844v+QmO7dj0oZGSf4GPBZ1uOX06/66jsZFmhxE5JYxMYXwedxXEXYnC7HvCDmm8/J33yzPp6h11f36RVTFiknozEg2LkTzn4AIrcV4JR+JucWu+RbXjot93tFVoFlcUGtUUM+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849724; c=relaxed/simple;
	bh=xH/1tJwbCkVXOkey/+IBASsUkZOJDoXPXE6dfiYWF18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgLcVqY7iLz3W5wj21ZylwTP8orAko4bsYTaQ/ZfBz0zfxEeyUOfpzXa8vfT+QrW4RAPC5oIvviU22HmKXEgEqaikMnaPftZRuf8N3WE3DRdsUqhb/f19l3DiqGBBGQ/yCnf50B/Pvm4XOQQMa/01E/JCwaxO1QR36v7cT4zPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B5Mb+S72; arc=none smtp.client-ip=95.215.58.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B5Mb+S72"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785849721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0kQVm7/Prxo9iDkBs1Ky6xlC4pBcPrS0aSXkf8IhrU=;
	b=B5Mb+S72Rldn60ieoS10FVC1jQzeLTlxJg7GwnVp0spr5yYN28OFB091Q5floAVU3XDDzS
	RKXLU7hlIDcJ9quYL8cIQOzcBnn+GaeljMtzJ7fD9O7xRIXqdLdzGzK/g5vw7IsMQjyTdA
	DnamfMwu7a6pdMbKvisGHd+S/DuZCE0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] parisc/serial: Add include guard to asm/serial.h
Date: Tue,  4 Aug 2026 15:20:52 +0200
Message-ID: <20260804132051.104647-5-thorsten.blum@linux.dev>
In-Reply-To: <20260804132051.104647-4-thorsten.blum@linux.dev>
References: <20260804132051.104647-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=637; i=thorsten.blum@linux.dev; h=from:subject; bh=xH/1tJwbCkVXOkey/+IBASsUkZOJDoXPXE6dfiYWF18=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmFz10npt3Lf/piK3eYylZug445hb8+9h9rcT12Tdi0a ZudUpBJRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEwkxZ+R4WHu2X6Hz/M+mDWq vp1kLO2Xn3ikYsVhruLftyMaX3W+nM3w36v0qLlSiuwr/s1ZqUob/rPu5bx7+arPumjp6KANC9n XMQMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add an include guard and remove the stale filename comment while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/parisc/include/asm/serial.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/serial.h b/arch/parisc/include/asm/serial.h
index d9fd3f78d31f..4f0df8e10a4f 100644
--- a/arch/parisc/include/asm/serial.h
+++ b/arch/parisc/include/asm/serial.h
@@ -1,5 +1,6 @@
-/*
- * include/asm-parisc/serial.h
- */
+#ifndef _ASM_PARISC_SERIAL_H
+#define _ASM_PARISC_SERIAL_H
 
 #include <asm-generic/serial.h>
+
+#endif /* _ASM_PARISC_SERIAL_H */
