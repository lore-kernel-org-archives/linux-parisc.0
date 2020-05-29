Return-Path: <SRS0=9LLW=7L=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD96C433DF
	for <linux-parisc@archiver.kernel.org>; Fri, 29 May 2020 21:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1C2208B8
	for <linux-parisc@archiver.kernel.org>; Fri, 29 May 2020 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590786603;
	bh=6Q/a8vvq79EGQxyizh8jekOiOwJLqM9kojIXlSrNFqM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=o9wcJ0Y+1Ah2KWK8pXJ5lBKqOfPnuQYIPUaKWoUriyQ3h3PU2eMTBD7MQmAKSLlXo
	 9ww7Ea5ZK+LPzyJ/+FS4FurvwI7byGEUVqdxjC6UABTcuf6wtsdnJFVwUFVseni3X7
	 rPHyqO56fCWkMGZ5bMDUOCEm+iQYIyukdkeJp4Tc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgE2VKD (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 29 May 2020 17:10:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:33506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgE2VKC (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 29 May 2020 17:10:02 -0400
Subject: Re: [GIT PULL] parisc architecture fix for kernel v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590786602;
        bh=6Q/a8vvq79EGQxyizh8jekOiOwJLqM9kojIXlSrNFqM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=J2hS/8GOJv3LBb5v/z08diL/AnwLFiQJmZ5fZHz0IUSnDKG6r+TVbDFqgMY7aukrh
         Fw6m2LJ2WDIfAriFo00dzc5VNWnONGvwwHuTM/XXxEChxVLAhfB/ahov7WdAIVumyc
         PQ9g7M5XT+FHN+o7sMhXn7k9FvmAF+U9tSfUM76M=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200529135534.GA14973@ls3530.fritz.box>
References: <20200529135534.GA14973@ls3530.fritz.box>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200529135534.GA14973@ls3530.fritz.box>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.7-2
X-PR-Tracked-Commit-Id: bf71bc16e02162388808949b179d59d0b571b965
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef4531be685f238594877a8e28e65544d5a022d7
Message-Id: <159078660228.32003.17447092419951481347.pr-tracker-bot@kernel.org>
Date:   Fri, 29 May 2020 21:10:02 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Fri, 29 May 2020 15:55:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef4531be685f238594877a8e28e65544d5a022d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
