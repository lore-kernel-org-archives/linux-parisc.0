Return-Path: <SRS0=0R8f=SI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C5C10F06
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 21:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74D3B2171F
	for <linux-parisc@archiver.kernel.org>; Sat,  6 Apr 2019 21:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554584702;
	bh=ne8l2wmlw8Lui4EcWDSevTjQ0I1vC+XbeAHf2HvZm4s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=HguIYR0L/vtvJd/wMqQ1vLBCQyGJZ86knpVIm/HUrQZPfIYvlx26pvt6kNUPXSjHC
	 za7bZfNZJXEbon+gu2P9ppzZ6/b9lfer8HTDn53kHl86zO8ZafNVL78jIZnqKv6xO3
	 Kra9zr/PAx/VgAxo6RukFSBfrzR+rdxoXGgWL8WQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfDFVFC (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 6 Apr 2019 17:05:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:57402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfDFVFB (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 6 Apr 2019 17:05:01 -0400
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554584701;
        bh=ne8l2wmlw8Lui4EcWDSevTjQ0I1vC+XbeAHf2HvZm4s=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=TC0K4xVeG/5Ruhw7SPo7fp7HJMxAJtxFliKTrcA0tJr3WJpnQUX7A+Pp0NnA5OlZC
         JNswebOjDWWaX5G1JNE+SUTVARZpaG0UWPn1WZ0mjeG3t7hEk3jh65wqGtk1t2jG/t
         NFTvmu0GEqKC18G34atPjqUP3MGs4qUBrcePqFzI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190406202932.GA24886@ls3530.dellerweb.de>
References: <20190406202932.GA24886@ls3530.dellerweb.de>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190406202932.GA24886@ls3530.dellerweb.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.1-2
X-PR-Tracked-Commit-Id: d006e95b5561f708d0385e9677ffe2c46f2ae345
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 373c392508577b24e293ff4994e919087fed2495
Message-Id: <155458470129.32567.17140719010864515644.pr-tracker-bot@kernel.org>
Date:   Sat, 06 Apr 2019 21:05:01 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Sat, 6 Apr 2019 22:29:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/373c392508577b24e293ff4994e919087fed2495

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
