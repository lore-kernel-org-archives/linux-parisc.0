Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F714C388F7
	for <linux-parisc@archiver.kernel.org>; Fri, 13 Nov 2020 14:24:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2552922248
	for <linux-parisc@archiver.kernel.org>; Fri, 13 Nov 2020 14:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N4/KUa4u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qj6DBzLc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgKMOYV (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 13 Nov 2020 09:24:21 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:52408 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgKMOYU (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 13 Nov 2020 09:24:20 -0500
Message-Id: <20201113141733.005212732@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605277457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=dfL8LhZDRV94dZhXM7BmDFOhpOb0BGKj21oie+vBdLw=;
        b=N4/KUa4uHiJso+C3WJViL7/en53R4HBsU3ogzm7nvCADvrlv1PVx1WIXj9lmd34MF6Ij/O
        UvgrjMYr4bv3LIvsyHaCbL6ioUkvdEdsBLPBZB6Ea+mLaljackefDr+F/1JISg+lZycY0I
        P1QsMCpTre+iuymcShE1lF0uOv9hDxCBZOse0P1gwG5Nts5zzaICKZuFHKcLR20+YBWTwe
        vViTKdGDQZhL/TQZ6iY90jX1JkBAzVyT8cnzWWceZczuZKdbkV72PvXsq8gELAWXYWjW3K
        YQ01fiBVVjQFARRJ9zQ0Bs2RhmHWe+rW2I9JA02PbfigdmJ1d/VdAQAx0BDtQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605277457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=dfL8LhZDRV94dZhXM7BmDFOhpOb0BGKj21oie+vBdLw=;
        b=Qj6DBzLcsREA7P1E6iB6NGDnQ44hCFII2Hz0w+ihai78OgVfJgByLiJi8lZgBMeRRl0hg2
        TDFqllYwBkd7sQDw==
Date:   Fri, 13 Nov 2020 15:02:10 +0100
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Paul McKenney <paulmck@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: [patch 03/19] irqstat: Get rid of nmi_count() and __IRQ_STAT()
References: <20201113140207.499353218@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Nothing uses this anymore.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irq_cpustat.h |    4 ----
 1 file changed, 4 deletions(-)

--- a/include/linux/irq_cpustat.h
+++ b/include/linux/irq_cpustat.h
@@ -19,10 +19,6 @@
 
 #ifndef __ARCH_IRQ_STAT
 DECLARE_PER_CPU_ALIGNED(irq_cpustat_t, irq_stat);	/* defined in asm/hardirq.h */
-#define __IRQ_STAT(cpu, member)	(per_cpu(irq_stat.member, cpu))
 #endif
 
-/* arch dependent irq_stat fields */
-#define nmi_count(cpu)		__IRQ_STAT((cpu), __nmi_count)	/* i386 */
-
 #endif	/* __irq_cpustat_h */

