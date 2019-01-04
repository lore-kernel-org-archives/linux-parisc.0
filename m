Return-Path: <SRS0=cK3J=PM=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CFEC43387
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 23:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CCA522173B
	for <linux-parisc@archiver.kernel.org>; Fri,  4 Jan 2019 23:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfADXg7 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 4 Jan 2019 18:36:59 -0500
Received: from mout.gmx.net ([212.227.17.22]:51501 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfADXg7 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 4 Jan 2019 18:36:59 -0500
Received: from ls3530.dellerweb.de ([92.116.186.155]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MC8iq-1gWjKd0Jii-008si5; Sat, 05 Jan 2019 00:36:51 +0100
Date:   Sat, 5 Jan 2019 00:36:46 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Hide SMP irq accounting on UP systems
Message-ID: <20190104233646.GA1223@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:Ua4eIRHt/heN97oXJbTb4ZFY5I+7M9uJu8t6h3t3IZBCyh5cSlr
 bfbDJ8HdKP4to/zclhoO5j+Dn4dRV+HWaRgUOxGD4stg35A0+WuKiqxbvWVdq2qNHP1giTs
 HXUAh0OHeS5K+wQuiSmTnKkXmS36GPzjGG6nJywyUhHeWnM7yRYT2jn1GdckI9f+3S/eMqk
 uS6e6O8db73osFKUXh5pQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VsXX62Ehvs8=:s6YmxQ4FFOr8sKf6f8UBCA
 7PA1nUtpvXWP+ah2AK2vsYbA4oWA7KLc/H+O8S1IA+67nPv39NMpPwgJBqrTckgLW/0vuKew8
 p53Mep6xLy8SHvvvJHt+vBvz58BhaT9Lt41T+uEUAPx3vapshfAgQ48W6UVBbtWXRdJI6MBKE
 DuXo/jEM5A3rE2ftaUMgeyL7ZA4z5d0cD7oV8gV6XWbv0hCXk3/wmT8lcriCiRHd8ub0nfcW6
 sn4uOFBUQYssRr5+BWsxE+N8kR9B9IxkZTPB1B9I157GPfeTECr7ClgOAcWL/H5SDtRzlSC2K
 kFTfV9LERvZ5pgEpSB3AXp7hdsMltMmsrhUGnZSQ+8Wl6BQ6UWXJ+7ttx+qGeUa8DmCtuI/zT
 A6iCBIK+cbPkQSh9Gg7W9T/EBFxAcOgiXEqR1sznuIHvmLt7MYMpQ2PAqHxentsrdOGJ3Cxxp
 i5AMi8LRaW5Cm6xJ24mQvqWeut+g0hMSguDiBvLJoZF1Hbk3oI6/4UP8nXPYSkX8j/EclaxXL
 oQ8ESskuc+56/4PiYitcC+MtVsg5G/tUf91WSxqvLSAtAKr/8ogK26Snz2EtvIT+IYwPbM56s
 wf1obcvdUVVDYrjsrdHabIvTVDC2FIWViEcWKvSMpyLlHU/vgF4Rych9+1OW26+oelpsqCino
 Y8EX41RgSkpVvwSfaqvPIx61SeIkPhKG2qD5pAF4LYXZn/g7RuPtA/IhdsbTbo9nffoI8uo4X
 ZWVxOuPCNnQ/3iqrCU8MMSyE5bUjQJMM4sq076a7hW1GCQI3rKjQhFq8GzyE14JHLC9Jn/LIU
 +ERgxhWDtHianumniMjB6lEii2oUHO4NU53W+Xw2LgCs/0A4fKCcwnGhrQBAPvh7xFkGyMkAf
 D58xmOmFKPhIp/bsqw7nz7DcCAkFmhXSiYPuUGY4E=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hide Rescheduling (RES) and Function call (CAL) interrupts when
running a UP machine.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index fd6d8739e145..6f19f364c20a 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -175,14 +175,16 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 # endif
 #endif
 #ifdef CONFIG_SMP
-	seq_printf(p, "%*s: ", prec, "RES");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
-	seq_puts(p, "  Rescheduling interrupts\n");
-	seq_printf(p, "%*s: ", prec, "CAL");
-	for_each_online_cpu(j)
-		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
-	seq_puts(p, "  Function call interrupts\n");
+	if (num_online_cpus() > 1) {
+		seq_printf(p, "%*s: ", prec, "RES");
+		for_each_online_cpu(j)
+			seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
+		seq_puts(p, "  Rescheduling interrupts\n");
+		seq_printf(p, "%*s: ", prec, "CAL");
+		for_each_online_cpu(j)
+			seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
+		seq_puts(p, "  Function call interrupts\n");
+	}
 #endif
 	seq_printf(p, "%*s: ", prec, "UAH");
 	for_each_online_cpu(j)
