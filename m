Return-Path: <SRS0=dORc=N6=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DD7C43441
	for <linux-parisc@archiver.kernel.org>; Mon, 19 Nov 2018 05:21:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3E4E20817
	for <linux-parisc@archiver.kernel.org>; Mon, 19 Nov 2018 05:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5MpCRrR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3E4E20817
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbeKSPnj (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 19 Nov 2018 10:43:39 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:39632 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbeKSPnj (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 19 Nov 2018 10:43:39 -0500
Received: by mail-it1-f195.google.com with SMTP id m15so5741054itl.4
        for <linux-parisc@vger.kernel.org>; Sun, 18 Nov 2018 21:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ONgEdGayxNnyo0orD42muf3UoIznewYIaD9QLvpQwB8=;
        b=D5MpCRrRCju8vSIPkQwuLYybswQjUWlxpBr+xanrLwSzlU1KgR4pb2lWLjRzeXzm0I
         fdidIDY2zD1lN71Jj8I7NZoWgamlHW7iQObGsejkb+oc0/TkNwzq5oomdxf7IuGj1r2Q
         isez5gEY3v6wBA7FY3waCIUVGAAtDAmfIvNyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONgEdGayxNnyo0orD42muf3UoIznewYIaD9QLvpQwB8=;
        b=cBCVhSQl0Qqu1SIpuC9BEXUhA2urizsJ9pNkwPXLgi47BZVQBMExQ+8fIS0LyRrVux
         Hdl1ET2/kcWS4Wco1VhJdcbvIo2YEZFBPuUextJLneKAfQ48IHG2XpmtwduAgduejoOH
         24jt118HBI1u102pGY2+bLuPh6av6fogu+LVZxFD5gIwEK3QJiCluulcjpe/+2gJZt4z
         1NSqTu8JTcV3wgJU4m22VLB6IAt1aV4bN+cTdry4CErMfNpKyg19xw69j71nyNlVLbxF
         7ipxm68FR1avLzglql2JvLPmMF8+tqdyap3nb1DnW/7WIzpYfLAUGvNNjUBh7v6AFP9l
         PdwA==
X-Gm-Message-State: AGRZ1gKSh/cr0JtUK7PRRLo9QnaaBvLn1dfPw34lj8CTJrCsYaIW2Bce
        pt5WjmUbl7tmCihMxiz88OSiRVV85VXw47Ncwi9I/w==
X-Google-Smtp-Source: AJdET5fCp0wULnKHKRNf1EdY+IRsNi88G8qpmMkQleFBVcv7lDfH3tVhbngmy2WR0Xx5+sWwyYvWQTIcaehgmvyk440=
X-Received: by 2002:a24:b009:: with SMTP id d9-v6mr6609355itf.166.1542604869910;
 Sun, 18 Nov 2018 21:21:09 -0800 (PST)
MIME-Version: 1.0
References: <1542177301-25844-1-git-send-email-firoz.khan@linaro.org>
 <58c3c4a4-7f55-bf08-1c96-ef1aa7f97072@gmx.de> <CALxhOngc1cSSDVznnX+iLg-Ne9+k0ct0wT-z0MXKSeKxJE3Vsg@mail.gmail.com>
 <20181116215502.GA6585@ls3530.dellerweb.de> <CAK8P3a2g-7iR594Fs_goYCYPqgO6FRML5oi9vodDC_wKHF64bA@mail.gmail.com>
 <20181117162623.GA14763@ls3530.dellerweb.de>
In-Reply-To: <20181117162623.GA14763@ls3530.dellerweb.de>
From:   Firoz Khan <firoz.khan@linaro.org>
Date:   Mon, 19 Nov 2018 10:51:00 +0530
Message-ID: <CALxhOnjgnn-5LYndwZDJU=_C_RKOCWw6+qyrASedL0XM7GhLMQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] parisc: system call table generation support
To:     Helge Deller <deller@gmx.de>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org,
        James.Bottomley@hansenpartnership.com, dave.anglin@bell.net,
        "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Helge,

On Sat, 17 Nov 2018 at 22:01, Helge Deller <deller@gmx.de> wrote:
>
> * Arnd Bergmann <arnd@arndb.de>:
> > On Fri, Nov 16, 2018 at 1:55 PM Helge Deller <deller@gmx.de> wrote:
> > > > On Fri, 16 Nov 2018 at 01:01, Helge Deller <deller@gmx.de> wrote:
> > > > >
> > > > > On 14.11.2018 07:34, Firoz Khan wrote:
> > > > > > The purpose of this patch series is, we can easily
> > > > > > add/modify/delete system call table support by cha-
> > > > > > nging entry in syscall.tbl file instead of manually
> > > > > > changing many files. The other goal is to unify the
> > > > > > system call table generation support implementation
> > > > > > across all the architectures.
> > > > > >
> > > > > > The system call tables are in different format in
> > > > > > all architecture. It will be difficult to manually
> > > > > > add, modify or delete the system calls in the resp-
> > > > > > ective files manually. To make it easy by keeping a
> > > > > > script and which'll generate uapi header file and
> > > > > > syscall table file.
> > > > > >
> > > > > > syscall.tbl contains the list of available system
> > > > > > calls along with system call number and correspond-
> > > > > > ing entry point. Add a new system call in this arch-
> > > > > > itecture will be possible by adding new entry in the
> > > > > > syscall.tbl file.
> > > > > >
> > > > > > Adding a new table entry consisting of:
> > > > > >         - System call number.
> > > > > >         - ABI.
> > > > > >         - System call name.
> > > > > >         - Entry point name.
> > > > > >
> > > > > > ....
> > > > > > Firoz Khan (5):
> > > > > >   parisc: move __IGNORE* entries to non uapi header
> > > > > >   parisc: add __NR_syscalls along with __NR_Linux_syscalls
> > > > > >   parisc: add system call table generation support
> > > > > >   parisc: generate uapi header and system call table files
> > > > > >   parisc: syscalls: ignore nfsservctl for other architectures
> > > > >
> > > > > Firoz, you may add
> > > > > Acked-by: Helge Deller <deller@gmx.de>
> > > > > to the whole parisc series.
> > > >
> > > > Sure, will do.
> > > > I'm on a vacation right now. will send mid next week.
> > >
> > > That's ok, there is no urgency.
> > >
> > > Actually, I noticed that the generated files unistd_32.h
> > > and unistd_64.h do have the same contents, since on parisc
> > > we keep the syscall numbers the same for 32- and 64-bit.
> > > With that in mind, we can simply generate on unistd.h
> > > file for both variants.
> >
> > It depends on what we want to do in the future. When we add
> > around 20 new system calls fro y2038, my plan was to
> > only add them for 32-bit architectures, leaving holes on
> > 64-bit ones.
>
> Ok, I didn't thought of that.
>
> > We can also assign the new numbers on parisc64 but they would have the
> > same entry point as existing calls.
>
> > If you prefer doing it like that, your patch seems fine for that,
> > it's just slightly inconsistent with the other 64-bit architectures
> > then.
>
> I really prefer to stay in sync with other major architectures.
> So, please drop my last patch.
>
> Instead please apply only the next one, which drops the NR_Linux
> offset value (which is 0 anyway).

This can be easily done. FYI, our intention is the generated file must be
same as the old one. That's why I kept the offset as it is. I can add
one extra patch to remove NR_Linux.

>
> Thanks,
> Helge
>
>
> diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
> index 6e31f58ad6b5..98dc953656af 100644
> --- a/arch/parisc/include/uapi/asm/unistd.h
> +++ b/arch/parisc/include/uapi/asm/unistd.h
> @@ -2,7 +2,6 @@
>  #ifndef _UAPI_ASM_PARISC_UNISTD_H_
>  #define _UAPI_ASM_PARISC_UNISTD_H_
>
> -#define __NR_Linux             0
>  #ifdef __LP64__
>  #include <asm/unistd_64.h>
>  #else
> diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/syscalls/Makefile
> index defa8878f6d2..4dcc5c9ae7f2 100644
> --- a/arch/parisc/kernel/syscalls/Makefile
> +++ b/arch/parisc/kernel/syscalls/Makefile
> @@ -12,22 +12,18 @@ systbl := $(srctree)/$(src)/syscalltbl.sh
>  quiet_cmd_syshdr = SYSHDR  $@
>        cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'       \
>                    '$(syshdr_abis_$(basetarget))'               \
> -                  '$(syshdr_pfx_$(basetarget))'                \
> -                  '$(syshdr_offset_$(basetarget))'
> +                  '$(syshdr_pfx_$(basetarget))'
>
>  quiet_cmd_systbl = SYSTBL  $@
>        cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'       \
>                    '$(systbl_abis_$(basetarget))'               \
> -                  '$(systbl_abi_$(basetarget))'                \
> -                  '$(systbl_offset_$(basetarget))'
> +                  '$(systbl_abi_$(basetarget))'
>
>  syshdr_abis_unistd_32 := common,32
> -syshdr_offset_unistd_32 := __NR_Linux

I'll remove this line

>  $(uapi)/unistd_32.h: $(syscall) $(syshdr)
>         $(call if_changed,syshdr)
>
>  syshdr_abis_unistd_64 := common,64
> -syshdr_offset_unistd_64 := __NR_Linux

And this one too. rest of the files will be the same w.r.t v7.

Thanks
Firoz

>  $(uapi)/unistd_64.h: $(syscall) $(syshdr)
>         $(call if_changed,syshdr)
>
