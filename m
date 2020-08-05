Return-Path: <SRS0=T+zw=BP=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01754C433E0
	for <linux-parisc@archiver.kernel.org>; Wed,  5 Aug 2020 06:05:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7BF122B45
	for <linux-parisc@archiver.kernel.org>; Wed,  5 Aug 2020 06:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596607504;
	bh=Dl+1+YNv+yS/sKl/RL8tFwsNeIdSQ+D0aFZGP/NRly0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=gdVtTxVTFIbGwFEdXBj/IWjOKThwVKCW/64U3n/LAGOd/FBAUnPcZg+nZF4lnTL/G
	 prHeCt2YdLs2k9+WlwyxtBQrCg5FMUVgbpHTfvO53K3co2cR12y9CU7w9RQE5HhOBx
	 vklfD6YBoOGEAR3hrYwsKjYhbbhZV1hIHZuQ1F/8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgHEGFE (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 5 Aug 2020 02:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgHEGFD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 5 Aug 2020 02:05:03 -0400
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596607503;
        bh=Dl+1+YNv+yS/sKl/RL8tFwsNeIdSQ+D0aFZGP/NRly0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=fZ0H7WbnY2mkAgDj0zJrDl6NS/0W9IM0LA8qvUdbQtoD/l69i8/NECcrVc/zkAnc4
         OdO3Pvq8mfTyMpMlrPIfbA2hZm+quSi4CnEeubIXooXfnoKupIwXhA0a07ACm9Hawo
         sfrafEjKtHZcO5ooq2nOLxsb9mLEunKkS+69TjfE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200804152024.GA2531@ls3530.fritz.box>
References: <20200804152024.GA2531@ls3530.fritz.box>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200804152024.GA2531@ls3530.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.9-1
X-PR-Tracked-Commit-Id: e2693ec1e0a12a6dc601e4dfe9b6f714b92f6954
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95ffa676583b23baed40861d30b65fe31397da00
Message-Id: <159660750346.19907.15816948457367455913.pr-tracker-bot@kernel.org>
Date:   Wed, 05 Aug 2020 06:05:03 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Tue, 4 Aug 2020 17:20:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.9-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95ffa676583b23baed40861d30b65fe31397da00

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
