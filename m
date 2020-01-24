Return-Path: <SRS0=ow+P=3N=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FE1C2D0DB
	for <linux-parisc@archiver.kernel.org>; Fri, 24 Jan 2020 16:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8FE720702
	for <linux-parisc@archiver.kernel.org>; Fri, 24 Jan 2020 16:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731598AbgAXQIK (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Fri, 24 Jan 2020 11:08:10 -0500
Received: from mga06.intel.com ([134.134.136.31]:59183 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731597AbgAXQIK (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Fri, 24 Jan 2020 11:08:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 08:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
   d="scan'208";a="276355979"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2020 08:07:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E0B99115; Fri, 24 Jan 2020 18:07:39 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] parisc: Use for_each_console() helper
Date:   Fri, 24 Jan 2020 18:07:39 +0200
Message-Id: <20200124160739.65256-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Replace open coded single-linked list iteration loop with for_each_console()
helper in use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/parisc/kernel/pdc_cons.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 7ed404c60a9e..aa01448f377c 100644
--- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -259,8 +259,8 @@ void pdc_console_restart(void)
 	if (console_drivers != NULL)
 		pdc_cons.flags &= ~CON_PRINTBUFFER;
 
-	while ((console = console_drivers) != NULL)
-		unregister_console(console_drivers);
+	for_each_console(console)
+		unregister_console(console);
 
 	/* force registering the pdc console */
 	pdc_console_init_force();
-- 
2.24.1

