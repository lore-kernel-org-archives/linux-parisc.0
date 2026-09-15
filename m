Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D04E3E95A4
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 02:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440373; cv=none; b=cg58ZFTt4AYfBnL8stAVcO8NQDZoZ3kBOjM7nkMXqEsPtW0vWi3+gMAX8rn9FuR9Lpe0PgO8EyRYyVgclOoy2j4WzRiT+Bghm/Lh1XQfK9aICa+SRrCr4UDByI9E3Z2K7ppB+sf5K1A791g/pmmcrPzoe9IF+Hunk3qOfrO/UOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440373; c=relaxed/simple;
	bh=ToJwOPk2WK8z4t0Q/cg/SldPxvCjqaZQsoAtu1CrDoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HX/8lxRpTFjCNbxEmKPf/EHZT1wgdIpdzIyTGdrIACSYMljUtWxiFQ11CbUDNl0C/Tu5pqyVygEk9YS/q2XO+LaKB0gSfIkdAdXtu37mGL7uwRaLnrFLoj2qyNO42zYacorz3Bup6MvnGKpFGmVMpghqgnwHb4JXMUa2hkGMM2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRgxholv; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRgxholv"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-396a51b2605so2012614a91.0
        for <linux-parisc@vger.kernel.org>; Mon, 14 Sep 2026 19:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789440370; x=1790045170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgURIhAvbD9pnXkZkHKGIs3ciuxgkl5nV58X39EDlbY=;
        b=VRgxholvyPXZuxJXVgVZVP775CV8GwuKJX759LAeyfIgkKL7uzFr3Fn0vjkdMbfdG1
         Y/aGGECPzS++K/cvmuvsrLg04Qm7lelQz3DiHpr/6kHVUB0yfG3lfYaz1apQy3Yl9NHI
         XKghiriC89C/EJ5nlhRAK3GD0DF4OcJEJEbMrzTPJIDTFdxhcxd+TNxOcE1i7jTzJKXq
         Pclixyr7v/wcqAa/e08NmovtvPKizjt+QeKPambK4K/r8rcdXhSq/3hytkpVXCE+MStJ
         E8C9OhBm2jGSP6FvLwr78vQ0FFpZzptaaRFe7zk0nI+n2RWEKIrTcMs5JH09a/EMm/cu
         0Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440370; x=1790045170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgURIhAvbD9pnXkZkHKGIs3ciuxgkl5nV58X39EDlbY=;
        b=bsbnjY8yA6eIkttRQ7JKdvoZD8o5iLHomJzy2w3JYutotaeUvh0ei5wLw/TE/SAJaK
         QFRg6Yg0+K7RKqD5jww4K9eXhqt3VcqPzCoi5Zu6NXtb1pHstAJmwq34tRXsOtiqxGOB
         KMtJ2BFwvfFYxueancxY9MrR44q/hyEj1BkbtfqLYonqXeQRBivgh/EuzqftN7jrMQN/
         vTJkEfziDGFc928bNoPhFkCwZ48wYEi4ekYAa9G4ZCYPhFsyjPZH4svELu/CAD12m3X2
         EEAYO+MA+LyyaPaeMWSIvPoQu04SYVYLVHtCF3823dM6Mxo7YlWXobZuvjaOxeNGUHY1
         QbcA==
X-Forwarded-Encrypted: i=1; AKwUvBx+zn9cYpePSRdl2THY4+0XD0XDXRCaxk2rkkmTd73Z06VDgSby+tyFi8kOoRJV7+aqtO2CDMU38MPDiLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mGe01PWlegy2MTIAuJcOHvFs9i23L6cSlHXO8/LExJP4qlHCfW
	RYGHYGvz2bcoG+2Yssqxp0FWBqjINgspn9oHj12v/S0c+0tfFtJgS1Xj
X-Gm-Gg: AYBFou1lgEEkVr4a18yykVvuVcWlUnNDAc5gJ4zRhnC0Jbmcs90gujNxeC1H8hQ1H9g
	3+boIQHqyUwNIuaFbv4l5eu+UIB9LikvYQ1za+79VJ9uicKRVc6FwlBMfNMi1me715pkVeRludF
	I5QoDj2XYFAjK67x1aHSsIkhJ8lohvCC7AfIZyn2lSoK3c6fn5mwAImayFlgX4A/t46AZrBhT7B
	pulZ6GKJefesVvF0cOWBG9jgUxe739OQub50X956OMkPmI4KmGeqN+Z+FWtqsYRaHXdSdwn8+64
	xQR/D24hJfJPqfdYOU5EzCwCUy2VIPO250Cx+FxYxVZCaBpfII3dOmu2ADBPvEQoggE6lM5v8dY
	FucSujOcsKZ6t9NnagQ1eZlwkGnrFfRCfDtPdGWE3r5S1lrBJ61r0G98nwDCuAFhvPOHHw08fBt
	MqOBKAkwyXrnManQsbJBKbZ9HYA9W5pbp5HVq4eYAsRwc127ycjP8rQ64qPEzxra2ArMc+tj8JC
	MQhTrjVp5H3BUyvzgGtqBFX46uajNOCU2g+/VsMFaObcK4XY9BhubhTnRqeF2Lyr2TG+Q4WdaTD
	7QcpPRrRAkMfeG2IwKJ82zPZRCl7k5/pH7G21ipdtmnCazhBcbXmrkzU0W9LlhBgxMo=
X-Received: by 2002:a17:90b:35d1:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-39df1894982mr8808021a91.4.1789440369772;
        Mon, 14 Sep 2026 19:46:09 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm26779949c88.8.2026.09.14.19.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:46:09 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Petr Machata <petrm@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org,
	linux-parisc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michael Grzeschik <mgr@kernel.org>
Subject: [PATCH] net: tulip: winbond-840: remove never-true 486 CPU check
Date: Mon, 14 Sep 2026 19:45:47 -0700
Message-ID: <20260915024551.196126-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The winbond-840 driver contains a check for boot_cpu_data.x86 <= 4.
This field encodes the x86 generation (3 = 386, 4 = 486, etc).
Therefore, since 486 support was removed from the kernel in commit
8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"), the
condition is always true. Remove the check.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/ethernet/dec/tulip/winbond-840.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index a5581f1d0141..c42eaf0eef64 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -876,24 +876,14 @@ static void init_registers(struct net_device *dev)
 	i |= 0x02;		/* give Rx priority */
 
 	/* Configure the PCI bus bursts and FIFO thresholds.
-	   486: Set 8 longword cache alignment, 8 longword burst.
-	   586: Set 16 longword cache alignment, no burst limit.
+	   Set 16 longword cache alignment, no burst limit.
 	   Cache alignment bits 15:14	     Burst length 13:8
 		0000	<not allowed> 		0000 align to cache	0800 8 longwords
 		4000	8  longwords		0100 1 longword		1000 16 longwords
 		8000	16 longwords		0200 2 longwords	2000 32 longwords
 		C000	32  longwords		0400 4 longwords */
 
-#if defined (__i386__) && !defined(MODULE) && !defined(CONFIG_UML)
-	/* When not a module we can work around broken '486 PCI boards. */
-	if (boot_cpu_data.x86 <= 4) {
-		i |= 0x4800;
-		dev_info(&dev->dev,
-			 "This is a 386/486 PCI system, setting cache alignment to 8 longwords\n");
-	} else {
-		i |= 0xE000;
-	}
-#elif defined(__powerpc__) || defined(__i386__) || defined(__alpha__) || defined(__ia64__) || defined(__x86_64__)
+#if defined(__powerpc__) || defined(__i386__) || defined(__alpha__) || defined(__ia64__) || defined(__x86_64__)
 	i |= 0xE000;
 #elif defined(CONFIG_SPARC) || defined (CONFIG_PARISC) || defined(CONFIG_ARM)
 	i |= 0x4800;
-- 
2.43.0

