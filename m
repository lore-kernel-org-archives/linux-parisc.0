Return-Path: <SRS0=ws7C=N3=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A4DC43610
	for <linux-parisc@archiver.kernel.org>; Fri, 16 Nov 2018 05:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 961DF208E7
	for <linux-parisc@archiver.kernel.org>; Fri, 16 Nov 2018 05:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Syjj3YNZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 961DF208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbeKPQCL (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 16 Nov 2018 11:02:11 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:54052 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbeKPQCK (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 16 Nov 2018 11:02:10 -0500
Received: by mail-it1-f195.google.com with SMTP id r12-v6so33116778ita.3
        for <linux-parisc@vger.kernel.org>; Thu, 15 Nov 2018 21:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nW3EhWjl3nwKPx5jiD+DbPlgA784/tSg49/9z9NhN8c=;
        b=Syjj3YNZF1vIoTt46N/37amlhJjWn8LO6zVMa4sxMy+aYkTrI4NAC4QmjaiyZiLwIX
         67ry3md62p9bMIkdcPJXeF+pHZ/UL1HH7yfVm5Izkl7fLFAnDJ3fynJ180Sx00oJU1nh
         rINi3TBLHUL0JaW96m3cEk2R2il3g/JrxII1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nW3EhWjl3nwKPx5jiD+DbPlgA784/tSg49/9z9NhN8c=;
        b=rlbSguH5OviAPj/0xsuXMUP45qNZATxzkL0ti06NmJmK7oC5S5y0fRRONBy+sDNA1r
         UQ9dbCbuakJL5qkIbDFQilY6YB6ePsUlr+WWV5BMmD0ZXrNQaq77+BHOYkL4HLW179Rz
         6c+EOq95tsvVs24B8BeaOKu0PFGEMJ9kg4nGSyiLqKhUdNXiJ5+1mmalkokZqFrUsPYS
         39sQPRW499rH1fTnk9MqW3B2bpXCHslvXwlGh+9hM4bPB6dWsIBeRZi+XaXxVUpVdQYr
         SLcO/yzzHag21A6a8FzBxlpCg/d13angGUShhdoj0FX4UGxa79PTlHC6z/UPDmRLVLbp
         Dljw==
X-Gm-Message-State: AGRZ1gIXMcKRjmWk7TxpChx87zk9RopMaIkh7ksbfkLcluMa6WYSP+7d
        p+Qy1IF2kIBm+U7IogvG9ejY7mLAts0Ju1M42dh2JA==
X-Google-Smtp-Source: AJdET5fMEMnorR9DJxN4hpea7g/umb/zqADdnBB4uR6Ev9RqQUjXKPV/yGQYFojurb3amtrXPIPdeiBJ4fEfZH9QK30=
X-Received: by 2002:a02:788:: with SMTP id f130-v6mr4990426jaf.58.1542347472739;
 Thu, 15 Nov 2018 21:51:12 -0800 (PST)
MIME-Version: 1.0
References: <1542177301-25844-1-git-send-email-firoz.khan@linaro.org> <58c3c4a4-7f55-bf08-1c96-ef1aa7f97072@gmx.de>
In-Reply-To: <58c3c4a4-7f55-bf08-1c96-ef1aa7f97072@gmx.de>
From:   Firoz Khan <firoz.khan@linaro.org>
Date:   Fri, 16 Nov 2018 11:21:01 +0530
Message-ID: <CALxhOngc1cSSDVznnX+iLg-Ne9+k0ct0wT-z0MXKSeKxJE3Vsg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] parisc: system call table generation support
To:     Helge Deller <deller@gmx.de>
Cc:     linux-parisc@vger.kernel.org,
        "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Fri, 16 Nov 2018 at 01:01, Helge Deller <deller@gmx.de> wrote:
>
> On 14.11.2018 07:34, Firoz Khan wrote:
> > The purpose of this patch series is, we can easily
> > add/modify/delete system call table support by cha-
> > nging entry in syscall.tbl file instead of manually
> > changing many files. The other goal is to unify the
> > system call table generation support implementation
> > across all the architectures.
> >
> > The system call tables are in different format in
> > all architecture. It will be difficult to manually
> > add, modify or delete the system calls in the resp-
> > ective files manually. To make it easy by keeping a
> > script and which'll generate uapi header file and
> > syscall table file.
> >
> > syscall.tbl contains the list of available system
> > calls along with system call number and correspond-
> > ing entry point. Add a new system call in this arch-
> > itecture will be possible by adding new entry in the
> > syscall.tbl file.
> >
> > Adding a new table entry consisting of:
> >         - System call number.
> >         - ABI.
> >         - System call name.
> >         - Entry point name.
> >
> > ARM, s390 and x86 architecuture does exist the sim-
> > ilar support. I leverage their implementation to
> > come up with a generic solution.
> >
> > I have done the same support for work for alpha, ia64,
> > m68k, microblaze, mips, powerpc, sh, sparc and xtensa.
> > Below mentioned git repository contains more details
> > about the workflow.
> >
> > https://github.com/frzkhn/system_call_table_generator/
> >
> > Finally, this is the ground work to solve the Y2038
> > issue. We need to add two dozen of system calls to
> > solve Y2038 issue. So this patch series will help to
> > add new system calls easily by adding new entry in
> > the syscall.tbl.
> >
> > changes since v6:
> >  - changed from generic-y to generated-y in Kbuild.
> >
> > changes since v5:
> >  - optimized/updated the syscall table generation
> >    scripts.
> >  - fixed all mixed indentation issues in syscall.tbl.
> >  - added "comments" in syscall_*.tbl.
> >
> > changes since v4:
> >  - optimized/updated the syscall table generation
> >    scripts.
> >  - removed __IGNORE entries which was added in v2
> >    to suppress the warning.
> >
> > changes since v3:
> >  - optimized/updated the syscall table generation
> >    scripts.
> >  - added missing new line.
> >
> > changes since v2:
> >  - updated the syscall.tbl file by including missed
> >    entries.
> >
> > changes since v1:
> >  - enclosed __NR_sycalls macro with __KERNEL__.
> >
> > Firoz Khan (5):
> >   parisc: move __IGNORE* entries to non uapi header
> >   parisc: add __NR_syscalls along with __NR_Linux_syscalls
> >   parisc: add system call table generation support
> >   parisc: generate uapi header and system call table files
> >   parisc: syscalls: ignore nfsservctl for other architectures
>
> Firoz, you may add
> Acked-by: Helge Deller <deller@gmx.de>
> to the whole parisc series.

Sure, will do.
I'm on a vacation right now. will send mid next week.

Thanks
Firoz

>
> Thanks!
> Helge
>
>
>
> >  arch/parisc/Makefile                      |   3 +
> >  arch/parisc/include/asm/Kbuild            |   3 +
> >  arch/parisc/include/asm/unistd.h          |   8 +
> >  arch/parisc/include/uapi/asm/Kbuild       |   2 +
> >  arch/parisc/include/uapi/asm/unistd.h     | 382 +------------------------
> >  arch/parisc/kernel/syscall.S              |  11 +-
> >  arch/parisc/kernel/syscall_table.S        | 459 ------------------------------
> >  arch/parisc/kernel/syscalls/Makefile      |  57 ++++
> >  arch/parisc/kernel/syscalls/syscall.tbl   | 369 ++++++++++++++++++++++++
> >  arch/parisc/kernel/syscalls/syscallhdr.sh |  36 +++
> >  arch/parisc/kernel/syscalls/syscalltbl.sh |  36 +++
> >  scripts/checksyscalls.sh                  |   1 +
> >  12 files changed, 531 insertions(+), 836 deletions(-)
> >  delete mode 100644 arch/parisc/kernel/syscall_table.S
> >  create mode 100644 arch/parisc/kernel/syscalls/Makefile
> >  create mode 100644 arch/parisc/kernel/syscalls/syscall.tbl
> >  create mode 100644 arch/parisc/kernel/syscalls/syscallhdr.sh
> >  create mode 100644 arch/parisc/kernel/syscalls/syscalltbl.sh
> >
>
