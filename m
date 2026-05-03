Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D161D7E41;
	Sun,  3 May 2026 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777781879; cv=none; b=Sm8DzCl1lNNV1UUmijUYCkGdQFzQrhOsrLhF8udf4d3q9pEnc+Dvcl9GQtmVe/+cI5ktEz/6MGnTKd527eFw2yCAth+p+F3qzuodwtb9z6IqGWpmomhIGWWGqet/NEuEUxzyj2v7XsKmbsRpxCTiL1/KBV7cCEZjvgUe8qZTNBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777781879; c=relaxed/simple;
	bh=3QXpodbMbx8LNd8L6TzbX4ghy/4qbE5E1D7Ke8kfCnw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XlQ5UNpzSwGdZku8jQTHo6me1FWFDyI4thdBx4tvXDmPjLn3DGBfeG5Xnb7wEYtft3ExJyuUx3jaGC029DFsuGEx4eW+eFnKL0z0vGs+WeH0nwMAwkFYzUZDnERLSDu021nYxI0iSy9jDEkYlLOIL+6dQkWKN7bLNIDgkTmfSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0a9f67f446a711f1aa26b74ffac11d73-20260503
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_C_CI
	GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:532d9dd0-2e19-42f5-ad43-bae67eacbe6c,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:-45
X-CID-INFO: VERSION:1.3.12,REQID:532d9dd0-2e19-42f5-ad43-bae67eacbe6c,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-45
X-CID-META: VersionHash:e7bac3a,CLOUDID:c706e71f0eb47ba070e4b3c41d86824c,BulkI
	D:2605031217504TVQWXZ0,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:99|1,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a9f67f446a711f1aa26b74ffac11d73-20260503
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1506772040; Sun, 03 May 2026 12:17:47 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: James.Bottomley@HansenPartnership.com,
	deller@gmx.de
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 3/3] parisc: Fix IRQ leak in LASI driver
Date: Sun,  3 May 2026 12:17:44 +0800
Message-Id: <20260503041744.201647-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When request_irq() succeeds but gsc_common_setup() fails later,
the IRQ is never released. Fix this by adding proper error handling
with goto labels to ensure resources are released in LIFO order.

Detected by Smatch:
  drivers/parisc/lasi.c:216 lasi_init_chip() warn: 'lasi->gsc_irq.irq'
from request_irq() not released on lines: 207.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202604180957.4QdAIxP6-lkp@intel.com/
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
 drivers/parisc/lasi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/lasi.c b/drivers/parisc/lasi.c
index ef6125d83878..a5b80cd5cc37 100644
--- a/drivers/parisc/lasi.c
+++ b/drivers/parisc/lasi.c
@@ -193,8 +193,7 @@ static int __init lasi_init_chip(struct parisc_device *dev)
 
 	ret = request_irq(lasi->gsc_irq.irq, gsc_asic_intr, 0, "lasi", lasi);
 	if (ret < 0) {
-		kfree(lasi);
-		return ret;
+		goto err_free;
 	}
 
 	/* enable IRQ's for devices below LASI */
@@ -203,8 +202,7 @@ static int __init lasi_init_chip(struct parisc_device *dev)
 	/* Done init'ing, register this driver */
 	ret = gsc_common_setup(dev, lasi);
 	if (ret) {
-		kfree(lasi);
-		return ret;
+		goto err_irq;
 	}    
 
 	gsc_fixup_irqs(dev, lasi, lasi_choose_irq);
@@ -214,6 +212,12 @@ static int __init lasi_init_chip(struct parisc_device *dev)
 		SYS_OFF_PRIO_DEFAULT, lasi_power_off, lasi);
 
 	return ret;
+
+err_irq:
+	free_irq(lasi->gsc_irq.irq, lasi);
+err_free:
+	kfree(lasi);
+	return ret;
 }
 
 static struct parisc_device_id lasi_tbl[] __initdata = {
-- 
2.25.1

