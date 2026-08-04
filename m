Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E145D5D6
	for <linux-parisc@vger.kernel.org>; Tue,  4 Aug 2026 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849727; cv=none; b=TOZM/zJ+zhjnITDgs1X9Z7MZvHL2cWTAywLMbTok46pEvVw+O0quDLq3MK8P/5gUftOpz7G04xgYpriZzYrka/yvMC1bvf7pBVXa1eV11O2DevPBcVP/+8N9826BHbwvjoYgW0bRKgrEk4JQI1LTkqA40UvZ5o3wosRZL7fTSjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849727; c=relaxed/simple;
	bh=XVyXr58LfHUODBvZ1Rpg/nab5PhM+WE/uDdEi4ZVBVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTKn87ShrQoblxKJeBoC/lChBdeKPWL7x+X557Iz69RJdbS/vXKvNsWW+gupG90ePihe1baEbg7Zz+ybGl0IGgasbEoAD0ymxty5yJPaeidecMoP1+Hr6x0iT/yTybkyyfCSDSy8PwjRAPNVmqMlycIiobsXQxkZOBrFBhTmzd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HFtSeB0F; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HFtSeB0F"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785849723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7LjBbtKq37UcF8aiTNDUZJDtSifpJkLlMwBxZ5F4dcg=;
	b=HFtSeB0FctDEK9dv4SdNiOHYgri7V/Fxn4jTDB6QXoyj5WI7Um3ThEWAGjW4MNFu99eQWE
	AL7C7kHBTHKkmLyxoqUb9lkqtyHFAEk0+/qGupFHU4DmGH8N59ngMKi0MPWIp+twyjX+Fm
	1z/Wy6cl//iH2Tj/lA/kUgW2aQBX/sg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] parisc/serial: Add SPDX license identifier to asm/serial.h
Date: Tue,  4 Aug 2026 15:20:53 +0200
Message-ID: <20260804132051.104647-6-thorsten.blum@linux.dev>
In-Reply-To: <20260804132051.104647-4-thorsten.blum@linux.dev>
References: <20260804132051.104647-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=499; i=thorsten.blum@linux.dev; h=from:subject; bh=XVyXr58LfHUODBvZ1Rpg/nab5PhM+WE/uDdEi4ZVBVc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmFz93MLANLGR8+O/nGo2h5/rIPvR9sni/79inx99nk1 kefJ8+T6ChlYRDjYpAVU2R5MOvHDN/SmspNJhE7YeawMoEMYeDiFICJpB9n+M2yPffIDdMbeXJu b/UrE8Lmeh0Xvh48ce6M/OoIKYcZm6IZ/hkLTvvUr6P95myz+I7zV2erfbha3nG49kVXzaaZxxP WPWcBAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the SPDX license identifier.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/parisc/include/asm/serial.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/parisc/include/asm/serial.h b/arch/parisc/include/asm/serial.h
index 4f0df8e10a4f..122430db8cad 100644
--- a/arch/parisc/include/asm/serial.h
+++ b/arch/parisc/include/asm/serial.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _ASM_PARISC_SERIAL_H
 #define _ASM_PARISC_SERIAL_H
 
