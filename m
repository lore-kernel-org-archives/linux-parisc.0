Return-Path: <SRS0=/AOo=PH=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ACAC43387
	for <linux-parisc@archiver.kernel.org>; Sun, 30 Dec 2018 13:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8327520815
	for <linux-parisc@archiver.kernel.org>; Sun, 30 Dec 2018 13:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbeL3NCC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 30 Dec 2018 08:02:02 -0500
Received: from mout.gmx.net ([212.227.17.22]:40457 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbeL3NCC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 30 Dec 2018 08:02:02 -0500
Received: from ls3530.dellerweb.de ([92.116.187.119]) by mail.gmx.com
 (mrgmx102 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LhkiL-1h8Zpw1kX3-00mtHI; Sun, 30 Dec 2018 14:01:53 +0100
Date:   Sun, 30 Dec 2018 14:01:49 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Count IPI function calls
Message-ID: <20181230130149.GA24375@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:jJk6AOjbzRM0/D99yBXhrNJyCw6ZYaPZHLQC10xP0sn8zy1HO0/
 OzTG7CgOY14ONug7zrmL61OT1wE164PsZP9OD00Lhg1BvraFd6sgkkGjR7Us/SB3N0LJlhq
 JypBryphK0R2NB6NZ6ftzg1A8ELJn09wyx4iXTR4q5FB3M+XrdyM25cCVaMoY6SWluGpS+1
 WXy5tY9vhkw13drXj+r4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fz6qwc6YKpc=:9Q4thFCjHfI/FpAJXWS0Yu
 RowJBartvUx0gnFAdYYPclcn/2hMdhrWMPF+lB/m9SdJkixBbS26qskeQsTbRo7KcWSEuvMDg
 g4pKVtQAOfpe/sjT0NHgpcOF/IbeCeew8cYGp8uPrOGFM9wqS3IdtGyqlsUWXk98TczW+ODfg
 vzgxqeSLeHZ2v6yDl2VYZkAQ++P9DlhaUs7/bS5FpKjtXLB2XIX/TFD5vQCZMF1pUpg4uH6/J
 mIC0BYCPMJlH+pnrjzrbCrQFf0Lr2GFmS7piFPe7LAPZCqbtVJdI7scYScg6DlhOPOgiFhabO
 Uj0JDCI6jGy6oU1eDrJ3vZOEi5MLNdO0RHaQ1yM/LRLb5d7RvdS0nTLs8hWmLUfwmxVB7jjAd
 l+HTrajZSmUHXka5A4Vjb71vUyXBSGCAm16UTReKTjTcUDvIIseQ14D81xc1mhiU4CYkxN6WM
 FLn3gA0O1ugXjuRwNSdhhXYo07PwrPcYSgUqfZV6E67ygqnwcaX00YwEa7xicCgl1OoZW4p8O
 YMeItJ+TfJjjLyE7tlGhCVdLpHdugF8SlReUNqy/7vo64JicPDIpdxRfB9DuTEFVDkkFq2hWA
 3fp30rRlKkiM/JUgnf4VZIUJDzleOKou6uAb6gEMcp7ABrquL9UrnAaCc0af1l/PHPBr4yUx5
 rayGJVgRi6g3JBTJKxDuf+IhHx7e4Ov9khJA9GORA+aEJdT2d5pczC4pizM+Qr2RSuNNO+JLX
 4g+c06gJ6slUMNzshl1Gmn/x1ZI0KIea/TkmHOGk6OmtLEFsZtNHzVCyPKfUjS2QTaXWSXfJf
 Kbz0wJjvtEAx25J7ZkO8BXhPyZJ1q7R96DOL1TOa9w88/y3S8i4pgg6OXPpWtlRnxcH5Ecdjx
 lzHW0EgdBpAEGGAD4U6qiIJbL64nzofPKDirlEciM=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Like other platforms, count the number of IPI function calls and show it
in /proc/interrupts.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
index 1a1235a9d533..7f7039516e53 100644
--- a/arch/parisc/include/asm/hardirq.h
+++ b/arch/parisc/include/asm/hardirq.h
@@ -22,6 +22,7 @@ typedef struct {
 	unsigned int irq_stack_usage;
 #ifdef CONFIG_SMP
 	unsigned int irq_resched_count;
+	unsigned int irq_call_count;
 #endif
 	unsigned int irq_unaligned_count;
 	unsigned int irq_fpassist_count;
diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index 0ca254085a66..e24a790815a5 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -179,6 +180,10 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 	for_each_online_cpu(j)
 		seq_printf(p, "%10u ", irq_stats(j)->irq_resched_count);
 	seq_puts(p, "  Rescheduling interrupts\n");
+	seq_printf(p, "%*s: ", prec, "CAL");
+	for_each_online_cpu(j)
+		seq_printf(p, "%10u ", irq_stats(j)->irq_call_count);
+	seq_puts(p, "  Function call interrupts\n");
 #endif
 	seq_printf(p, "%*s: ", prec, "UAH");
 	for_each_online_cpu(j)
diff --git a/arch/parisc/kernel/smp.c b/arch/parisc/kernel/smp.c
index 5e26dbede5fc..d9e2d69c9e48 100644
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -155,6 +155,7 @@ ipi_interrupt(int irq, void *dev_id)
 
 			case IPI_CALL_FUNC:
 				smp_debug(100, KERN_DEBUG "CPU%d IPI_CALL_FUNC\n", this_cpu);
+				inc_irq_stat(irq_call_count);
 				generic_smp_call_function_interrupt();
 				break;
 
