Return-Path: <SRS0=iI52=RV=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEB8C43381
	for <linux-parisc@archiver.kernel.org>; Mon, 18 Mar 2019 15:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8CA32085A
	for <linux-parisc@archiver.kernel.org>; Mon, 18 Mar 2019 15:08:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=duncanthrax.net header.i=@duncanthrax.net header.b="rkrs0LZA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfCRPIV (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 18 Mar 2019 11:08:21 -0400
Received: from smtp.duncanthrax.net ([89.31.1.170]:33976 "EHLO
        smtp.duncanthrax.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfCRPIV (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 18 Mar 2019 11:08:21 -0400
X-Greylist: delayed 3300 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Mar 2019 11:08:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=duncanthrax.net; s=dkim; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From;
        bh=c2hbLF4zrDVDS9ESeagCHnTlG/0evxvVGf865T7z+eM=; b=rkrs0LZA+ZSDzsXP2zXSmDotKs
        fowZWyVwHGPSR/qb/SsA0k/2b/+klpyM/Kqy3GnWfaC85yu+uPXf5cmcTYmoTA90h4KXugzHfWrSt
        tUOduGnsnyQvHLdwhAsc61gVAjA5q1suhzMggKDThZiNhRXhSujesw2vwyhNMai7HkRo=;
Received: from frobwit.duncanthrax.net ([89.31.1.178] helo=t470p.intern)
        by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <svens@stackframe.org>)
        id 1h5t0x-0008Oo-QV; Mon, 18 Mar 2019 15:13:19 +0100
From:   Sven Schnelle <svens@stackframe.org>
To:     deller@gmx.de
Cc:     linux-parisc@vger.kernel.org, Sven Schnelle <svens@stackframe.org>
Subject: [PATCH] parisc: fix iosapic address compare
Date:   Mon, 18 Mar 2019 15:13:01 +0100
Message-Id: <20190318141301.14750-1-svens@stackframe.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

i just updated my C3750 to latest git, and got the kernel oops below. It looks
like the change to using F_EXTEND breaks using 32 bit kernels on at least my
C3750. Not sure whether we should revert the F_EXTEND change, or just cast
the other side of the compare to long. The patch below does this.

      _______________________________ 
    < Your System ate a SPARC! Gah! >
     ------------------------------- 
            \   ^__^
                (__)\       )\/\
                 U  ||----w |
                    ||     ||
swapper (pid 1): Unknown kernel breakpoint (code 9)
CPU: 0 PID: 1 Comm: swapper Not tainted 5.0.0+ #60
Hardware name: 9000/785/C3750

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  0004000f 109bf020 10451e1c 4fc58340
r04-07  109bf730 00000000 109bf020 00002710
r08-11  10852cf4 10852d08 1093d800 1093d800
r12-15  4fc43470 0000ffff 10998820 10459834
r16-19  101c9f28 00000000 38be5e00 00000000
r20-23  38be5e00 38000000 10459834 00000000
r24-27  3d090000 00000000 4fc43400 10902020
r28-31  00000000 38be5e00 4fc583c0 101165d4
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10459adc 10459ae0
 IIR: 03ffe01f    ISR: 102400ff  IOR: 1605835c
 CPU:        0   CR30: 4fc58000 CR31: ffffffff
 ORIG_R28: 109a8820
 IAOQ[0]: superio_init+0x2a8/0x508
 IAOQ[1]: superio_init+0x2ac/0x508
 RP(r2): pci_do_fixups+0x12c/0x208
Backtrace:
 [<10451e1c>] pci_do_fixups+0x12c/0x208
 [<101165d4>] 0x101165d4
 [<10156184>] do_one_initcall+0xa0/0x1d8
 [<101014dc>] 0x101014dc
 [<10762fd8>] kernel_init+0x20/0x1a0
 [<1015e01c>] ret_from_kernel_thread+0x1c/0x24

CPU: 0 PID: 1 Comm: swapper Not tainted 5.0.0+ #60
Hardware name: 9000/785/C3750
Backtrace:
 [<101593a4>] show_stack+0x3c/0x4c
 [<107494a8>] dump_stack+0x3c/0x4c
 [<1015953c>] die_if_kernel+0x16c/0x2ac
 [<1015a16c>] handle_interruption+0x91c/0x960
 [<10459adc>] superio_init+0x2a8/0x508
 [<10451e1c>] pci_do_fixups+0x12c/0x208
 [<101165d4>] 0x101165d4
 [<10156184>] do_one_initcall+0xa0/0x1d8
 [<101014dc>] 0x101014dc
 [<10762fd8>] kernel_init+0x20/0x1a0
 [<1015e01c>] ret_from_kernel_thread+0x1c/0x24

---[ end trace 7170ce927b5084fc ]---

Regards
Sven

-- 
Using F_EXTEND doesn't work here as it casts hpa to long,
which is 32 bit on parisc32, while dest_iosapic_addr is 64 bit.
Fix this by doing a cast to long on dest_iosapic_addr.

Fixes: 97d7e2e3fd8a ("parisc: Use F_EXTEND() macro in iosapic code")
Signed-off-by: Sven Schnelle <svens@stackframe.org>
---
 drivers/parisc/iosapic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parisc/iosapic.c b/drivers/parisc/iosapic.c
index 1be571c20062..1b0c3139d971 100644
--- a/drivers/parisc/iosapic.c
+++ b/drivers/parisc/iosapic.c
@@ -158,7 +158,7 @@
 #endif
 
 #define COMPARE_IRTE_ADDR(irte, hpa)	\
-		((irte)->dest_iosapic_addr == F_EXTEND(hpa))
+		((long)(irte)->dest_iosapic_addr == F_EXTEND(hpa))
 
 #define IOSAPIC_REG_SELECT              0x00
 #define IOSAPIC_REG_WINDOW              0x10
-- 
2.20.1

