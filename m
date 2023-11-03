Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2194EC4332F
	for <linux-parisc@archiver.kernel.org>; Fri,  3 Nov 2023 12:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjKCMyP (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 3 Nov 2023 08:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjKCMyP (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 3 Nov 2023 08:54:15 -0400
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D287134
        for <linux-parisc@vger.kernel.org>; Fri,  3 Nov 2023 05:54:12 -0700 (PDT)
References: <87lebjz9z6.fsf@gentoo.org>
User-agent: mu4e 1.10.7; emacs 30.0.50
From:   Sam James <sam@gentoo.org>
To:     Sam James <sam@gentoo.org>
Cc:     "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Subject: Re: prctl call wrongly succeeds on HPPA?
Date:   Fri, 03 Nov 2023 12:53:43 +0000
Organization: Gentoo
In-reply-to: <87lebjz9z6.fsf@gentoo.org>
Message-ID: <875y2jro9a.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org


Sam James <sam@gentoo.org> writes:

> I recently hit an issue with systemd-254 which tries to use the new
> prctl(PR_SET_MDWE) for systemd's MemoryDenyWriteExecute functionality.
>
> On HPPA, we still need executable stacks, so this option doesn't work
> and leads to a segfault on boot.
>
> Should this call be succeeeding on HPPA, or should we reject it for
> now until we have things wired up?
>
> Reported to systemd at https://github.com/systemd/systemd/issues/29775.

Lennart has made clear (and I don't think I disagree) that he considers
this squarely a kernel bug.

>
> thanks,
> sam

