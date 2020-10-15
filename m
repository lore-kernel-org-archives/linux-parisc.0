Return-Path: <SRS0=imLG=DW=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0510FC433E7
	for <linux-parisc@archiver.kernel.org>; Thu, 15 Oct 2020 23:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A39B3207C4
	for <linux-parisc@archiver.kernel.org>; Thu, 15 Oct 2020 23:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602803319;
	bh=WqQ0bB+ppe48oqRSyaUgLPUbMiAC3Z+q0QDdxMG8+CA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=UokqtQiGAZW1LiqHR49gUVi8cKZeFZsIrs6Z0H6wb8aFl3vaM7JUEAteKlvsZq6C7
	 YlrEm5gNHLsx4alIzbThZHF4lM6RS6hA9e+UsD9f7JoU/YN0LnmricQl0LVN9YnAtj
	 srKq+B8p/nhoTqSzjnzZ7rNQ3rHz8cZLU2rqlFCg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732501AbgJOXIe (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 15 Oct 2020 19:08:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732395AbgJOXIe (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 15 Oct 2020 19:08:34 -0400
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602803313;
        bh=WqQ0bB+ppe48oqRSyaUgLPUbMiAC3Z+q0QDdxMG8+CA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1djlJORgOVkKRGJ/P1n31pimVOxCL9aCZTQPWwAZzOBOQqcjfZbHcwA5d4rnH5e1z
         bMApgcP8cdFG9GbDVizXQ3bL+GIF6YscSt+8RpjL7YJ8ZKwnMXUMzC98rCOhV67U/Y
         bezJXlHt2Y1mc52CWvTOBHX+rA5pXonPkU+XotjA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201015072025.GA18655@ls3530.fritz.box>
References: <20201015072025.GA18655@ls3530.fritz.box>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201015072025.GA18655@ls3530.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.10-1
X-PR-Tracked-Commit-Id: 7ff3f14ddc355bfbc94c766f43b90606b1f79e83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7286d2a37eb955c5eeec2b042844f1c1b3ff0fe1
Message-Id: <160280331378.7173.14528913365089023034.pr-tracker-bot@kernel.org>
Date:   Thu, 15 Oct 2020 23:08:33 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Thu, 15 Oct 2020 09:20:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.10-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7286d2a37eb955c5eeec2b042844f1c1b3ff0fe1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
