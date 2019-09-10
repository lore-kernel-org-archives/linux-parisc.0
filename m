Return-Path: <SRS0=RgB5=XF=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1C0C3A5A2
	for <linux-parisc@archiver.kernel.org>; Tue, 10 Sep 2019 09:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39CF220863
	for <linux-parisc@archiver.kernel.org>; Tue, 10 Sep 2019 09:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391232AbfIJJpU (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Tue, 10 Sep 2019 05:45:20 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:55266 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390559AbfIJJpU (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Tue, 10 Sep 2019 05:45:20 -0400
Received: from wim.jer (jer.xs4all.nl [212.238.182.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jer)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 3870C34AF58;
        Tue, 10 Sep 2019 09:45:19 +0000 (UTC)
Date:   Tue, 10 Sep 2019 11:45:14 +0200
From:   Jeroen Roovers <jer@gentoo.org>
To:     linux-parisc@vger.kernel.org
Cc:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Have git ignore generated real2.S and firmware.c
Message-ID: <20190910114514.3f1788df@wim.jer>
Organization: Gentoo Foundation
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

These files are not covered in globs from any other .gitignore files.

Signed-off-by: Jeroen Roovers <jer@gentoo.org>
---
 arch/parisc/boot/compressed/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/parisc/boot/compressed/.gitignore
b/arch/parisc/boot/compressed/.gitignore index
ae06b9b4c02f..926cd41c1069 100644 ---
a/arch/parisc/boot/compressed/.gitignore +++
b/arch/parisc/boot/compressed/.gitignore @@ -1,3 +1,5 @@
+firmware.c
+real2.S
 sizes.h
 vmlinux
 vmlinux.lds
-- 
2.23.0

