Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9C2EB64DA
	for <linux-parisc@archiver.kernel.org>; Wed,  5 Jul 2023 18:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjGEScE (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 5 Jul 2023 14:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGEScE (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Jul 2023 14:32:04 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD119119;
        Wed,  5 Jul 2023 11:32:02 -0700 (PDT)
References: <ZKUZFS4CGOHNJR1S@p100>
User-agent: mu4e 1.10.4; emacs 29.0.92
From:   Sam James <sam@gentoo.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Subject: Re: [GIT PULL] more parisc architecture fixes & updates for v6.5-rc1
Date:   Wed, 05 Jul 2023 19:31:00 +0100
In-reply-to: <ZKUZFS4CGOHNJR1S@p100>
Message-ID: <87cz16dxb6.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Helge Deller <deller@gmx.de> writes:

> Hi Linus,
>
> please pull a second round of fixes for the parisc architecture for kernel 6.5-rc1.
>
> This fixes all outstanding compiler warnings when compiled with W=1 in
> the arch/parisc/ and drivers/parisc/ directories.

It should be fine for now, but I think we need to do something about the
-Wno-implicit-int and -Wno-implicit-function-declaration. Newer
compilers are starting to ban these and may well remove the ability to
disable the errors entirely (Clang is planning on this at least - I know
we don't have LLVM on HPPA, but still).
