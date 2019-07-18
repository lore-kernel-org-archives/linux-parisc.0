Return-Path: <SRS0=cOtw=VP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0882C7618F
	for <linux-parisc@archiver.kernel.org>; Thu, 18 Jul 2019 19:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C74521849
	for <linux-parisc@archiver.kernel.org>; Thu, 18 Jul 2019 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563478204;
	bh=fMZBP5ZAYUKc/EE2UfzDFaxXQyvd7bukvXQ/dK2B3AQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=1UNojbBC7hcI+ikXMaYTEaYN9qKeLA36ZW3d6KZ72uwqZCEtOm06KFszrTUQj18iM
	 x5tcrIsSWhB5J776ulGlUgVRpHNSL93VBzY5MP15I9ew8xifBa7JmDBeiTKcjVgBt+
	 9h8wr8oZ1F+UoFBMRF7Dq30WZRhMi34RFfG/OddQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbfGRTaE (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 18 Jul 2019 15:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:38652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbfGRTaE (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 18 Jul 2019 15:30:04 -0400
Subject: Re: [GIT PULL] parisc architecture fixes for kernel v5.3-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563478203;
        bh=fMZBP5ZAYUKc/EE2UfzDFaxXQyvd7bukvXQ/dK2B3AQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=PXrq6l502ZMV1UYYhIFvbSDPgOA9MKHs/RHFr8EqMuWkFeLJT8HOs5wMtaTQp+QXt
         x0ZOAITswz7MZDWK6hfaR4CkywkvVybBpXq2asSfq7Kw3peIJrdrzqg8a/J8Pl7Ak8
         QpFLoMwOMubp+Eovu9tDwYIM25Wtt0LxkID/7aNc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190718090241.GA14685@ls3530>
References: <20190718090241.GA14685@ls3530>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190718090241.GA14685@ls3530>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.3-2
X-PR-Tracked-Commit-Id: 45800fb45139284f0db4f5ac7fbbf5dad81e4172
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e2a5b5bd9a6aaec85df347dd71432a1d2d10763
Message-Id: <156347820317.4271.2755670423170364499.pr-tracker-bot@kernel.org>
Date:   Thu, 18 Jul 2019 19:30:03 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Thu, 18 Jul 2019 11:02:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e2a5b5bd9a6aaec85df347dd71432a1d2d10763

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
