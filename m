Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F536C580;
	Sat, 21 Mar 2026 10:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090789; cv=none; b=m5tHP+sEh1HWn9o0IiTlwdSCO0neUxRKWH6ZyW1Vf6U9zctdlF+xIQvkv/EUdzEzsH7xSAy3WXgsjLa3ns5j8m5sp6tzg7Ujn2I+XPAFJ4gNdw7xyMvCvDs4Byt+ASGP2nko7z402G6ulumB1rNPqAgOc8KWue5c7KVfnlvatp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090789; c=relaxed/simple;
	bh=3UgqNQ42lR5cq0uC55hMUlkeoMqzP9dj6FDzBJrr9Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f3/Ngul7zTyLJXyw+yhVTqccGULL/yvkV2ktttsReUBX4Q+IkxibEkm2A0uOtgk1Ofn32+EqKyWCwNillFOpQO6DSD3Dmg/U6JzOuxS+FMQxUGeP7HXIv8Qnzilzl5ZWnDYX8Y2GCvymVgDf5Aqsz8uU0CFwRs5ljyGt2DUBc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=Y9eKCTTJ; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="Y9eKCTTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090715;
	bh=bflqnp4x2z6IX52KdLDsCHau4gR8g7bcTPnoMNKyqtM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Y9eKCTTJigyLG0lKiUioLwbgJDY+KfeyVD5pceeAomG7cxoATPM2iyq/fnxa6c/1H
	 hCv5Ja3Y9LIXd1JWbWWYFQmd75JhTFyQ4oyrqKlODnaTCSvto3qQcYeJIM6FTauwW6
	 UCJzDzCvZGYKN3e5lB3skqownce0PYqKXNIGTvS8=
X-QQ-mid: esmtpgz11t1774090713t62fc5879
X-QQ-Originating-IP: Iqo1rUFTUZDXDtMl1PsfIsVE7IIJZzmK0ii5+p0dBiU=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 18:58:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7075167151808501822
EX-QQ-RecipientCnt: 9
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] parisc: update outdated comments for renamed ccio_alloc_consistent()
Date: Sat, 21 Mar 2026 18:58:31 +0800
Message-Id: <20260321105831.7293-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NhQ9hXNievYajX+4QCgC5AXOOYqc6w+lSk8izD63EFGLaL2ZBkb7Yzke
	t89ESciaFZBlcbAynsCurRxf0+kb9KPHBFC8Kq4AGCRzw/Jnw9PR9VzRLoGbFA0nWFb4f+I
	/IQyaXPVNpfYP1IU728JH47Ef4mbKOweCg4/eWQ59KwXih/zjX4BMK7zUutQE2jSCUlGXkx
	Z/cAZB0njk0ljT5YCtUGFuL/C+uBHUtnLhPBjggbOGexAF4rtJKaT9AsTjfR5Lw2TbSt6A8
	mo1XlrY1Whx0JCJWqqTB1Hn9BzpjVM6Aa14nYvg8BWUsqIwy8XUnP3Z1SQz06YRohA83gkH
	IajCTpznC4eY5KvJ53OU3iMWapUbSwt0FourZC/sdysHWo5bkZVeu7Q3z1Aefh44Dp1Ky0h
	x7XErZLxdaEe9+z9d0mMh17kgDSR5iF/5+RbvvrtOUKCGHrmrzyq00rSbakDvYAqlJjfXYr
	Uf1pHpsO6FnEHNl6BTN5r/bZwiCx8ocd4p2xG3fHdLtEK263krfaufXb0kD6IHguMZXZbD3
	5vMnrzUBqZvKTA53Xwm7J258lR5jf9QSnc1L14re4nBhDlHZ05qn8K3b8AvVT/QnJlQnU4+
	XgZBDzjgniL8Q5Jml2YMqHMJPCfFYjoutYb3RQCDd0VErEPKgI1zVRNqSBJm7IoQso59HqQ
	1qftdmksYI0XFiOVlw2KbGv8d4URJ1VMLWXuinyJX6DaxkbOgu7z6dUjMPmQPg8TzpvM5n7
	fsewQi6Y5wMG/xtzztZUo0aW+SdYwYzB/xkFnp2yoU4kRFclaPAF7I6j/QPr1cUeWmtWzXJ
	ZcAUj6K9GFePamGTGcaRw+Kg/vtu3LJ1fslhClOuLUVZbNH2y7KpEzC3zX6p62FodNEAHZd
	tPpIXRK/pgT9RsupIIyGy18+LNSxk4capjedSRysGuyS1W5+AUCEySfiV+aUsr/DlYjmdrb
	cqDfJQyuxMnrHKdEp63P2Rc0tgTMx5V8clkqRs6KEop5RroiG8lLr/DPJQi+wMqZVWSuWcm
	4kTxosZ97v7tZ+KRHfTA1kZtBGGOo97aofCZMof/jchJP+umePmT4/xzeKl3ECw3Emfnss1
	f5X0ADv3t7HbWFG8VHmmjiqz6TOpKDlRw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

The function ccio_alloc_consistent() was renamed to
ccio_alloc() by commit 79387179e2e4 ("parisc: convert to
dma_map_ops").  Update the three stale references in
ccio-dma.c.

Also replace the obsolete PCI_DMA_TODEVICE constant name
with DMA_TO_DEVICE in a nearby comment to match the code.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/parisc/ccio-dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index d5b95e63c24e..dc1b6d11f9ab 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -503,8 +503,8 @@ typedef unsigned long space_t;
 
 
 /*
-** Use direction (ie PCI_DMA_TODEVICE) to pick hint.
-** ccio_alloc_consistent() depends on this to get SAFE_DMA
+** Use direction (ie DMA_TO_DEVICE) to pick hint.
+** ccio_alloc() depends on this to get SAFE_DMA
 ** when it passes in BIDIRECTIONAL flag.
 */
 static u32 hint_lookup[] = {
@@ -865,8 +865,8 @@ ccio_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle, gfp_t flag,
  * ccio_free - Free a consistent DMA mapping.
  * @dev: The PCI device.
  * @size: The length of the DMA region.
- * @cpu_addr: The cpu address returned from the ccio_alloc_consistent.
- * @dma_handle: The device address returned from the ccio_alloc_consistent.
+ * @cpu_addr: The cpu address returned from ccio_alloc().
+ * @dma_handle: The device address returned from ccio_alloc().
  * @attrs: attributes
  *
  * This function implements the pci_free_consistent function.
-- 
2.25.1

