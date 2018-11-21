Return-Path: <SRS0=iNii=OA=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7EEC43441
	for <linux-parisc@archiver.kernel.org>; Wed, 21 Nov 2018 15:47:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AD1721479
	for <linux-parisc@archiver.kernel.org>; Wed, 21 Nov 2018 15:47:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OwVpQ43C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AD1721479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731512AbeKVCWH (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 21 Nov 2018 21:22:07 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40007 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbeKVCWG (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Nov 2018 21:22:06 -0500
Received: by mail-pl1-f195.google.com with SMTP id b22-v6so6067462pls.7
        for <linux-parisc@vger.kernel.org>; Wed, 21 Nov 2018 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=U/lY5CfdHLl3xwIXaQIRba/GPl3Jxhihr4NwbiVFjPo=;
        b=OwVpQ43CSWic4u6uy8EiX4jKWC+6GbIh1hQ2uLHBOxn55J2QmK/J9y7M7VBuV57UnY
         K/Y6wWyqTxEs/+0mJvSl8oBTR6DdKAncImadulVokxekAe/3eCZLhsPDMsVBkEGmRTim
         VhMmMIQ9LawdPvEMc+/jfP0vfTT5sGMvpwgW7YjNSR91NsdRxsY5l6VfXtoiH6n1bQhs
         4YWv+W4y84c8A81ySRAZ1JpUgGb+HJc+cxmhCe3H5swS7n4mRu0Do2Lv9ndTy+WsWV05
         aZWRazf5kGQCMZ2XjKUVV87al9jhGC6U6i14pP/eWICsOqELVHsriFVZmXp6TenE+Gp4
         c6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=U/lY5CfdHLl3xwIXaQIRba/GPl3Jxhihr4NwbiVFjPo=;
        b=tEy90QLMmH3WMJZQqEpxyDM7u7Ba1H8ZgB0NWFHECoDi9Y7+fAF8H/x7UTUakoBwUB
         sHb5sog+R56MDx7BT+SNodx2sbWIkoW31bMU6a943pZQOA3t4hHjrpIFU2CHL16mshIB
         +iW19t8Ji5JXbMm9d4ZAGngK21OUOCX69HOtFah/A1qq5zn3uOQ7Ck2X7F87S/LbcDgX
         EG3kOn90fHp0iX+pH3cnF9IUMR6J8p/SFjRuWK7kr5FHQLzqcHy9QkLw6tJpIGSmG4M+
         lLaobKxjhTWURYRVGCEnNd/QwOjMh45xpQkaAVRvFttBoxg1R9NCV44Soc6FI/+ZNErU
         OLbg==
X-Gm-Message-State: AA+aEWb6MDGVaPogF5LHA37sc6ci35iq/MClyljQlyOJuhjpvZESxWdv
        W+agDOcpeisDqhipUC4ZPcQGpA==
X-Google-Smtp-Source: AFSGD/UAi/NJ3PgiFeWjX4A041/WQ8nt8aNRCdGUah1xwxILNe5t4KPPa+Rg/oymu/oVkz81KUiVUQ==
X-Received: by 2002:a63:7f4f:: with SMTP id p15mr6498437pgn.296.1542815228599;
        Wed, 21 Nov 2018 07:47:08 -0800 (PST)
Received: from localhost ([12.206.222.5])
        by smtp.gmail.com with ESMTPSA id r6sm65610040pgk.91.2018.11.21.07.47.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Nov 2018 07:47:07 -0800 (PST)
Date:   Wed, 21 Nov 2018 07:47:07 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 07:44:37 PST (-0800)
Subject:     Re: [PATCH v2 16/15] syscall_get_arch: add "struct task_struct *" argument
In-Reply-To: <20181121004422.GA29053@altlinux.org>
CC:     luto@kernel.org, eparis@redhat.com, paul@paul-moore.com,
        linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
        linux-hexagon@vger.kernel.org, x86@kernel.org, esyr@redhat.com,
        lineprinter@altlinux.org, linux-snps-arc@lists.infradead.org,
        uclinux-h8-devel@lists.sourceforge.jp,
        linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
        linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
        oleg@redhat.com, linux-audit@redhat.com,
        linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org,
        linuxppc-dev@lists.ozlabs.org
From:   Palmer Dabbelt <palmer@sifive.com>
To:     ldv@altlinux.org
Message-ID: <mhng-c75e14b8-b36c-46c2-8ffc-914312ed0cef@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, 20 Nov 2018 16:44:22 PST (-0800), ldv@altlinux.org wrote:
> This argument is required to extend the generic ptrace API
> with PTRACE_GET_SYSCALL_INFO request: syscall_get_arch() is going to be
> called from ptrace_request() along with other syscall_get_* functions
> with a tracee as their argument.
>
> This change partially reverts commit 5e937a9ae913 ("syscall_get_arch:
> remove useless function arguments").
>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-audit@redhat.com
> Cc: linux-c6x-dev@linux-c6x.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: nios2-dev@lists.rocketboards.org
> Cc: openrisc@lists.librecores.org
> Cc: sparclinux@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: x86@kernel.org
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
