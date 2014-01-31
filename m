From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc/sti_console: prefer Linux fonts over built-in ROM
 fonts
Date: Fri, 31 Jan 2014 15:39:40 +0100
Message-ID: <20140131143940.GA4857@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The built-in ROM fonts lack many necessary ASCII characters, which is
why it makes sens to prefer the Linux fonts instead if they are
available.  This makes consoles on STI graphics cards which are not
supported by the stifb driver (e.g. Visualize FXe) looks much nicer.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index 4ad24f2..cecd3de 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -488,7 +488,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, unsigned long rom_address,
 	return 0;
 }
 
-#ifdef CONFIG_FONTS
+#ifdef CONFIG_FONT_SUPPORT
 static struct sti_cooked_font *
 sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 {
diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
index 34fd931..4dc1b99 100644
--- a/lib/fonts/Kconfig
+++ b/lib/fonts/Kconfig
@@ -9,7 +9,7 @@ if FONT_SUPPORT
 
 config FONTS
 	bool "Select compiled-in fonts"
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE
 	help
 	  Say Y here if you would like to use fonts other than the default
 	  your frame buffer console usually use.
@@ -22,7 +22,7 @@ config FONTS
 
 config FONT_8x8
 	bool "VGA 8x8 font" if FONTS
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE
 	default y if !SPARC && !FONTS
 	help
 	  This is the "high resolution" font for the VGA frame buffer (the one
@@ -45,7 +45,7 @@ config FONT_8x16
 
 config FONT_6x11
 	bool "Mac console 6x11 font (not supported by all drivers)" if FONTS
-	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
+	depends on FRAMEBUFFER_CONSOLE
 	default y if !SPARC && !FONTS && MAC
 	help
 	  Small console font with Macintosh-style high-half glyphs.  Some Mac
