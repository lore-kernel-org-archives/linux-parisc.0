Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E049F44AB99
	for <linux-parisc@vger.kernel.org>; Fri, 31 Jul 2026 18:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522819; cv=none; b=R/+eU8E+2jDb6P29lg7yfi+YOpt7mUiotnuCmtl/q4Fqa3HaUHKD5W9aA1Fr6gMo/qMG52obxdOjq4GTr8rhPsAWsImqApieDgEC++TT4APTHZ6p1D+pIu+6s4YpkrALY1T9FcL6fFXi4xD9Gq6ygFlNDdHgnJHQpMO7ksWxIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522819; c=relaxed/simple;
	bh=c9JcSWid4Tlze59tgR6pTgHi4316qVQ76fGNHfD+tYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUSQkZWACLabTbT8gzfHKMjydqcGGd6gu1DakuT7lCukXBq9g+XUfBOCDTiLssd0DkvKDw8tESKkORxnMbHW5XVFi0jHFPkgJq8B5SfndxPyCKcBpFJ1ui50LIL/LU+gNnYdfocqg8WxvMa2Ip6oIrXLRhjXKzSGFAW/Qcp6SN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7Sl9o6t; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7Sl9o6t"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1283128f8f.1
        for <linux-parisc@vger.kernel.org>; Fri, 31 Jul 2026 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785522816; x=1786127616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgvDiRBCDuNDz6F1z+I21byZ3S3YM0bsok3NwpDcpas=;
        b=l7Sl9o6tJOuOUX/nFSr9ZhSWXHwNLeFLOoCOucemlMRs+ucsgBZ/RN39CVanmomxGN
         uLl2XOsfqoFA2OpAUu0gbQ53FwKgIbpfpMJNi+ppQSeO30SQtCKB0hvO+GyTHMPJV45z
         PohX0FbObyNFHlJLrWOZE4PRma7On8AjOGrqrA5jhNkvu6i31KEnIdkar3yn0GX9zmzE
         cVMKt5R1eII91nO57//WGP6giiVWnQ+SYsRsy7D7aw8U/ykL/nPdp0HEVI+Z4sk31TNO
         i0NQE7twBejArj/2qW8XbdRZZPlCc2ZM+SWRoPOVmom/18SvStzRzopXqXlaEZHTG+DM
         LWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522816; x=1786127616;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgvDiRBCDuNDz6F1z+I21byZ3S3YM0bsok3NwpDcpas=;
        b=NZ+xhlyXeBWN0ryn69LkMRpvCpa8rw103oNRGI6ebLghMHEbozmJyF/wgPi7F50HXH
         CVzdenze8VyrIbeCcr4wxcLNl6toCWIZUVwaxIAcR5g/ntNyNRpQ5AhIfeaGYf65x+jp
         og5ac1nROeDSniFQlGOem27FRAYTl+wK0GbZf0fv8LLMuLjOaUT6j8Lq9/aLo6+LbJXj
         kILQkQA//trPCyU+Be+MGJzF4vKCSIFPl4Isv96t4cMZBW1LMRixHL9tE1MD22lyXV5i
         qfbQ7T/eoQ0ocClaEjPj11V+UW693XWraeLg2J4nfvNLSBpx6NFbnpVwpL8rxbJOhDvD
         J37Q==
X-Forwarded-Encrypted: i=1; AHgh+RrrUhfiIKxDceHDiCu/N4DY+L976iCGDhREc9NxtPXXxS9KYqzhqgI79qaXOy8TY+C93A5exvzxgsfvrtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ycVlFaJo87E9IFPQJKu+in55o7bYRi6lWmIs7djORzns1Ciy
	/zx4vpmKAUbt2QdKaHzMAIP0qgTsHk3cHN6Trj7ZsRcsSLtGvXQUpmOg
X-Gm-Gg: AR+sD12zp4LIf0c1NRAXeUue4SXeY4rMHvn72P9fpGIznrlc4bgn7j9sCH/y89ISGoc
	6TPOQmtJLCxdGIHyJ/a+nzOrQHom+xxqYsVsBuYRyvSe1BKPlaP6caHdj7pMLhTxSM4h7jdD8n0
	PyfiM5dKDSer/U+2wGSZsQZWMJC6sjXhEIAHq2O6M55yN5cNwTZLOQohcUAtP77B2Ywn6IX8OHn
	9IVOjH2h84HHjLjwf+VCAZt1AqEHQXcTYWuaC61BMjG8DLZlWz7KgstjSeXiueA+JnqNFIXX2IU
	RnDvpFvNE6N6hSdgCvGobydi5OA2tlMqM5MYSNcYbevM9sEoW12MA/TO9CZroryMVi/h4M1Uw5C
	cxhsMbm6HLUeOHfCk92aUYBPiGwtSFVV942/Sey8BmBOqqbdkfdFe4WLt0WjWXZH+91HrEdT7Ab
	dbO1OMkrF5NXQHkzRtYM5i5UvOdeM5I7lLStyhMrp4+0uMGjcP2j/wRDb9lYfnbtYifvSueR+bj
	Wo82IpP7HPymXhBItO6CRVZATmedDrg8KHCk/NgswPoH2/BT0nEHHa0xehtsaC4g2U=
X-Received: by 2002:a05:6000:2489:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47fd72a8634mr1552956f8f.16.1785522816037;
        Fri, 31 Jul 2026 11:33:36 -0700 (PDT)
Received: from ThinkPad-P15 (67.85-86-63.dynamic.clientes.euskaltel.es. [85.86.63.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1240sm7477683f8f.36.2026.07.31.11.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:33:35 -0700 (PDT)
Date: Fri, 31 Jul 2026 20:33:34 +0200
From: Pablo =?iso-8859-1?Q?Vallesp=EDn?= Aranguren <pablopva014@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"open list:TULIP NETWORK DRIVERS" <netdev@vger.kernel.org>,
	"open list:TULIP NETWORK DRIVERS" <linux-parisc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH] net: tulip: xircom_cb: drop runt frames before skb copy
Message-ID: <amzqfjeo0Yo1p0Rd@ThinkPad-P15>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

investigate_read_descriptor() takes the 11-bit packet length straight
from the device-written descriptor and subtracts 4 for the CRC. A
length below 4 underflows pkt_len to a negative value, which is then
passed to skb_put_data() as a huge unsigned length and corrupts memory
past the end of the freshly allocated skb.

Drop the frame as a length error if pkt_len is negative after CRC
removal.

Signed-off-by: Pablo Vallespín Aranguren <pablopva014@gmail.com>
Assisted-by: gkh_clanker_t1000
---
 drivers/net/ethernet/dec/tulip/xircom_cb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/dec/tulip/xircom_cb.c b/drivers/net/ethernet/dec/tulip/xircom_cb.c
index e5d2ede13845..62c64da1c8fa 100644
--- a/drivers/net/ethernet/dec/tulip/xircom_cb.c
+++ b/drivers/net/ethernet/dec/tulip/xircom_cb.c
@@ -1110,6 +1110,11 @@ investigate_read_descriptor(struct net_device *dev, struct xircom_private *card,
 					/* minus 4, we don't want the CRC */
 		struct sk_buff *skb;
 
+		if (pkt_len < 0) {
+			dev->stats.rx_length_errors++;
+			goto out;
+		}
+
 		if (pkt_len > 1518) {
 			netdev_err(dev, "Packet length %i is bogus\n", pkt_len);
 			pkt_len = 1518;
-- 
2.55.0

