Return-Path: <SRS0=iI52=RV=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015CBC43381
	for <linux-parisc@archiver.kernel.org>; Mon, 18 Mar 2019 22:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFA1620863
	for <linux-parisc@archiver.kernel.org>; Mon, 18 Mar 2019 22:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfCRWDK (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 18 Mar 2019 18:03:10 -0400
Received: from mout.gmx.net ([212.227.15.18]:41991 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbfCRWDJ (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 18 Mar 2019 18:03:09 -0400
Received: from ls3530.dellerweb.de ([92.116.173.221]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M3zne-1gpADZ38qY-00rXke; Mon, 18 Mar 2019 23:03:07 +0100
Date:   Mon, 18 Mar 2019 23:03:06 +0100
From:   Helge Deller <deller@gmx.de>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     deller@gmx.de, linux-parisc@vger.kernel.org
Subject: Re: [PATCH] parisc: fix iosapic address compare
Message-ID: <20190318220306.GA10060@ls3530.dellerweb.de>
References: <20190318141301.14750-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190318141301.14750-1-svens@stackframe.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:Zdf9m1qPypSeoN0IjV6dvdX3XHRUGqoi0k6Eu4612jeTThQp83e
 e2I7N2y02oFmHHXDl6it8E6FIIIzenFZIEAJbVOjcKZt07t4kwo2G1acwmHOCC9FIhcphyX
 nshZUibwOq/K6YC4w2Hs7CH/9BEpSnWmo77yZOTlf3yjrHqtVUcsS4qRTBwTXFH0B2wUmYT
 FdPcgVppzvLszCKlwYkAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3PWSE3NyEt4=:nCfkglVIyMSV0BKdrXzMYE
 eUqA+TbYJ6NVWGfzeY3iPLW7Yn11hb++oBrcbzrLVnKAEomMmpKYQwXHofjT1uR1dDslw6FM7
 ppNjEoxhq6314fRz9lThbysXz2frhNkwpd0uELOUcOH6JJ+hgsqSIrTMJwzKu+M+PK/Fb0J7Z
 tmu9uTIwnP5RlnmyUJSAllaG3c2IkPxpu+IrbRYiKAfBKQPD53692uOG8fVBlAP6a7iIjZ1/d
 TM9b1NljsJCaAmMQoUhv3ncyRMVgFkC5Q8+RanUTb1iNI7Rg59wFgoSZpygqTzZUFdZjVp9Fl
 PSVm34fKDLFOhlRe7ki8PvANTOCJ+Af75srZN6JcR2GluoolpY29c+9DK+ZRTT/DofPuSXmdV
 ZXUYkPvxtMTH0IMK15RqRa6R8Ywxr32twLNRVu69zrefG3xaCNqkXUHcaFpMKILn0lBpjUMnF
 vn1PfFE6ufmyL/ckW60LU3YFDBnAOFB35RertqmmEZcbPxIxD2gV+1qYDfvOWScqTP1F3yer4
 HEqUQ2x3X8WScpDzxpvkNBf12QxeYh7q74ZJ0tUe56YX9DP2TiK4TOEncIUDbd+K+9jYUxrq8
 dKUgGoFZUwm7N11fuXX2gP3b2A7Mf67ZGZZun12hBOLWLhd2Iw6OOVZBY/1rqVwwJ8AHcnNFL
 WEqy2g1Z3YOjuRQg1Evjh68+ypfVFLlhiHWRi92BFvA8Xp1M7TeR4EkoIXxU1fw/x9jGTgwwT
 +VFTIvifFMduhnBYstwH62P6Y/u+DvU/TXX7mFIo14SDSGHQTqkHGjZKTYIcbwoKTUFz3l+su
 TCg9Ceo1G+xNXQ+T2eXfAPmrVFZGwkPiBcKW4zyQHUPi7HLwPQPW7I6e918wSSGlycTYH+akV
 860Ge79LjrASNUqLcG0NZRBksnpAz7oklrUihbVUTxg3sSHvZFJgXR6DKvrZxW
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Sven,

* Sven Schnelle <svens@stackframe.org>:
> i just updated my C3750 to latest git, and got the kernel oops below. It looks
> like the change to using F_EXTEND breaks using 32 bit kernels on at least my
> C3750. Not sure whether we should revert the F_EXTEND change, or just cast
> the other side of the compare to long. The patch below does this.

Thanks for testing!
I think, as suggested by you, revertig parts of my patch makes most sense.
I've committed the patch below to my for-next tree.
Can you check if it works for you?

Helge

--------------------
From dae50289effc106df023796eb25d602244e73ac1 Mon Sep 17 00:00:00 2001
From: Helge Deller <deller@gmx.de>
Date: Mon, 18 Mar 2019 22:56:15 +0100
Subject: [PATCH] Revert: parisc: Use F_EXTEND() macro in iosapic code

Revert parts of commit 97d7e2e3fd8a ("parisc: Use F_EXTEND() macro in
iosapic code").  It breaks booting the 32-bit kernel.

Reported-by: Sven Schnelle <svens@stackframe.org>
Fixes: 97d7e2e3fd8a ("parisc: Use F_EXTEND() macro in iosapic code")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 1be571c20062..6bad04cbb1d3 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -157,8 +157,12 @@
 #define DBG_IRT(x...)
 #endif
 
+#ifdef CONFIG_64BIT
+#define COMPARE_IRTE_ADDR(irte, hpa)	((irte)->dest_iosapic_addr == (hpa))
+#else
 #define COMPARE_IRTE_ADDR(irte, hpa)	\
-		((irte)->dest_iosapic_addr == F_EXTEND(hpa))
+		((irte)->dest_iosapic_addr == ((hpa) | 0xffffffff00000000ULL))
+#endif
 
 #define IOSAPIC_REG_SELECT              0x00
 #define IOSAPIC_REG_WINDOW              0x10
