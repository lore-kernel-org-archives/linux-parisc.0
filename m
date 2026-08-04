Received: from out-166.mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EC4582DD
	for <linux-parisc@vger.kernel.org>; Tue,  4 Aug 2026 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849723; cv=none; b=L6B1blQvc/fbGIWTaE7UCHGKAguKDxrdwjMcRiFxnGgXhX8N36Vcw/872ng+AnxhrBe3Fqsaalt4KuwbyrdXT6del6NuIPGMTGG1wdZJMQvYvzOM5d/RetHBDibjjLzmySdnAKKwri61+ees3vt9umDp0V6UYLrdinViZDHpHis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849723; c=relaxed/simple;
	bh=yeurnaI/p3QmIc4i8/0mp3OF8fWrgJjXt9yPlzkpGGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCt6dBsOcOLqmwr6xn04ruyAKNufANJj+tOEVLhKKd1G2tkrmw/G2mh1LQ9mc5utg5b4TgLec0ws7NSaARuYUmWDc4lPK9f7GJ9KEqYnCea0fF95PiWRyiU2MI6AiSLg66ZK49g3L3wff66vR+rX3KXvMrJEt5V5SmumvgtsFFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BRXp83D6; arc=none smtp.client-ip=95.215.58.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BRXp83D6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785849718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4b3KuHb5y81O2En0k38nq57/SEIbXgpgKEPbHCq/IQ4=;
	b=BRXp83D61KHiACav+TfezHN/R7hPw5eWcWHB/Ww/AqT7UUk9ShgZ2HkBQjeI5gRHGPG7bK
	FmuUqclf7icJk+3V91Dz5n2NLxTb9ySo2+UG1b95CcY3EajJAptdTYDpxGz1mp+29XbY3L
	UsQT9KhueAaiqT5G+DeCIh3ZFVArJNE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] parisc/serial: Use generic BASE_BAUD in asm/serial.h
Date: Tue,  4 Aug 2026 15:20:51 +0200
Message-ID: <20260804132051.104647-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=646; i=thorsten.blum@linux.dev; h=from:subject; bh=yeurnaI/p3QmIc4i8/0mp3OF8fWrgJjXt9yPlzkpGGQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmFz43dWwManyhqrJuayz395r0jVj7nxN7YvIlSbHq07 oOYooJLRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExE8RXD/0iHFZ4vGGsP/VnI o/vkktg8+ct/N2RVMmfeWejVNKdRs57hf3XI/XrmBjGF3AqR74XH+GbF6kfEf7+jck/13um4DyW 2vAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Include asm-generic/serial.h and use the generic BASE_BAUD definition
instead of redefining it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/parisc/include/asm/serial.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/parisc/include/asm/serial.h b/arch/parisc/include/asm/serial.h
index 77e9b67c87ee..d9fd3f78d31f 100644
--- a/arch/parisc/include/asm/serial.h
+++ b/arch/parisc/include/asm/serial.h
@@ -2,7 +2,4 @@
  * include/asm-parisc/serial.h
  */
 
-/*
- * This is used for 16550-compatible UARTs
- */
-#define BASE_BAUD ( 1843200 / 16 )
+#include <asm-generic/serial.h>
