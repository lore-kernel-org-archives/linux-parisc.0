Return-Path: <SRS0=noE3=OI=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0F4C43441
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Nov 2018 16:05:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4F7A21019
	for <linux-parisc@archiver.kernel.org>; Thu, 29 Nov 2018 16:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F7A21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbeK3DLu (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 29 Nov 2018 22:11:50 -0500
Received: from mout.gmx.net ([212.227.15.19]:34209 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728826AbeK3DLt (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 29 Nov 2018 22:11:49 -0500
Received: from localhost.localdomain ([155.56.40.74]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LqRKT-1h6QbH2dGb-00e3TB; Thu, 29 Nov 2018 17:05:50 +0100
Date:   Thu, 29 Nov 2018 17:05:47 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Cc:     Frank Scheiner <frank.scheiner@web.de>
Subject: [PATCH] parisc: Enable -ffunction-sections for modules on 32-bit
 kernel
Message-ID: <20181129160547.GA24412@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:yLeo1f1MOCWajyIE2aZxZYtaPFQ/he9r2TIjBIs34Om0gMp6mps
 wSOMJku/+NrUYaDJU+TqchltqyxaSElXsnUS3jVBUrtgjzMwyDyxR2f1uvVWn3oGRsXekk9
 81EPk3ahQI8b/n8TYZ1Ql0TYJU0P09gHI7BYe2uOzk+ChJIZ3qWlkxlWPcUnqtCqjj/KA6C
 saNfYUqrKVFHKZ4YPgA/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4R4vSpCQOBE=:sOLuRTdnOksWRd5pSY+tjD
 RuEkNUj0482UQx5w/FLQvyGVveCTlJZisVOrr+BwiXkokJdT65DJHt8EwKAhHIn98pgzVp6qm
 zne+d0NjhZmmrIKrja/t+IMscoXyXryNbAI44p7HRISs4SzX1IuPdqylZgxpdEoIiZMgFwl7T
 HN54PEVcPYgtiaZKu1qNFfk7PVfQoagqXbG2Mas1ueaRx2LeptA6XLIZCXAwTRgneZLXaYkE+
 u7vZyH6gIzA1gitD5oHebOJ+wYkt3zRZBWT0/rAVd9LskFqndHDVEHhMsAVN58/b5sGwq4VUh
 8p32c32hNNxFY67yZyy/PQLMZp5N0k0WNQ2ZxZ3Q979VKt/ndDqn4gsNfwW4BOeg/oVQkPHIl
 Ud8ZSnFVVE3F9nmoYGzpGEPOz0kfzuL5gMUkmuIPMZcMKMJOP9IHymlLpXT4j9C8gUYyq16eq
 fq3NBhN5jpDfRV5UzUeimrsLvB6EILe47cf62npfTcfzavbnYz27kXXIYbG6saMdBlbkdWC3Q
 Bnb1lKdzcfLMGfBnJ18kuTTUfaKpAUoqeDsE+uXJRM5XVHpuRuqhqAASXWQHFvkWUSPSy0CUX
 dZ0G7y8OEA0wDXHvKfYEpeiVa5idINym3zsSS/Dq15b+QQy9D0Kl4H0pvpWehs/lauDHEnnwM
 BfaNs8zoEwCQjaBbuBmpA9fo6DU38hJ2POfS2tA+RzEDXC3po5rbjcf+2QgkmYA0/X2H1Xr83
 GwByFGkfHZ2IS3PJwOlqK6/Nc6crwoGkECy6hgCTK1BWhjuJQTy7xkSQRwkircDWJPEFWnn9z
 a2ZBFOqOC8DDyD0MDmDA9AoOgcIOgXSzyQz0axO//83D7B4HEfv/vQ+f9EChJPxExz/vQDVtW
 RvepVX6N9I+YiCg/nQfqn5FMWQa3kSxfL02T5Yep8=
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

Frank Schreiner reported, that since kernel 4.18 he faces sysfs-warnings
when loading modules on a 32-bit kernel. Here is one such example:

 sysfs: cannot create duplicate filename '/module/nfs/sections/.text'
 CPU: 0 PID: 98 Comm: modprobe Not tainted 4.18.0-2-parisc #1 Debian 4.18.10-2
 Backtrace:
  [<1017ce2c>] show_stack+0x3c/0x50
  [<107a7210>] dump_stack+0x28/0x38
  [<103f900c>] sysfs_warn_dup+0x88/0xac
  [<103f8b1c>] sysfs_add_file_mode_ns+0x164/0x1d0
  [<103f9e70>] internal_create_group+0x11c/0x304
  [<103fa0a0>] sysfs_create_group+0x48/0x60
  [<1022abe8>] load_module.constprop.35+0x1f9c/0x23b8
  [<1022b278>] sys_finit_module+0xd0/0x11c
  [<101831dc>] syscall_exit+0x0/0x14 

This warning gets triggered by the fact, that due to commit 24b6c22504a2
("parisc: Build kernel without -ffunction-sections") we now get multiple .text
sections in the kernel modules for which sysfs_create_group() can't create
multiple virtual files.

This patch works around the problem by re-enabling the -ffunction-sections
compiler option for modules, while keeping it disabled for the non-module
kernel code.

Reported-by: Frank Scheiner <frank.scheiner@web.de>
Fixes: 24b6c22504a2 ("parisc: Build kernel without -ffunction-sections")
Cc: <stable@vger.kernel.org> # v4.18+
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index d047a09d660f..1085385e1f06 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -71,6 +71,13 @@ ifdef CONFIG_MLONGCALLS
 KBUILD_CFLAGS_KERNEL += -mlong-calls
 endif
 
+# Without this, "ld -r" results in .text sections that are too big (> 0x40000)
+# for branches to reach stubs. And multiple .text sections trigger a warning
+# when creating the sysfs module information section.
+ifndef CONFIG_64BIT
+KBUILD_CFLAGS_MODULE += -ffunction-sections
+endif
+
 # select which processor to optimise for
 cflags-$(CONFIG_PA7000)		+= -march=1.1 -mschedule=7100
 cflags-$(CONFIG_PA7200)		+= -march=1.1 -mschedule=7200
