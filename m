Return-Path: <linux-parisc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDA6E95A8E
	for <linux-parisc@archiver.kernel.org>; Sun,  8 Oct 2023 21:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344719AbjJHVyp (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sun, 8 Oct 2023 17:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344638AbjJHVyp (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Sun, 8 Oct 2023 17:54:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D20B3
        for <linux-parisc@vger.kernel.org>; Sun,  8 Oct 2023 14:54:43 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D530C433C7;
        Sun,  8 Oct 2023 21:54:42 +0000 (UTC)
Date:   Sun, 8 Oct 2023 23:54:39 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org
Subject: [PATCH] parisc: Add qemu power-off handler
Message-ID: <ZSMlH4LkRTbOt8xr@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

When running on qemu, use the artificial "system halt" instruction
to power the system off.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 2f434f2da185..c934ec47d915 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
 #include <linux/start_kernel.h>
+#include <linux/reboot.h>
 
 #include <asm/cacheflush.h>
 #include <asm/processor.h>
@@ -235,6 +236,13 @@ static int __init parisc_init_resources(void)
 	return 0;
 }
 
+static int qemu_power_off(struct sys_off_data *data)
+{
+	/* call qemu artificial "system halt" instruction */
+	asm volatile(".word 0xfffdead0": : :"memory");
+	return NOTIFY_DONE;
+}
+
 static int __init parisc_init(void)
 {
 	u32 osid = (OS_ID_LINUX << 16);
@@ -242,6 +250,11 @@ static int __init parisc_init(void)
 	parisc_init_resources();
 	do_device_inventory();                  /* probe for hardware */
 
+	/* register QEMU power off function */
+	if (running_on_qemu)
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+			SYS_OFF_PRIO_DEFAULT, qemu_power_off, NULL);
+
 	parisc_pdc_chassis_init();
 	
 	/* set up a new led state on systems shipped LED State panel */
