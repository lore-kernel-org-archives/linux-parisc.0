Return-Path: <SRS0=p2uU=QP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE7FC169C4
	for <linux-parisc@archiver.kernel.org>; Fri,  8 Feb 2019 17:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7576920855
	for <linux-parisc@archiver.kernel.org>; Fri,  8 Feb 2019 17:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfBHRYb (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 8 Feb 2019 12:24:31 -0500
Received: from mout.gmx.net ([212.227.15.15]:57369 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbfBHRYa (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 8 Feb 2019 12:24:30 -0500
Received: from ls3530.dellerweb.de ([92.116.155.128]) by mail.gmx.com
 (mrgmx001 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MDymt-1gtTTu2kyF-00HRAP; Fri, 08 Feb 2019 18:24:21 +0100
Date:   Fri, 8 Feb 2019 18:24:16 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add constants for PDC_RELOCATE PDC call
Message-ID: <20190208172405.GA29207@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:E38ACL1GJ526u8FPN5o9HeGCRP7VsxoQgvv1+EVPxO697KpF12D
 FJ1qfe0k/BlkjlmLIMV764/L3UpI/i2+tW5zrotjN5xz7WLNjUfP9FhoGQ4PPx9Z9A5IZba
 bXouQTptQqDR4GYa2PlOsBHJg6Vq/7N1k8FVNIXLQYTT2fd+AjuJdqlmGqcytoIQvRGfP+M
 mJ5Z5Q1OwjH82RHKcsoVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:88ruqYU57/g=:1xFxCUuujF/06VdUD4xICg
 +CQ4Q4rbGF3dXo4oPba3W3CN3qgHYeiAKLmf+Lt6vpAonWd+nFni1ahCZYiZrwrYLmf4y6mN4
 JmF/pXEYt7uV1g+Q3zMwYFL36nGdYMBfwCCvvDTyF/enLUfjvvd1TrOxu5Xc4XiavREC48wuG
 2eLStoAWB+zg9nj+h2NLtuUqikqxj706iEZnAamBNLW//6GkiqF+OsQc5W4Pu80ny0SDWSGU9
 zkjXSDUDIzxbFvnM0D9dHGoajp9m74SPWG21R8NomcgPlWB3WEteFassJiXwjsPFKFC6w453s
 JMgsY4bZZUBk2nR98Iyco5ZhZI5VKZTopLJjy75vsAwjBpoDSdeXP075pxWHT7MMgi10KYsDK
 qnCQKA3/fF4Qs1vFQT6pTAX4dR8V4tGjJRKHTnuwbiCJ7eJVPYbbjl1g58zj52lc5J6HvcbbQ
 a7KUJ1jjZqsu3kDY2PjICzGcHRZ65wuodKPjZamWbvQu93shOi0gUwvSBwQbZCI7YGIMSldC1
 UnwOwJpBi26eiA/tgX3arvX9jYrJKPWxYk0tqheo99oe7LwRazqw+6OF/qxoKhCYo4pzJN/2D
 pavJL0zjrOmdjdYDtYkjLx9U1aEsLbmUDfIqpCjJowFc6HDkvk3QnPO7hjhvmXwbV73h5RpEZ
 ljwlhkhSIkiHyuAxh0gGLYolSI1QA3ivQTTATLKgPcHnCFY16m+wHQMm7fqWWn1LfK/20ApEz
 Hikla4Bv0KesK7okseHpEDl2IP2zPVyYBO55+m1l8vbd7O68VXL4R1yuUkYW2pOYZY6mj+h6P
 F4ltUkRXPcrwhOJxzxYI98/R6ILXUO30RZDRF2xkyyr+my6nbdIP2TvD5iBndPvs6ci+GjmnE
 NkKnLRDBCRNNPnj4znUlqmt3U8c+Udq4T8s7z2SEIdLbybyyxZYx7INZumI1wE
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The PDC_RELOCATE function is called by HP-UX shortly before crashing.
So, we need to handle it in qemu and thus it makes sense to add the
constant here.

Additionally add other subfunctions like PDC_MODEL_GET_PLATFORM_INFO (to
get product and serial numbers) and PDC_TOD_CALIBRATE (to calibrate
timers) too.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 6d68bda2d261..cdab708516b4 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -60,6 +60,7 @@
 #define  PDC_MODEL_NVA_UNSUPPORTED	(3 << 4)
 #define PDC_MODEL_GET_BOOT__OP	8	/* returns boot test options	*/
 #define PDC_MODEL_SET_BOOT__OP	9	/* set boot test options	*/
+#define PDC_MODEL_GET_PLATFORM_INFO 10	/* returns platform info	*/
 
 #define PA89_INSTRUCTION_SET	0x4	/* capabilities returned	*/
 #define PA90_INSTRUCTION_SET	0x8
@@ -99,7 +100,7 @@
 #define PDC_TOD		9		/* time-of-day clock (TOD)	*/
 #define PDC_TOD_READ		0	/* read TOD			*/
 #define PDC_TOD_WRITE		1	/* write TOD			*/
-
+#define PDC_TOD_CALIBRATE	2	/* calibrate timers		*/
 
 #define PDC_STABLE	10		/* stable storage (sprockets)	*/
 #define PDC_STABLE_READ		0
@@ -261,6 +262,10 @@
 #define PDC_PCI_READ_MON_TYPE		15
 #define PDC_PCI_WRITE_MON_TYPE		16
 
+#define PDC_RELOCATE	149		/* (sprockets)			*/
+#define PDC_RELOCATE_GET_RELOCINFO	0
+#define PDC_RELOCATE_CHECKSUM		1
+#define PDC_RELOCATE_RELOCATE		2
 
 /* Get SCSI Interface Card info:  SDTR, SCSI ID, mode (SE vs LVD) */
 #define PDC_INITIATOR	163
