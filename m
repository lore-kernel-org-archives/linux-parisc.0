Received: from mail.cock.li (mail.cock.li [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A693644A6;
	Sun,  9 Aug 2026 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786268261; cv=none; b=PD3fthPcf8mfSsylbOLCumBc7ZJ0h9PMoZkpUKrl6lzKDuzSvVWJrzCmnIB1ezURZKHQLD4p7mKJcFENk+J/emhabGATHfpaoMKtPzG14U92dP8LTaREUVJ+a7CtoCNldFapAosKTy2mub1g0y2Ch3+EyGKi00jeyf5SefPtBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786268261; c=relaxed/simple;
	bh=agLoFfEn7v1tbZMOAv3qk3sCl2sQ+2DhKBaYvV1ZLlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQh1NM6pAQxrgwP4vbrrbHsGPkCazH/cD/USdGPvGw5QjRayX9Uc25wIsCGZWsU6eu4yVn/ASDGfnB88EIH0auOZRsy6Kld0vUz9sBqReQow4I5YR83Un7JHcNS1YLTmdyc7JTJnTgxfTdZPxRYPnR7DsoVDh4R56YaPlBtEgrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=tAyHci/h; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="tAyHci/h"
From: jean delu <jeandelu@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1786196339; bh=agLoFfEn7v1tbZMOAv3qk3sCl2sQ+2DhKBaYvV1ZLlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tAyHci/hKpr09aoXCY5CUM+c9X/iqMFWxJk6vK1K6wjvSXUzBCsKpncJTaidkn2Nj
	 WEbGULnFJjYviwxGeLaQUUD6qWFF4dO/Tfx5rwP1SSsebUlvLJMAWzsMpdDbxDEC8H
	 nX6Ret/2Y+MABCJVHZhMBuuBmKNJhdEGNz2oriQKQNZfrAFb4ZAmmYDjnmRMJzlbox
	 sTuKxSc+d4YhKbQzROOg3rU7VU97n6AyDqqS2QfwYeCZ1iR1kF4MxiIuDYSKWFJEUf
	 7jV/A7Am9jVIJBdYDxAjCqVaeJAHaq4vnAoV3ajGot1oAhZp5/dsADrbdhjYIQG2Xj
	 3YkyO4tVBKcmw==
To: linux-parisc@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	jean delu <jeandelu@cock.li>
Subject: [PATCH v2] parisc: eisa_eeprom: Add missing MODULE_DESCRIPTION()
Date: Sat,  8 Aug 2026 15:38:13 +0200
Message-ID: <20260808133813.19909-1-jeandelu@cock.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <OzWTc1E--F-9@tutamail.com>
References: <OzWTc1E--F-9@tutamail.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/parisc/eisa_eeprom.c is a standalone module (it has
MODULE_LICENSE() and module_init()) but is missing the
MODULE_DESCRIPTION() macro, so modpost emits a warning about it.
Add the missing description.

Signed-off-by: jean delu <jeandelu@cock.li>
---
Sorry about my first submission: my mail client mangled the patch and
it could not be applied. I am resending it via git send-email as plain
text, this time intact. Thanks for your patience.

 drivers/parisc/eisa_eeprom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/parisc/eisa_eeprom.c b/drivers/parisc/eisa_eeprom.c
index 601cbb225..adc3c7e82 100644
--- a/drivers/parisc/eisa_eeprom.c
+++ b/drivers/parisc/eisa_eeprom.c
@@ -94,6 +94,7 @@ static int __init eisa_eeprom_init(void)
 	return 0;
 }
 
+MODULE_DESCRIPTION("EISA eeprom misc driver");
 MODULE_LICENSE("GPL");
 
 module_init(eisa_eeprom_init);
-- 
2.47.3

