Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 7DD7A4A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 14:16:20 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@parisc-linux.org
Date: Tue, 13 Feb 2001 22:17:05 +0100
MIME-Version: 1.0
Message-Id: <01021322170500.01835@P100.helgenet.de>
Subject: [parisc-linux] small STI patch
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've just committed a small patch, which saves us to copy a whole struct from 
the STI ROM just to get one value (the ROM size) out of it.

Helge

--- sticon-wmode.c      2001/02/04 21:22:59     1.3
+++ sticon-wmode.c      2001/02/13 20:56:54     1.4
@@ -119,13 +119,9 @@
        if (!(raw && cooked))
                goto out_err;
 
-       /* copy raw rom header & get the real size */
-       sti_rom_copy(address, 0, sizeof(*raw), raw);
-       wmode_sti_dump_rom(raw);
-       size = raw->last_addr;
-       kfree(raw);
+       /* read the ROM size directly from the struct in ROM */
+       size = gsc_readl(address + offsetof(struct sti_rom,last_addr));
 
-       /* now copy raw rom with real size */
        raw = kmalloc(size, GFP_KERNEL);
        if(!raw)
                goto out_err;
