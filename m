Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838BFC433B4
	for <linux-parisc@archiver.kernel.org>; Mon,  3 May 2021 20:52:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B5306135F
	for <linux-parisc@archiver.kernel.org>; Mon,  3 May 2021 20:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbhECUxG (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 3 May 2021 16:53:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhECUxG (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 3 May 2021 16:53:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 664D161283;
        Mon,  3 May 2021 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620075132;
        bh=LHVbHuzGWuuufDzISjgxEBRWIIWoIkWOY9wW4wVLoGA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=EM8xgZ2dMo+mZ6JzrI1M8+bzGI6X4DWOqM65V/Cl2SPAo1BY6xgbF9Fchfbx+4mUL
         Zp/Dqv8bc8LMIFmTEIQCj5XFLnws+aiSPeUvmiFL9stL9ux/QwDSYpPE8D+yap4oLP
         V7IJqlMGpSsqUOllDXOO1BllN9NQ1w/GJtN5mlS2R//QFYzUQC8y+pvZVB4d/+VgaW
         ArxjkHOPNGxfVXNUzmcFpdNIiCQvZui/RB5CqSaOJaiXX0dy2bgCGSvf8lij9YnDvU
         XO9PcjI673zsOCmDYgr1LfHwS/8ko3PXM/z2pTmy9vAmh1IUQdzbaoGYFoFG8j+WyN
         zmNVWKlh9HICg==
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.13-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YJBg7V02gxIRPrDx@ls3530>
References: <YJBg7V02gxIRPrDx@ls3530>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <YJBg7V02gxIRPrDx@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/for-5.13/parisc
X-PR-Tracked-Commit-Id: 127f1c09c5c84800761cf650b4c4f0a312f569ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5e321ded302da4d8c5d5dd953423d9b748ab3775
Message-Id: <162007513228.8589.15875537284291034351.pr-tracker-bot@kernel.org>
Date:   Mon, 03 May 2021 20:52:12 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Mon, 3 May 2021 22:45:33 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/for-5.13/parisc

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5e321ded302da4d8c5d5dd953423d9b748ab3775

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
