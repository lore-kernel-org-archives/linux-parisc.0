Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D01FB1
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 02:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437851; cv=none; b=ehqiMjRcWSdZ8vcvXQrz+zVqnVIFjyjXlH8BIjn7IZWRcro+6hm1/qfgAatbzos/Bg0nBDdu3e8Y3G5Qpi2h2NfhRiKTdBm85zVTxMfy5Ew8J1uq9RsLZ4vwhexUlbhD69F5ss8ewwO6JNu5GQuVF4G5zSdhgiyLxZG0vTtTKA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437851; c=relaxed/simple;
	bh=Fcw039KrkxGKVWLTft+Guz2bGKn9Me6A8sWpvgD3JoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGuvYfkzNkd/Wb7wl7oWnZkSgAh6H6PP89SYIbKgONwZ3qzDi+lsMVO5Y1MtK8JrK8bn8n16rzlB/EQZGHK06hEL4+ZlRHIwLLSNkvhQQMjXBRZBmN8uEMAOEeDtpvoyxnZWJ2LhsoEhiJCKgzDLF/R9YfWXEpYmSB8ju46IenY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QT5MTxOI; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QT5MTxOI"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cadeb7so350222385a.0
        for <linux-parisc@vger.kernel.org>; Mon, 14 Sep 2026 19:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437849; x=1790042649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ijUVaQx/mDvllGL84fcjqcGETQyV2GszfE4nAG9CvaQ=;
        b=QT5MTxOI/0V9WGnioYleM5j0UrL60aFdxLEv5b51kICkP92jhF93uB2OpfeUlgEEg/
         Gs1Se+XdT/72VrsPazWYiGlvFNdfHhvDOp2C8BP5UEwLH4eM5CClavEU3IcMorUioYd6
         LJeGRQI20JpLJhXvJfveXgGgZ+i8sF9m4KragDY/yppHCMTeBazjaAj6C+DJj1u9olNX
         mdttq/FGTnm8FtjogA8uDQ9EJuwoOWosuz7PjwEJJhvkz2twVeCvQziQ3kNL3iNIM+6h
         cTuDcohqrLuPzyqT3iSxV3ag/o3lgnuhTexmdxajOcDP8mq9vgLB086caLHHernaV9Kb
         dnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437849; x=1790042649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ijUVaQx/mDvllGL84fcjqcGETQyV2GszfE4nAG9CvaQ=;
        b=FITna1cmsi8aRHZwEZ2t5Iwzfy8P+DDAhdXBkfD5ov/UwSD62otUF3o/rUr/eEV73n
         22CEBw4qbgbgwXpmI9rkAv2lLTaZV8zZcdjGoDdpD6l1zaZTHqI3C78mfSL+GTw1XDwo
         cNgA2bDsDcLSpiQdAAbtNAe+XvfbPfUXlU/cZ99Rb2XRSVtx6+w5L2ls7B5Jn7GgMNHd
         wIQsyRtNQ9uZz0QWniqCRJxrr23k4RAflilhZX3O7l15I01evrDk963gh8lTJQGcqI8i
         xtbjEOkz7iy7NOmzkYYfoG105aUpcsbiOCa4bvautLD7T0g/8eAm4KWBiVOlWHb10eyG
         asTw==
X-Forwarded-Encrypted: i=1; AKwUvBz7MDGoJ6jAGQcl/LnWyuhHlIZFl9x0fWmQTcQsIxUcllH6e4E3Z/KJzckkEDujKLxI8OxiFa2c+Ex0IJM=@vger.kernel.org
X-Gm-Message-State: AFuF++m12EyYIGIisGEBoKLpX8dzFoam5FIRmgg5ChTtbjlW5iKh6y2k
	87n0yvKNEMnvT69atkGNWEQqruzZrxzSZB9jX9P3ujwwZvYozNqOoS0=
X-Gm-Gg: AYBFou187FYvp6JTAllI3VB8CUyKbv3d6TsevvWXGztfz0hT2s1Sdumo1/yASqHBH5O
	CP6GMKhLIPyJfq83RJo7KMR+n7lQOJg+JGbNI9VxwW6K0TQ60mEysax090Jf7SApFk+06MivoU0
	TcyTA9Mr62B3WwJx2Ldz+ws08zIT8CtUsuVsOl2HWlUTt11OcT1WSil25C4KtM5KYaqF5BpQon6
	Z0hrYRbIne2a2SQtLzp4woWumJ/TrGhx0C5rKcRdKanDJmWfsaURzONQGOpumUS0ghfAoqLBJ34
	M7iOAPoZMiJAzCfZXsiSdjoVser/W30FZNCDO8V7Ot0s+1+7i2RGW/5/0zHxKXfZKIP4cxPAXe4
	vnHTFBzbDV4VlbGQd2FgeFpPAxFAdUk3V1C6Lqa9i3yTGqIY1mSGsJom02sLyGrmZM3h9g2brP2
	orfDJrk61yz6vkvP2QHwKSldkA9Vhd95/Lc9iWd4ioTXv/T+NABeWvyYLN4y3sdHgwasndn+1C7
	mikUncbrHsLW6wg/v0nhMbOHfCIuZDUh/Cj3urpvqzzTQweNVz7b6kabieryB09hp3XBxrmYf61
	uxgg4zC/78XGBAVVO9RlmYFX5sTxBgT4ysp26MBLJrq7d0zcObfGQYd5jIYLtQlwTuw/Dg==
X-Received: by 2002:a05:620a:4888:b0:939:d762:e2d8 with SMTP id af79cd13be357-93a299943efmr847619485a.31.1789437848647;
        Mon, 14 Sep 2026 19:04:08 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f18628sm1138775685a.13.2026.09.14.19.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:04:06 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net] net: tulip: dmfe: Disable PCI device on removal
Date: Mon, 14 Sep 2026 22:03:59 -0400
Message-ID: <20260915020359.89842-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dmfe_init_one() enables the PCI device and balances that reference on
probe failures, but dmfe_remove_one() leaves the device enabled.
Disable it after unregistering the network device and releasing the
driver's mappings, DMA buffers and PCI regions.

This issue is already present in the initial Git import; its pre-Git
introduction is unknown.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/ethernet/dec/tulip/dmfe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index dabc091..dcf6848 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -528,6 +528,7 @@ static void dmfe_remove_one(struct pci_dev *pdev)
 				  TX_BUF_ALLOC * TX_DESC_CNT + 4,
 				  db->buf_pool_ptr, db->buf_pool_dma_ptr);
 		pci_release_regions(pdev);
+		pci_disable_device(pdev);
 		free_netdev(dev);	/* free board information */
 	}
 
