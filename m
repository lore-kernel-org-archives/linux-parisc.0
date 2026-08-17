Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E2B306744;
	Mon, 17 Aug 2026 03:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786937377; cv=none; b=bt9ui02eYMzaK3s1OsKqVszWz8OdIm1j5dGXfYRyr61j30PsN8YuN5kSEAnz6ReUWnfRUm/YI6ASIgbGNkMtbzvNznv7sPoX3tU5Cb0VtpC5dwkBv2mfDpi0YpXyB3ELVlE/+7+YUaW83AOZKIsf5z92h2VMfaxzWpb3zhfPwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786937377; c=relaxed/simple;
	bh=ykgBHbnFw38xzHSbln7LhsvmIVRtGN3381BIqfJvcSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mTiIATb9N6WkVrWPmpxBX4BdsCWRuRjokpN1Z6ktGNhc5tDZU6dnz1/QvS1WJMfqib6Q1fRvuHave5DrpJxMQY4mqu3Oc/8AhYwK3pEcPnh7LeVmprkoFSM46sr9PysssNNHagalsQS1FPy2iq3pL7AZ/p68SZ+xNMDcHRb7djo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: da3917b699eb11f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7940290c-aeef-4d0e-a285-14358fcd1700,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:8899bfdbf8af6816e71699ceccef134f,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: da3917b699eb11f19a56ed5b684f684d-20260817
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1790030932; Mon, 17 Aug 2026 11:29:28 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] parisc: eisa: Fix infinite loop when parsing invalid IRQ value
Date: Mon, 17 Aug 2026 11:29:25 +0800
Message-Id: <53b759a86aafd200d7477675a77a0fae9dbf188f.1786937310.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an invalid value is passed via the "eisa_irq_edge=" kernel
command line parameter (e.g. "eisa_irq_edge=16,5"), eisa_irq_setup()
prints an error message and continues without advancing the current
position.  As a result the same invalid value is parsed again and
again, causing an infinite loop while the kernel boots.

Advance to the next comma-separated entry, or stop parsing when there
is no next entry, before continuing so that the remaining entries are
processed normally.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/parisc/eisa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/parisc/eisa.c b/drivers/parisc/eisa.c
index 9eab974e6baf..b5b5413bfd1e 100644
--- a/drivers/parisc/eisa.c
+++ b/drivers/parisc/eisa.c
@@ -442,6 +442,11 @@ static int __init eisa_irq_setup(char *str)
 		val = (int) simple_strtoul(cur, &pe, 0);
 		if (val > 15 || val < 0) {
 			printk(KERN_ERR "eisa: EISA irq value are 0-15\n");
+			cur = strchr(cur, ',');
+			if (cur)
+				cur++;
+			else
+				break;
 			continue;
 		}
 		if (val == 2) {
-- 
2.25.1

