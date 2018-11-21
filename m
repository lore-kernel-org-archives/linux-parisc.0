Return-Path: <SRS0=iNii=OA=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EE5C43441
	for <linux-parisc@archiver.kernel.org>; Wed, 21 Nov 2018 15:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBDBC21731
	for <linux-parisc@archiver.kernel.org>; Wed, 21 Nov 2018 15:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="khcwjnN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDBC21731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbeKVBuV (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 21 Nov 2018 20:50:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:50626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731166AbeKVBuU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 21 Nov 2018 20:50:20 -0500
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FECD223D8
        for <linux-parisc@vger.kernel.org>; Wed, 21 Nov 2018 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542813329;
        bh=kpH9lcQ8P8XV+NLvUJEbt/IT04dFbPXjvuI1ObcBYAw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=khcwjnN3W8oiolVzWdkYwOXyQRAs6P6ySgIXzjCPjOfIH1gHQVWNjJgtidXHIgPRn
         CwCuMol6mW0iA++aIbUocbisf9NKWSLOFkbGX1rEZ7ryIkIhgsKBtW6vWIB93TttT3
         WJlKpw3MsAUNHkwWqZMq8hXPUuneSjETHOFSDLJU=
Received: by mail-wm1-f45.google.com with SMTP id w7-v6so5874185wmc.1
        for <linux-parisc@vger.kernel.org>; Wed, 21 Nov 2018 07:15:29 -0800 (PST)
X-Gm-Message-State: AGRZ1gKIkIcTVhr3RnxJJlWAkNoTPhj2Kw0d8iozeLtxGAgbcAuWila2
        Hq9OP1EFHHlgiQweX9YWVLYsRCa/mmwq6mkx6hHdHw==
X-Google-Smtp-Source: AJdET5fCl28jWGxXnQdRFKVSpliKHyZtnaunTTizhHy0FVmzumF0Lqgw2R8mpyFkm2xs/3yb8DPm2VruOfQ2rmi5vtI=
X-Received: by 2002:a1c:f112:: with SMTP id p18mr5957608wmh.83.1542813327926;
 Wed, 21 Nov 2018 07:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20181107042751.3b519062@akathisia> <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
 <20181120001128.GA11300@altlinux.org> <20181121004422.GA29053@altlinux.org>
In-Reply-To: <20181121004422.GA29053@altlinux.org>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Wed, 21 Nov 2018 07:15:15 -0800
X-Gmail-Original-Message-ID: <CALCETrV8AJPkZF7TzhXSte_wJgNXH+-s7-tPM-8xjcAfYgzdhg@mail.gmail.com>
Message-ID: <CALCETrV8AJPkZF7TzhXSte_wJgNXH+-s7-tPM-8xjcAfYgzdhg@mail.gmail.com>
Subject: Re: [PATCH v2 16/15] syscall_get_arch: add "struct task_struct *" argument
To:     "Dmitry V. Levin" <ldv@altlinux.org>
Cc:     Andrew Lutomirski <luto@kernel.org>,
        Eric Paris <eparis@redhat.com>,
        Paul Moore <paul@paul-moore.com>,
        Elvira Khabirova <lineprinter@altlinux.org>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>, linux-audit@redhat.com,
        linux-alpha@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-sh@vger.kernel.org,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org,
        sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Tue, Nov 20, 2018 at 4:44 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> This argument is required to extend the generic ptrace API
> with PTRACE_GET_SYSCALL_INFO request: syscall_get_arch() is going to be
> called from ptrace_request() along with other syscall_get_* functions
> with a tracee as their argument.
>
> This change partially reverts commit 5e937a9ae913 ("syscall_get_arch:
> remove useless function arguments").
>

Reviewed-by: Andy Lutomirski <luto@kernel.org> # for x86
