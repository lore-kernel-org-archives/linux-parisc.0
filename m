Return-Path: <SRS0=9Rxp=OG=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A081AC43441
	for <linux-parisc@archiver.kernel.org>; Tue, 27 Nov 2018 10:34:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 721242133F
	for <linux-parisc@archiver.kernel.org>; Tue, 27 Nov 2018 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721242133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbeK0VcH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 27 Nov 2018 16:32:07 -0500
Received: from ozlabs.org ([203.11.71.1]:36893 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728840AbeK0VcH (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 27 Nov 2018 16:32:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.org (Postfix) with ESMTPSA id 4340X95kDkz9s29;
        Tue, 27 Nov 2018 21:34:33 +1100 (AEDT)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     "Dmitry V. Levin" <ldv@altlinux.org>,
        Andy Lutomirski <luto@kernel.org>,
        Eric Paris <eparis@redhat.com>,
        Paul Moore <paul@paul-moore.com>
Cc:     linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-hexagon@vger.kernel.org, x86@kernel.org,
        Eugene Syromyatnikov <esyr@redhat.com>,
        Elvira Khabirova <lineprinter@altlinux.org>,
        linux-snps-arc@lists.infradead.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
        linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
        Oleg Nesterov <oleg@redhat.com>, linux-audit@redhat.com,
        linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 16/15] syscall_get_arch: add "struct task_struct *" argument
In-Reply-To: <20181121004422.GA29053@altlinux.org>
References: <20181107042751.3b519062@akathisia> <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com> <20181120001128.GA11300@altlinux.org> <20181121004422.GA29053@altlinux.org>
Date:   Tue, 27 Nov 2018 21:34:29 +1100
Message-ID: <87in0ihkqy.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

"Dmitry V. Levin" <ldv@altlinux.org> writes:

> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index ab9f3f0a8637..d88b34179118 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -100,9 +100,15 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  		regs->orig_gpr3 = args[0];
>  }
>  
> -static inline int syscall_get_arch(void)
> +static inline int syscall_get_arch(struct task_struct *task)
>  {
> -	int arch = is_32bit_task() ? AUDIT_ARCH_PPC : AUDIT_ARCH_PPC64;
> +	int arch;
> +
> +	if (IS_ENABLED(CONFIG_PPC64) && !test_tsk_thread_flag(task, TIF_32BIT))
> +		arch = AUDIT_ARCH_PPC64;
> +	else
> +		arch = AUDIT_ARCH_PPC;
> +
>  #ifdef __LITTLE_ENDIAN__
>  	arch |= __AUDIT_ARCH_LE;
>  #endif

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

