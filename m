From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [PARISC] fix uninitialized spinlock in HIL keyboard driver
Date: Sat, 17 Feb 2007 15:55:23 -0500
Message-ID: <11717457253477-git-send-email-kyle__3678.15955910391$1416624293$gmane$org@parisc-linux.org>
References: <11717457251848-git-send-email-kyle@parisc-linux.org> <11717457251606-git-send-email-kyle@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org,
 akpm@osdl.org,
 Helge Deller <deller@gmx.de>,
 Kyle McMartin <kyle@parisc-linux.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Return-Path: <kyle@athena.road.mcmartin.ca>
In-Reply-To: <11717457251606-git-send-email-kyle@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>

From: Helge Deller <deller@gmx.de>

- remove some warnings for PARISC part of the driver
- annotate hphilkeyb_keycode[] array as __read_mostly

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>
---
 drivers/input/keyboard/hilkbd.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
index c2264a6..585f0a7 100644
--- a/drivers/input/keyboard/hilkbd.c
+++ b/drivers/input/keyboard/hilkbd.c
@@ -3,7 +3,7 @@
  *
  *  Copyright (C) 1998 Philip Blundell <philb@gnu.org>
  *  Copyright (C) 1999 Matthew Wilcox <willy@bofh.ai>
- *  Copyright (C) 1999-2006 Helge Deller <deller@gmx.de>
+ *  Copyright (C) 1999-2007 Helge Deller <deller@gmx.de>
  *
  *  Very basic HP Human Interface Loop (HIL) driver.
  *  This driver handles the keyboard on HP300 (m68k) and on some
@@ -89,7 +89,7 @@ MODULE_LICENSE("GPL v2");
 #define	HIL_READKBDSADR	 	0xF9
 #define	HIL_WRITEKBDSADR 	0xE9
 
-static unsigned int hphilkeyb_keycode[HIL_KEYCODES_SET1_TBLSIZE] =
+static unsigned int hphilkeyb_keycode[HIL_KEYCODES_SET1_TBLSIZE] __read_mostly =
 	{ HIL_KEYCODES_SET1 };
 
 /* HIL structure */
@@ -211,6 +211,7 @@ hil_keyb_init(void)
 		return -ENODEV; /* already initialized */
 	}
 
+	spin_lock_init(&hil_dev.lock);
 	hil_dev.dev = input_allocate_device();
 	if (!hil_dev.dev)
 		return -ENOMEM;
@@ -295,7 +296,9 @@ err3:
 	free_irq(HIL_IRQ, hil_dev.dev_id);
 err2:
 	release_region(HILBASE + HIL_DATA, 2);
+#if defined(CONFIG_HP300)
 err1:
+#endif
 	input_free_device(hil_dev.dev);
 	hil_dev.dev = NULL;
 	return err;
@@ -307,7 +310,7 @@ static int __init
 hil_init_chip(struct parisc_device *dev)
 {
 	if (!dev->irq) {
-		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lx\n", dev->hpa.start);
+		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lux\n", (unsigned long)dev->hpa.start);
 		return -ENODEV;
 	}
 
-- 
1.4.4.4
