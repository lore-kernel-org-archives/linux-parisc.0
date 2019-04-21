Return-Path: <SRS0=3cH6=SX=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25858C10F14
	for <linux-parisc@archiver.kernel.org>; Sun, 21 Apr 2019 23:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF8F32080D
	for <linux-parisc@archiver.kernel.org>; Sun, 21 Apr 2019 23:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfDUXrU (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 21 Apr 2019 19:47:20 -0400
Received: from simcoe207srvr.owm.bell.net ([184.150.200.207]:34234 "EHLO
        torfep01.bell.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725821AbfDUXrU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 21 Apr 2019 19:47:20 -0400
Received: from bell.net torfep01 184.150.200.158 by torfep01.bell.net
          with ESMTP
          id <20190421234718.BTMB4584.torfep01.bell.net@torspm02.bell.net>
          for <linux-parisc@vger.kernel.org>;
          Sun, 21 Apr 2019 19:47:18 -0400
Received: from [192.168.2.49] (really [70.53.52.226]) by torspm02.bell.net
          with ESMTP
          id <20190421234718.EXSF30132.torspm02.bell.net@[192.168.2.49]>;
          Sun, 21 Apr 2019 19:47:18 -0400
To:     linux-parisc <linux-parisc@vger.kernel.org>
Cc:     Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
From:   John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Add memory clobber to TLB purges
Openpgp: preference=signencrypt
Message-ID: <91d3890d-9694-d92f-962b-ec64b54e2f48@bell.net>
Date:   Sun, 21 Apr 2019 19:47:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-Analysis: v=2.3 cv=bPxo382Z c=1 sm=1 tr=0 cx=a_idp_f a=eekNWfHKKKZHbRJeTMr8Cw==:117 a=eekNWfHKKKZHbRJeTMr8Cw==:17 a=IkcTkHD0fZMA:10 a=oexKYjalfGEA:10 a=FBHGMhGWAAAA:8 a=MMQAi4zvrFcFaamUEIkA:9 a=QEXdDO2ut3YA:10 a=9gvnlMMaQFpL9xblJ6ne:22
X-CM-Envelope: MS4wfJbXn+J9aZlVJq6talCVgI9EZ8NmkDBcBI9UgXi/wHZ/hs8hzeboX4peDgrZGF68StP7agwqrrPSj6WotagZ1ArUSIqIV6726VoLKiVgH8JcyFz6Jx3S mZMK8+uI8+C9TNnDY9+uMnB1BdrjCQ+vMWJTLwaFeTagS/rXxMcjcbpHOCenbe6w0+jQQcU0b5Caug==
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pdtlb and pitlb instructions are strongly ordered.  The asms invoking
these instructions should be compiler memory barriers to ensure the compiler
doesn't reorder memory operations around these instructions.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index 006fb939cac8..c18351cf5876 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -44,14 +44,14 @@ void parisc_setup_cache_timing(void);

 #define pdtlb(addr)	asm volatile("pdtlb 0(%%sr1,%0)" \
 			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
-			: : "r" (addr))
+			: : "r" (addr) : "memory")
 #define pitlb(addr)	asm volatile("pitlb 0(%%sr1,%0)" \
 			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
 			ALTERNATIVE(ALT_COND_NO_SPLIT_TLB, INSN_NOP) \
-			: : "r" (addr))
+			: : "r" (addr) : "memory")
 #define pdtlb_kernel(addr)  asm volatile("pdtlb 0(%0)"   \
 			ALTERNATIVE(ALT_COND_NO_SMP, INSN_PxTLB) \
-			: : "r" (addr))
+			: : "r" (addr) : "memory")

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
 			ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
