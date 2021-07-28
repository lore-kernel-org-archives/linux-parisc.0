Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EE3C432BE
	for <linux-parisc@archiver.kernel.org>; Wed, 28 Jul 2021 08:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5470760FEA
	for <linux-parisc@archiver.kernel.org>; Wed, 28 Jul 2021 08:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbhG1IaI (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 28 Jul 2021 04:30:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235025AbhG1IaI (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 28 Jul 2021 04:30:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 429FA60FE4;
        Wed, 28 Jul 2021 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627461007;
        bh=412QLOWl6lsgrJvaETIkLRDap172jok0TCDCOOeQmD0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WPniMS3RK9cSY8owpTbfM50AdVmxNCOZ6d9ebpBSoh3QvAncAQo7fKTC9OJbgp4Uw
         TMio8ZagfKXDAzlqx3V7xJJULgHvseAEfolQckfk1epOEXu/4IWY/qmQLlR2S9JNnz
         k2nfcxT2v7m1TqAKETZ4CP2GB9dPHGJKfLxgInLH4Lel75VD+Cfolr6Wh0HJw5f7so
         5kgtYnBvWJ+tr4Bj8NOHdup5acJO5/2pd+CDbvWL4zqhK/tWODo5Ns9GAvqr2D6Cs4
         IlM01H0TBHTnO/0UhJAMoKcp/f6K6BIn/Xjb4lJViGUCcCs2j3zJa07fY0MOPTw6Bp
         SzUdNA9x7l2iQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] tulip: windbond-840: Fix missing pci_disable_device() in
 probe and remove
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162746100719.27952.3800646890142714725.git-patchwork-notify@kernel.org>
Date:   Wed, 28 Jul 2021 08:30:07 +0000
References: <20210728074313.272055-1-wanghai38@huawei.com>
In-Reply-To: <20210728074313.272055-1-wanghai38@huawei.com>
To:     Wang Hai <wanghai38@huawei.com>
Cc:     davem@davemloft.net, kuba@kernel.org,
        christophe.jaillet@wanadoo.fr, gustavoars@kernel.org,
        tanghui20@huawei.com, netdev@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 28 Jul 2021 15:43:13 +0800 you wrote:
> Replace pci_enable_device() with pcim_enable_device(),
> pci_disable_device() and pci_release_regions() will be
> called in release automatically.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> 
> [...]

Here is the summary with links:
  - tulip: windbond-840: Fix missing pci_disable_device() in probe and remove
    https://git.kernel.org/netdev/net/c/76a16be07b20

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


