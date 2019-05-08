Return-Path: <SRS0=jFxy=TI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFEEC004C9
	for <linux-parisc@archiver.kernel.org>; Wed,  8 May 2019 02:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5ADA8214AF
	for <linux-parisc@archiver.kernel.org>; Wed,  8 May 2019 02:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557283204;
	bh=mVQqqor03PsQ/0g49kpj6ZbWX/FB5uKvaXa+qUbqkOw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=rFz4OiEtqljHQn8OOiODBqvKbket6+rRR439RJY29Q1L8y3tu3eGLgzeti27MKs9Y
	 Zlv/KPaT5Ch/BEudrOEXIFda7VmV2e7iVZ1dOWAVMW7y9zouqJxhDIRcD++WQc8cvj
	 ws7ohpQJg3jjQYy0mOE8c4n8yG2yKk9KiEhsTk6E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfEHCkD (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 7 May 2019 22:40:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbfEHCkD (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 7 May 2019 22:40:03 -0400
Subject: Re: [GIT PULL] parisc architecture updates for kernel v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557283203;
        bh=mVQqqor03PsQ/0g49kpj6ZbWX/FB5uKvaXa+qUbqkOw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=XG2iDmuRZ0s6tm0ZE4gLMS3QcbH2VtGaJ9XkJww8yqrh5UtuD8TZrHdNnS5P3yoaG
         oTcJN/eCQK36M4Nd5QfaRdMr1lov17Kebl2CKsSa4MTG40qzLi7aeGRTqSfA/YRNXT
         REtUerIohI7PgFCo95J7FeSEFkvYFTBRdXh/6yE4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190507183818.GA17218@ls3530.dellerweb.de>
References: <20190507183818.GA17218@ls3530.dellerweb.de>
X-PR-Tracked-List-Id: <linux-parisc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190507183818.GA17218@ls3530.dellerweb.de>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
 parisc-5.2-1
X-PR-Tracked-Commit-Id: 62217beb394e654bbd2bb87c533dadd2d8bf62c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3511f53bb2475f2a4e8460bee5a1ae6dea2a433
Message-Id: <155728320302.19924.1994029648168846229.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 02:40:03 +0000
To:     Helge Deller <deller@gmx.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Sven Schnelle <svens@stackframe.org>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Mikulas Patocka <mpatocka@redhat.com>
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

The pull request you sent on Tue, 7 May 2019 20:38:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-5.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3511f53bb2475f2a4e8460bee5a1ae6dea2a433

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
