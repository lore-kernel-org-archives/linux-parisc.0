Return-Path: <SRS0=b8iV=SE=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4092DC4360F
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 10:17:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01C012082C
	for <linux-parisc@archiver.kernel.org>; Tue,  2 Apr 2019 10:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="AuURPqPa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfDBKRS (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 2 Apr 2019 06:17:18 -0400
Received: from mout.gmx.net ([212.227.15.19]:50941 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfDBKRS (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 2 Apr 2019 06:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554200231;
        bh=ow/R/1PnM02LPMaOJ6JK3lrtc8YKVeGrdPRmgs0Hiec=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=AuURPqPaMrYMVXs6M5acx56Y9GDi8LZ+VHqBkuk8XkNUzilj3HHC5yVKi5EUT1lu+
         +NHKxVntxIg9SOMJayCwN9tunRGhXRxBoDgaxyrTjd5mKDoeHnTyo6Ynyc2FLoFFtr
         2seUT29iSZeslDAYLkzIT9jaa+M/vcBROzhNfOIk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.133.0]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lj1Xa-1gexKb1XXK-00dGml; Tue, 02
 Apr 2019 12:17:11 +0200
Date:   Tue, 2 Apr 2019 12:17:08 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Skip registering LED when running in QEMU
Message-ID: <20190402101708.GA16152@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:ykC3hEXzhrITaXjQlKuCV48sBAxTxtappg9IpCIB4TjZISHnRQt
 TvG6sKzC/GlP3GK0ZDkb5JFxmxrJZz4vp5hriiUnIpXu1+UGj2C2LGUpAmhlaTIPUMtBqf0
 q/VuDAviJH028/ajNKjVMVWUVgajJmWm/Z1FdDqoqRGXjAJLXvWK7jIukFktNQiHJW22EAj
 RnzmerH1rvXcfFxEWZn2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PvQU5JeMKGg=:E0OG/uJ9tvWenmxNjQLyr/
 TTZ0PdAY4O6+ibpD2UhzN01oSMQozwCdB7kSxpj6/umfxtgQEnZHPMlbxUq2KFFLVE7/8z9fN
 xN+5FMSrH8SdXeYr/K2dkYrC/R3bvHIOuY3TOiikYGmeC1zGul1K22rE+C7rI9Gnaiiv4OjbN
 zyhMg9R98AGXu/rbTgjg26tZePlYxAf9HK9FwtDf4uxdAuYNRXSrzZuwZpWKEwb3YgXwN/VFw
 bugacWtP11naCyLGJEIruSIbnhJx2jzI7yGnv90CpAf7dZvfqQ9E9y080dVfH0PIqlnIj7o2+
 /MRgR2TbcrPTgqqNp3mxVP+54SPa4wVlH7FpxSZT35puuGLUI2V1ORA40r7YjDBRyq+rOQA67
 yOad2HMBmiZhdTgwQX3wPvxz+FYODvi4+JMObDU3nvBV5inzUCTuy7PfjjPozx1tWB60Ye+ER
 /Vhvxf5axMKGWM7eF0YoRhWLEJAQdvUITpjgNYjnZSmipDtcJWlVFsfKRSTunT0gi3/3w4i2F
 6bC44zLIcAoHonfKWYTmcG+UlXfI+rysL1Bvf/9SMrrk0hj0/vtGJh2OrRpV/nFfn4dbBwE3d
 52SE0YxOIHJqIMy3SiXgh4PxHC1ZHUPkahcO8nE9/XhQuDw8Kn9g9dzx1zXcSCEldiNRoMyGC
 Gf80ne3ffkx8cZoNbVkj+TG70VreGrzZFsvE32U+3ARj/e5+XKRXeHM59XtYTQcGZxJJcS19R
 NchXeKgx50tykD1sH2MDKD3kRGOCocNmuk9auX+iu7NCql75kcFSRCGvb4npIJjhKZ7U0Tjlp
 kvAlfj1pQyd7PACiA99+b/+nWFSehC5LcWtjzMtsz/5HNtlKJ0SBbkpqD7IQ+w5h6iKaRD+jt
 sb7gnfn//j1kh8ZmBwZCC7r/cI/BXIscNUno/DCzWCn/EihqMqlwUzoqM3WrKB
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

No need to spend CPU cycles when we run on QEMU.

Signed-off-by: Helge Deller <deller@gmx.de>
CC: stable@vger.kernel.org # v4.9+

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 0c6e8b44b4ed..3ecd33e765ac 100644
=2D-- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -568,6 +569,9 @@ int __init register_led_driver(int model, unsigned lon=
g cmd_reg, unsigned long d
 		break;

 	case DISPLAY_MODEL_LASI:
+		/* Skip to register LED in QEMU */
+		if (running_on_qemu)
+			return 1;
 		LED_DATA_REG =3D data_reg;
 		led_func_ptr =3D led_LASI_driver;
 		printk(KERN_INFO "LED display at %lx registered\n", LED_DATA_REG);
