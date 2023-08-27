Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43C8C83F10
	for <linux-parisc@archiver.kernel.org>; Sun, 27 Aug 2023 21:25:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjH0VYe (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 27 Aug 2023 17:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjH0VYS (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 27 Aug 2023 17:24:18 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0878CEB
        for <linux-parisc@vger.kernel.org>; Sun, 27 Aug 2023 14:24:16 -0700 (PDT)
References: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
User-agent: mu4e 1.10.6; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     Vidra.Jonas@seznam.cz
Cc:     linux-parisc@vger.kernel.org
Subject: Re: Possible io_uring bug in PA-RISC kernel 6.1.46
Date:   Sun, 27 Aug 2023 22:23:02 +0100
Organization: Gentoo
In-reply-to: <520.NvTX.6mXZpmfh4Ju.1awpAS@seznam.cz>
Message-ID: <87jztggow5.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


<Vidra.Jonas@seznam.cz> writes:

> Hello,
>
> on my C8000 workstation, I'm getting libuv aborts connected to io_uring
> usage. I'm not sure whether this is a libuv bug or a kernel one, but
> since libuv is pretty well tested on other archs, it's probably a
> PA-RISC issue. I've encountered the problem in kernel versions 6.1.41
> and 6.1.46. 6.1.4 seemed fine, but I updated other system packages in
> the meantime, so I can't be sure.
>
> The issue is that a call to
> `io_uring_enter(fd, 2, 2, IORING_ENTER_GETEVENTS)`
> returns 0, and libuv reacts to that by aborting, probably on this line:
> https://github.com/libuv/libuv/blob/65dc822d6c20a9130fa100c7b46d751f8cf4d233/src/unix/linux.c#L1252
> (I'm saying probably, because gdb seems to be buggy on my machine and I
> don't really trust its output, so I rely on strace instead, but that
> doesn't support backtraces on the PA-RISC.)

* elfutils needs me to finish off the port - I have some old patches
rebased.

* I wasn't aware of libunwind being broken (you mentioned it on IRC)
though.

* Can you file a bug for your gdb issue at
  https://sourceware.org/bugzilla? so far I've tried and I can't
  reproduce any problems with it



