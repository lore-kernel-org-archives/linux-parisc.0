Return-Path: <SRS0=rov3=QS=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE50CC169C4
	for <linux-parisc@archiver.kernel.org>; Mon, 11 Feb 2019 20:28:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4818218A4
	for <linux-parisc@archiver.kernel.org>; Mon, 11 Feb 2019 20:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfBKU2l (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 11 Feb 2019 15:28:41 -0500
Received: from mout.gmx.net ([212.227.17.20]:48631 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726938AbfBKU2l (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 11 Feb 2019 15:28:41 -0500
Received: from ls3530.dellerweb.de ([92.116.163.173]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LmJsk-1hStrH0TXG-00a0xN; Mon, 11 Feb 2019 21:28:33 +0100
Date:   Mon, 11 Feb 2019 21:28:29 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add constants for various PDC firmware calls
Message-ID: <20190211202829.GA19306@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:rQUvW1r2fWZ2mfUog10ketCVvG42FVsnbq/MHUahY0eAlbcfz/K
 gTM/VMliupISk6nOwJJepH7Z+dQscUNQ9TWb+oBZ/mWRrdETEtt4Sv4pO4BxTwVCKlW2DhQ
 YjxuDDff4WBJWo9mHSJ3+1W7KR4xY96meXHylVDh5VYAHm6hv19iLY3iAhYuZmj/JJb5bPO
 911mnvk4TiNOcgs2qjtZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qyCdudzsvGE=:gGRKABI8M1x3j89VN6Z/89
 kW56TOr09XeWJHpvaiZB2epK34mEF2YG+BkOxG7zMd0cqXecdNwVSftSdmh4lu65RdL/HXfpb
 xKfQvj0ogq1zHoD6tfkNAiwbmx6A7vMFIxUumFyYH56UykLsFXyiaW9rGb6JbNinYzzjXhIld
 uxpzIlTWlokkkdgiG3oGtiSAXfHiNKtXKO9xyxVhBB28tMSSCe4AzRJjl1FhtUmmf1jHBP8pv
 9PLCPNX14Feq3FN+qSJrQh509rEG1w17yAMrZp9bXEciKFoDhMTvvNHRaxbO7osO1ft+mCf6y
 xYdx5jpVS6tNv2vmJ9ql/GMnNfnotK+MuCb6FQh9Zgw/TS0ANUqPB2FEYQgS1u6FADLVRX6xR
 KQkUHse5W/txTJ30gYvvukWouQfOEhsl5SPeYriXgtNzT9myQuEiBPQFfs096zw37UvfO8KdD
 VSd5pnN0vJPZ1t5ZyMHH6Nc+JyB3N+5NV0gsCx2MQUtFWGz3iOD2eoKbcJPSdt2ai8FB7snBK
 I5Rd7LhxZiMzayHhYhQvqN4/ZuBRbmqcZbypqvAT7BCIiPSol5y+FGHTDq+UQGDHbn/rW32cF
 TsROlAPsA//vj2nU4oMrBEYY4YoF2areHsO8q1TWYP60t4wb9UYv6Q3JGYCfCSOAKO+P6yns6
 PAl3fUqofh3sT86nnGvyb0Si+zDPQ/vOccdpbDFXkmeJCTeEyMXQMPmVixkfx2AoyXfHR5RyB
 LmSmzfW1Md0yuHMd0Mj+Pncex3MfRG5YWrRNWp6sEGyfll1yKF8Km+nF0PX1uE8InGw5lMgvP
 WwRIGmg3N3P+0tGdge3BTBny3IxoZmQ72cps0xtmsDnUDUXye9dttvBZL90fVb3ep6GbEE1dt
 foyFo/pK2Y2kZJBk27Q6J02Cg2rvRezRi7xuhRzf6pDfrcscRGQIRjQRcaZ5Z1
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

PDC_DEBUG, PDC_ALLOC and PDC_SCSI_PARMS were missing.
PDC_CONFIG is call #17, not 16. Luckily it's nowhere referenced yet.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index cdab708516b4..ecab6d4e198f 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -114,11 +114,13 @@
 #define PDC_ADD_VALID	12		/* Memory validation PDC call	*/
 #define PDC_ADD_VALID_VERIFY	0	/* Make PDC_ADD_VALID verify region */
 
+#define PDC_DEBUG	14		/* Obsolete			*/
+
 #define PDC_INSTR	15		/* get instr to invoke PDCE_CHECK() */
 
 #define PDC_PROC	16		/* (sprockets)			*/
 
-#define PDC_CONFIG	16		/* (sprockets)			*/
+#define PDC_CONFIG	17		/* (sprockets)			*/
 #define PDC_CONFIG_DECONFIG	0
 #define PDC_CONFIG_DRECONFIG	1
 #define PDC_CONFIG_DRETURN_CONFIG 2
@@ -168,7 +170,15 @@
 #define PDC_SOFT_POWER_INFO	0	/* return info about the soft power switch */
 #define PDC_SOFT_POWER_ENABLE	1	/* enable/disable soft power switch */
 
-#define PDC_CRASH_PREP 25		/* Prepare system for crash dump */
+#define PDC_ALLOC	24		/* allocate static storage for PDC & IODC */
+
+#define PDC_CRASH_PREP	25		/* Prepare system for crash dump */
+#define PDC_CRASH_DUMP		0	/* Do platform specific preparations for dump */
+#define PDC_CRASH_LOG_CEC_ERROR 1	/* Dump hardware registers	*/
+
+#define PDC_SCSI_PARMS	26		/* Get and set SCSI parameters	*/
+#define PDC_SCSI_GET_PARMS	0	/* Get SCSI parameters for I/O device */
+#define PDC_SCSI_SET_PARMS	1	/* Set SCSI parameters for I/O device */
 
 /* HVERSION dependent */
 
