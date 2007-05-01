From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [parisc-linux] [patch 10/33] hilkbd: Kill compiler warning and fix
	comment dyslexia
Date: Tue, 01 May 2007 21:51:02 +0200
Message-ID: <20070501195132.228808086__14686.6252799102$1416624637$gmane$org@mail.of.borg>
References: <20070501195052.390551603@mail.of.borg>
Cc: linux-m68k@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

hilkbd: Kill compiler warning and fix comment dyslexia

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/input/keyboard/hilkbd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-m68k-2.6.21.orig/drivers/input/keyboard/hilkbd.c
+++ linux-m68k-2.6.21/drivers/input/keyboard/hilkbd.c
@@ -52,7 +52,7 @@ MODULE_LICENSE("GPL v2");
 
 #elif defined(CONFIG_HP300)
 
- #define HILBASE		0xf0428000 /* HP300 (m86k) port address */
+ #define HILBASE		0xf0428000UL /* HP300 (m68k) port address */
  #define HIL_DATA		0x1
  #define HIL_CMD		0x3
  #define HIL_IRQ		2

--
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
