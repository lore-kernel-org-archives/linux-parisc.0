Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771FBC2D0A3
	for <linux-parisc@archiver.kernel.org>; Mon, 16 Nov 2020 18:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 316B3222EC
	for <linux-parisc@archiver.kernel.org>; Mon, 16 Nov 2020 18:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731705AbgKPSTP (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 16 Nov 2020 13:19:15 -0500
Received: from foss.arm.com ([217.140.110.172]:44874 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730997AbgKPSTO (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 16 Nov 2020 13:19:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136FF31B;
        Mon, 16 Nov 2020 10:19:14 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681543F719;
        Mon, 16 Nov 2020 10:19:11 -0800 (PST)
References: <20201113140207.499353218@linutronix.de> <20201113141733.276505871@linutronix.de>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Paul McKenney <paulmck@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [patch 05/19] ARM: irqstat: Get rid of duplicated declaration
In-reply-to: <20201113141733.276505871@linutronix.de>
Date:   Mon, 16 Nov 2020 18:19:04 +0000
Message-ID: <jhjy2j1w4fb.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


On 13/11/20 14:02, Thomas Gleixner wrote:
> irq_cpustat_t is exactly the same as the asm-generic one. Define
> ack_bad_irq so the generic header does not emit the generic version of it.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
