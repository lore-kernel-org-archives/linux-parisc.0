Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64ABFC0015E
	for <linux-parisc@archiver.kernel.org>; Tue, 15 Aug 2023 20:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbjHOUUu (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 15 Aug 2023 16:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbjHOUUc (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 15 Aug 2023 16:20:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0598B1BE7;
        Tue, 15 Aug 2023 13:20:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97A7461FDA;
        Tue, 15 Aug 2023 20:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6782BC433C7;
        Tue, 15 Aug 2023 20:20:28 +0000 (UTC)
Date:   Tue, 15 Aug 2023 22:20:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Sam James <sam@gentoo.org>
Subject: [GIT PULL] parisc architecture fixes for v6.5-rc7
Message-ID: <ZNveCSXhx2LrtgVL@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Hi Linus,

please pull one single patch for the parisc architecture for 6.5-rc7:

Fix the parisc TLB ptlock checks so that they can be enabled
together with the lightweight spinlock checks.

Thanks,
Helge

---

The following changes since commit 2ccdd1b13c591d306f0401d98dedc4bdcd02b421:

  Linux 6.5-rc6 (2023-08-13 11:29:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.5-rc7

for you to fetch changes up to 7a894c87374771f3cfb1b8e5453fbe03f1fb8135:

  parisc: Fix CONFIG_TLB_PTLOCK to work with lightweight spinlock checks (2023-08-14 09:54:49 +0200)

----------------------------------------------------------------
parisc architecture fixes for kernel v6.5-rc7:

- Fix TLB ptlock checks to not break lightweight spinlock checks

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix CONFIG_TLB_PTLOCK to work with lightweight spinlock checks

 arch/parisc/kernel/entry.S | 47 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 24 deletions(-)
