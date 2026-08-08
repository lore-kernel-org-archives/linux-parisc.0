Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD3C417369
	for <linux-parisc@vger.kernel.org>; Sat,  8 Aug 2026 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194349; cv=none; b=iuXZK3Fywj5GyOSx2S6WYQHNzPoLxyZHH0Q3UOo8vfQtyAr7nUG6pufGxRdwOqkiCSVJLHcaeletyV3Axlkgj4iuxVHfdVM66gry9/uW7Ipgxg6FkbUfbP3ESXDum4/y1jtUzgiYq54JudhxntWf2QA5n7F9/NUnDnPZE8JUIuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194349; c=relaxed/simple;
	bh=6hO7JwKQfAlQAwTje4D/+FhpFSen1xgFTdWYG1w9c3k=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=dAB3xliMa0SxaCJJRn9r8FAficQeF8k2TqrZVLm9p860PxDBOom/xN+BhWxf/LxYDNZVmQbNKfFsNelHQdu+EPHZvRR1OpodrnOzbIjHEGQ+bnZYO7TB/7IYjAbfXVZ1U4eIue3M+x58zCVQxHJT06C4jCgJDz+rL9kQSJZImtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com; spf=pass smtp.mailfrom=tutamail.com; dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b=B6DwZbtY; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tutamail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tutamail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tutamail.com header.i=@tutamail.com header.b="B6DwZbtY"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 4921E16BAA363
	for <linux-parisc@vger.kernel.org>; Sat,  8 Aug 2026 15:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786194345;
	s=s1; d=tutamail.com;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=6hO7JwKQfAlQAwTje4D/+FhpFSen1xgFTdWYG1w9c3k=;
	b=B6DwZbtYna2piIIvwORkJJNsU+3BEWU34HUea7AOtCf+GhyjtpXZ8Tu/yAA63P8U
	eYS1/5D7TvRMrN/dBHEZPwERR9PDRbSdV8Obn9nX0EP4O8f/3yxoNDwaZ4/aqO55tv0
	ggmpyP0mQWvzJh54aLt3Oxr/3IWIygpvcfU19ggA7BnzA9ZOMkDE0r4eloP1sDAWIPp
	ZZyM8/1j99pWIvMAQJwGHOZsqjO+XKVCJzAhwhwa0CRucPdQrG9q37Jk0vwYcHqBCCf
	RLjAVbqv2ZphELVlFRMkLSy9DbuAWEUVCXWvxK06QPU5w9NeDwS9P3ZIuua3RRjWq9N
	S20Mtxv4Pw==
Date: Sat, 8 Aug 2026 15:05:45 +0200 (CEST)
From: jeandelu@tutamail.com
To: Linux Kernel <linux-kernel@vger.kernel.org>
Cc: Linux Parisc <linux-parisc@vger.kernel.org>, Deller <deller@gmx.de>,
	James Bottomley <james.bottomley@hansenpartnership.com>
Message-ID: <OzWTc1E--F-9@tutamail.com>
Subject: [PATCH] parisc: eisa_eeprom: Add missing MODULE_DESCRIPTION()
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01bfe2e9a259758e078407f094ebc3bbb2e1513fb186042e213a2c6176434551ca0ee11b0bb29c681ff93aaf63d3663834addf1018acef21144d33c246b274d759:TurnOnPrivacy!:tutamail


From 3b7e5273ab695749b1851f1d3f3f2bebcfa5814c Mon Sep 17 00:00:00 2001
From: jean delu <jeandelu@tutamail.com>
Date: Sat, 8 Aug 2026 13:56:32 +0200
Subject: [PATCH] parisc: eisa_eeprom: Add missing MODULE_DESCRIPTION()

drivers/parisc/eisa_eeprom.c is a standalone module (it has
MODULE_LICENSE() and module_init()) but is missing the
MODULE_DESCRIPTION() macro, so modpost emits a warning about it.
Add the missing description.

Signed-off-by: jean delu <jeandelu@tutamail.com>
---
drivers/parisc/eisa_eeprom.c | 1 +
1 file changed, 1 insertion(+)

diff --git a/drivers/parisc/eisa_eeprom.c b/drivers/parisc/eisa_eeprom.c
index 601cbb225..adc3c7e82 100644
--- a/drivers/parisc/eisa_eeprom.c
+++ b/drivers/parisc/eisa_eeprom.c
@@ -94,6 +94,7 @@ static int __init eisa_eeprom_init(void)
return 0;
}
=C2=A0
+MODULE_DESCRIPTION("EISA eeprom misc driver");
MODULE_LICENSE("GPL");
=C2=A0
module_init(eisa_eeprom_init);
--=C2=A0
2.47.3
