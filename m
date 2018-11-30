Return-Path: <SRS0=fqjw=OJ=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3560CC04EB8
	for <linux-parisc@archiver.kernel.org>; Fri, 30 Nov 2018 19:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2B1D206B7
	for <linux-parisc@archiver.kernel.org>; Fri, 30 Nov 2018 19:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I8Fg46pW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B1D206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbeLAG6z (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 1 Dec 2018 01:58:55 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:45934 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbeLAG6z (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 1 Dec 2018 01:58:55 -0500
Received: by mail-yw1-f65.google.com with SMTP id d190so2751883ywd.12
        for <linux-parisc@vger.kernel.org>; Fri, 30 Nov 2018 11:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3E5ypZi9u15LzkZGuetMKaF1vNObB4Qoh3u5pcX2eHU=;
        b=I8Fg46pW9GafH7S6FI1BxTW8kg4/jE/EiePj5221J0IZbqqpEPm23oolZg5rc3iR92
         U707V9EeP8rHzMq9ibg7n46tdEQxki5JNH6vSewl6Q/p7fWOLGZhQa9keSsodBbqi9M9
         uc5PAODb7mzYBEPYu2BulGn5MTCALX83UgbjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3E5ypZi9u15LzkZGuetMKaF1vNObB4Qoh3u5pcX2eHU=;
        b=rmhslu0APwI8DHE8VtaG/U2WBm55g9SLgJSKtHnPKvZw2cLPnfHf3X1igWugcuRAkm
         6rQSJ5jeF/Axnjc7APomxTwlWFzYWwDnie1hlsE49EBvu0q+69/UZswh9M6hsOVmo3Fr
         T6/PVcn0j8QxjSVY8JJmCGgM+mwajnlebAQPrXSUqdCk7EPcBdOBN0O5K0qBZsKAtuDg
         aknMMafrn71EvulabfqETikhDA7nQdwtdWFKYN+fySMPqoOzmU9csaI3vIZ/QgmG6SOm
         qF1XAZt8HQP0J88orToe0gLFFW+kg8KpzObyuzqF1qIigMYzx/f1oUk0jd6ADl03cNHK
         OUXQ==
X-Gm-Message-State: AA+aEWaTe+uzwYlHP4XTge2aTkgZGFjETWi9m+wZFJaSs04iXCrC1v0a
        p5rGVxtaH+CIKC+NdRIaWaGjisGIZbM=
X-Google-Smtp-Source: AFSGD/WzKdKGtnkVr55iPtMeOZCS811CJDiMBFi1dzFMcOw4iLMKcl4QGMLkfhGHMcjgZ3CYLCy9pw==
X-Received: by 2002:a81:a4d1:: with SMTP id b200mr6684547ywh.316.1543607312800;
        Fri, 30 Nov 2018 11:48:32 -0800 (PST)
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id z74sm3169203ywz.51.2018.11.30.11.48.32
        for <linux-parisc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Nov 2018 11:48:32 -0800 (PST)
Received: by mail-yw1-f50.google.com with SMTP id j6so2759035ywj.6
        for <linux-parisc@vger.kernel.org>; Fri, 30 Nov 2018 11:48:32 -0800 (PST)
X-Received: by 2002:a81:29cc:: with SMTP id p195mr7189809ywp.407.1543606828736;
 Fri, 30 Nov 2018 11:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
In-Reply-To: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Fri, 30 Nov 2018 11:40:17 -0800
X-Gmail-Original-Message-ID: <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
Message-ID: <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Amir Goldstein <amir73il@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Axtens <dja@axtens.net>,
        "David S. Miller" <davem@davemloft.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Eric Dumazet <edumazet@google.com>, federico.vaga@vaga.pv.it,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
        Joshua Kinard <kumba@gentoo.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        Linux mtd <linux-mtd@lists.infradead.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-scsi@vger.kernel.org, matthias.bgg@gmail.com,
        Network Development <netdev@vger.kernel.org>,
        nouveau <nouveau@lists.freedesktop.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Paul Burton <paul.burton@mips.com>,
        Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>,
        sean.wang@mediatek.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        shannon.nelson@oracle.com, Stefano Brivio <sbrivio@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Tobin C. Harding" <me@tobin.cc>, makita.toshiaki@lab.ntt.co.jp,
        Willem de Bruijn <willemb@google.com>,
        Yonghong Song <yhs@fb.com>, yanjun.zhu@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, Nov 30, 2018 at 11:27 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> In order to comply with the CoC, replace **** with a hug.

Heh. I support the replacement of the stronger language, but I find
"hug", "hugged", and "hugging" to be very weird replacements. Can we
bikeshed this to "heck", "hecked", and "hecking" (or "heckin" to
follow true Doggo meme style).

"This API is hugged" doesn't make any sense to me. "This API is
hecked" is better, or at least funnier (to me). "Hug this interface"
similarly makes no sense, but "Heck this interface" seems better.
"Don't touch my hecking code", "What the heck were they thinking?"
etc... "hug" is odd.

Better yet, since it's only 17 files, how about doing context-specific
changes? "This API is terrible", "Hateful interface", "Don't touch my
freakin' code", "What in the world were they thinking?" etc?

-Kees

>
> Jarkko Sakkinen (15):
>   MIPS: replace **** with a hug
>   Documentation: replace **** with a hug
>   drm/nouveau: replace **** with a hug
>   m68k: replace **** with a hug
>   parisc: replace **** with a hug
>   cpufreq: replace **** with a hug
>   ide: replace **** with a hug
>   media: replace **** with a hug
>   mtd: replace **** with a hug
>   net/sunhme: replace **** with a hug
>   scsi: replace **** with a hug
>   inotify: replace **** with a hug
>   irq: replace **** with a hug
>   lib: replace **** with a hug
>   net: replace **** with a hug
>
>  Documentation/kernel-hacking/locking.rst      |  2 +-
>  arch/m68k/include/asm/sun3ints.h              |  2 +-
>  arch/mips/pci/ops-bridge.c                    | 24 +++++++++----------
>  arch/mips/sgi-ip22/ip22-setup.c               |  2 +-
>  arch/parisc/kernel/sys_parisc.c               |  2 +-
>  drivers/cpufreq/powernow-k7.c                 |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  2 +-
>  .../nouveau/nvkm/subdev/pmu/fuc/macros.fuc    |  2 +-
>  drivers/ide/cmd640.c                          |  2 +-
>  drivers/media/i2c/bt819.c                     |  8 ++++---
>  drivers/mtd/mtd_blkdevs.c                     |  2 +-
>  drivers/net/ethernet/sun/sunhme.c             |  4 ++--
>  drivers/scsi/qlogicpti.h                      |  2 +-
>  fs/notify/inotify/inotify_user.c              |  2 +-
>  kernel/irq/timings.c                          |  2 +-
>  lib/vsprintf.c                                |  2 +-
>  net/core/skbuff.c                             |  2 +-
>  17 files changed, 33 insertions(+), 31 deletions(-)
>
> --
> 2.19.1
>


-- 
Kees Cook
