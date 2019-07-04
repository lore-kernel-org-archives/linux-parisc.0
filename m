Return-Path: <SRS0=e3g5=VB=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0947C0651F
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Jul 2019 19:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81C062189E
	for <linux-parisc@archiver.kernel.org>; Thu,  4 Jul 2019 19:23:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfGDTX3 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 4 Jul 2019 15:23:29 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:49578 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726024AbfGDTX2 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 4 Jul 2019 15:23:28 -0400
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 4471B346E67;
        Thu,  4 Jul 2019 19:23:27 +0000 (UTC)
Date:   Thu, 4 Jul 2019 21:23:21 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Fix kernel panic due invalid values of IAOQ0 or
 IAOQ1
Message-ID: <20190704212321.42a00ebb@wim.jer>
In-Reply-To: <20190703063524.GA27797@ls3530.dellerweb.de>
References: <20190703063524.GA27797@ls3530.dellerweb.de>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 3 Jul 2019 08:35:24 +0200
Helge Deller <deller@gmx.de> wrote:

> On parisc the privilege level of a process is stored in the lowest
> two bits of the instruction pointers (IAOQ0 and IAOQ1). On Linux we
> use privilege level 0 for the kernel and privilege level 3 for
> user-space. So userspace should not be allowed to modify IAOQ0 or
> IAOQ1 of a ptraced process to change it's privilege level to e.g. 0
> to try to gain kernel privileges.
> 
> This patch prevents such modifications by always setting the two
> lowest bits to one (which relates to privilege level 3 for
> user-space) if IAOQ0 or IAOQ1 are modified via ptrace calls.
> 
> Fixes: https://bugs.gentoo.org/481768
> Reported-by: Jeroen Roovers <jer@gentoo.org>
> Cc: <stable@vger.kernel.org>
> 
> diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
> index a3d2fb4e6dd2..8ecd41938709 100644
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -167,6 +175,9 @@ long arch_ptrace(struct task_struct *child, long
> request, if ((addr & (sizeof(unsigned long)-1)) ||
>  		     addr >= sizeof(struct pt_regs))
>  			break;
> +		if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
> +			data |= 3; /* ensure userspace privilege */
> +		}
>  		if ((addr >= PT_GR1 && addr <= PT_GR31) ||
>  				addr == PT_IAOQ0 || addr == PT_IAOQ1
> || (addr >= PT_FR0 && addr <= PT_FR31 + 4) ||
> @@ -281,6 +292,9 @@ long compat_arch_ptrace(struct task_struct
> *child, compat_long_t request, addr = translate_usr_offset(addr);
>  			if (addr >= sizeof(struct pt_regs))
>  				break;
> +			if (addr == PT_IAOQ0 || addr == PT_IAOQ1) {
> +				data |= 3; /* ensure userspace
> privilege */
> +			}
>  			if (addr >= PT_FR0 && addr <= PT_FR31 + 4) {
>  				/* Special case, fp regs are 64 bits
> anyway */ *(__u64 *) ((char *) task_regs(child) + addr) = data;

That may fix some problem, but it sadly does not fix the problem
reported in https://bugs.gentoo.org/481768 . Both root and unprivileged
users can still trigger the same kernel panic with a kernel patches
thusly. How can we help you reproduce the issue?


Kind regards,
      jer
