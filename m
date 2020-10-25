Return-Path: <SRS0=/3ve=EA=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4179C388F7
	for <linux-parisc@archiver.kernel.org>; Sun, 25 Oct 2020 18:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF76E22269
	for <linux-parisc@archiver.kernel.org>; Sun, 25 Oct 2020 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603650948;
	bh=dJWbZYLn6h+XsoQLy4KQW7Fm3FFxPynkM9L/zsyf7FA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=cWfXWumsuoFgObx4YMWxmhszxYUg19701b4a1P82Ti+WcTbxpULnl0glWYa72DkTe
	 BMBuBdwT8XQSC0aUJos29j1HhT6jajALCjR1pDPhLJ5IifDtcYp6hur65M/PyHm5EH
	 VrRG/ee7fRS+8WMsGFLRKTLNitEUaWvtGevYXKXI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418151AbgJYSfZ (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 25 Oct 2020 14:35:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1418141AbgJYSfX (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 25 Oct 2020 14:35:23 -0400
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603650923;
        bh=dJWbZYLn6h+XsoQLy4KQW7Fm3FFxPynkM9L/zsyf7FA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=UaPv1OKpQqeIASg9ZEbpKLg37H/WY8ln3wZys/NpC096Mmv2P6aHAH3foFyrqFvpU
         qlWpu1eZJM0iLigUAkd1EV6UKP4ks1BQlQlCDToj9sUQIqq4cJCsMUQxP50ixSB0Aj
         1W6VxIftxi686mKpjF4K3H20iraz8djCLhNIXBiU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201025120747.GA6138@ls3530.fritz.box>
References: <20201025120747.GA6138@ls3530.fritz.box>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201025120747.GA6138@ls3530.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.10-2
X-PR-Tracked-Commit-Id: 2e34ae02a9b49d1f459d811ae77d72d300584a69
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9c25d98645ec4af00c01a70681d2d4ab71622d0
Message-Id: <160365092302.20889.10651445384677632055.pr-tracker-bot@kernel.org>
Date:   Sun, 25 Oct 2020 18:35:23 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Sun, 25 Oct 2020 13:07:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9c25d98645ec4af00c01a70681d2d4ab71622d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
