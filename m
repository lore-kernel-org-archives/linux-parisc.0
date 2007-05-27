From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix section mismatch in parisc STI
	video drivers
Date: Sun, 27 May 2007 18:10:25 +0200
Message-ID: <200705271810.25621.deller__41915.1026443162$1416624367$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

Hi Kyle,

this patch fixes various section mismatches in the sti graphics driver:
WARNING: drivers/built-in.o(.text.sticore_pci_init+0xac): Section mismatch: reference to .init.text:sti_try_rom_generic (after 'sticore_pci_init')
WARNING: drivers/built-in.o(.text.sticore_pci_init+0xe4): Section mismatch: reference to .init.text:sticore_check_for_default_sti (after 'sticore_pci_init')
WARNING: drivers/built-in.o(.text.sti_get_rom+0x18): Section mismatch: reference to .init.text:sti_init_roms (after 'sti_get_rom')
(and others).

Basically it's a replacement of __init by __devinit.
Please apply, Helge

    Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index 717b360..f458a43 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -240,7 +240,7 @@ static void sti_flush(unsigned long from
 	flush_icache_range(from, from+len);
 }
 
-void __init
+void __devinit
 sti_rom_copy(unsigned long base, unsigned long count, void *dest)
 {
 	unsigned long dest_len = count;
@@ -269,7 +269,7 @@ sti_rom_copy(unsigned long base, unsigne
 static char default_sti_path[21] __read_mostly;
 
 #ifndef MODULE
-static int __init sti_setup(char *str)
+static int __devinit sti_setup(char *str)
 {
 	if (str)
 		strlcpy (default_sti_path, str, sizeof (default_sti_path));
@@ -288,12 +288,12 @@ __setup("sti=", sti_setup);
 
 
 
-static char __initdata	*font_name[MAX_STI_ROMS] = { "VGA8x16", };
-static int __initdata	font_index[MAX_STI_ROMS], 
-			font_height[MAX_STI_ROMS],
-			font_width[MAX_STI_ROMS];
+static char __devinitdata	*font_name[MAX_STI_ROMS] = { "VGA8x16", };
+static int __devinitdata	font_index[MAX_STI_ROMS], 
+				font_height[MAX_STI_ROMS],
+				font_width[MAX_STI_ROMS];
 #ifndef MODULE
-static int __init sti_font_setup(char *str)
+static int __devinit sti_font_setup(char *str)
 {
 	char *x;
 	int i = 0;
@@ -346,7 +346,7 @@ __setup("sti_font=", sti_font_setup);
 
 
 	
-static void __init
+static void __devinit
 sti_dump_globcfg(struct sti_glob_cfg *glob_cfg, unsigned int sti_mem_request)
 {
 	struct sti_glob_cfg_ext *cfg;
@@ -386,7 +386,7 @@ sti_dump_globcfg(struct sti_glob_cfg *gl
 		cfg->sti_mem_addr, sti_mem_request));
 }
 
-static void __init
+static void __devinit
 sti_dump_outptr(struct sti_struct *sti)
 {
 	DPRINTK((KERN_INFO
@@ -400,7 +400,7 @@ sti_dump_outptr(struct sti_struct *sti)
 		 sti->outptr.attributes));
 }
 
-static int __init
+static int __devinit
 sti_init_glob_cfg(struct sti_struct *sti,
 	    unsigned long rom_address, unsigned long hpa)
 {
@@ -482,7 +482,7 @@ sti_init_glob_cfg(struct sti_struct *sti
 }
 
 #ifdef CONFIG_FB
-struct sti_cooked_font * __init
+struct sti_cooked_font * __devinit
 sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 {
 	const struct font_desc *fbfont;
@@ -538,14 +538,14 @@ sti_select_fbfont(struct sti_cooked_rom 
 	return cooked_font;
 }
 #else
-struct sti_cooked_font * __init
+struct sti_cooked_font * __devinit
 sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 {
 	return NULL;
 }
 #endif
 
-struct sti_cooked_font * __init
+struct sti_cooked_font * __devinit
 sti_select_font(struct sti_cooked_rom *rom,
 	    int (*search_font_fnc) (struct sti_cooked_rom *,int,int) )
 {
@@ -572,7 +572,7 @@ sti_select_font(struct sti_cooked_rom *r
 }
 
 
-static void __init 
+static void __devinit 
 sti_dump_rom(struct sti_rom *rom)
 {
 	printk(KERN_INFO "    id %04x-%04x, conforms to spec rev. %d.%02x\n",
@@ -590,7 +590,7 @@ sti_dump_rom(struct sti_rom *rom)
 }
 
 
-static int __init 
+static int __devinit 
 sti_cook_fonts(struct sti_cooked_rom *cooked_rom,
 			struct sti_rom *raw_rom)
 {
@@ -625,7 +625,7 @@ sti_cook_fonts(struct sti_cooked_rom *co
 }
 
 
-static int __init 
+static int __devinit 
 sti_search_font(struct sti_cooked_rom *rom, int height, int width)
 {
 	struct sti_cooked_font *font;
@@ -642,7 +642,7 @@ sti_search_font(struct sti_cooked_rom *r
 #define BMODE_RELOCATE(offset)		offset = (offset) / 4;
 #define BMODE_LAST_ADDR_OFFS		0x50
 
-static void * __init
+static void * __devinit
 sti_bmode_font_raw(struct sti_cooked_font *f)
 {
 	unsigned char *n, *p, *q;
@@ -660,7 +660,7 @@ sti_bmode_font_raw(struct sti_cooked_fon
 	return n + 3;
 }
 
-static void __init
+static void __devinit
 sti_bmode_rom_copy(unsigned long base, unsigned long count, void *dest)
 {
 	unsigned long dest_len = count;
@@ -675,7 +675,7 @@ sti_bmode_rom_copy(unsigned long base, u
 	sti_flush(dest_start, dest_len);
 }
 
-static struct sti_rom * __init
+static struct sti_rom * __devinit
 sti_get_bmode_rom (unsigned long address)
 {
 	struct sti_rom *raw;
@@ -711,7 +711,7 @@ sti_get_bmode_rom (unsigned long address
 	return raw;
 }
 
-struct sti_rom * __init
+struct sti_rom * __devinit
 sti_get_wmode_rom (unsigned long address)
 {
 	struct sti_rom *raw;
@@ -727,7 +727,7 @@ sti_get_wmode_rom (unsigned long address
 	return raw;
 }
 
-int __init
+int __devinit
 sti_read_rom(int wordmode, struct sti_struct *sti, unsigned long address)
 {
 	struct sti_cooked_rom *cooked;
@@ -783,7 +783,7 @@ out_err:
 	return 0;
 }
 
-static struct sti_struct * __init
+static struct sti_struct * __devinit
 sti_try_rom_generic(unsigned long address, unsigned long hpa, struct pci_dev *pd)
 {
 	struct sti_struct *sti;
@@ -898,7 +898,7 @@ out_err:
 	return NULL;
 }
 
-static void __init sticore_check_for_default_sti(struct sti_struct *sti, char *path)
+static void __devinit sticore_check_for_default_sti(struct sti_struct *sti, char *path)
 {
 	if (strcmp (path, default_sti_path) == 0)
 		default_sti = sti;
@@ -909,7 +909,7 @@ static void __init sticore_check_for_def
  * in the additional address field addr[1] while on
  * older Systems the PDC stores it in page0->proc_sti 
  */
-static int __init sticore_pa_init(struct parisc_device *dev)
+static int __devinit sticore_pa_init(struct parisc_device *dev)
 {
 	char pa_path[21];
 	struct sti_struct *sti = NULL;
@@ -1015,7 +1015,7 @@ static struct parisc_driver pa_sti_drive
 
 static int sticore_initialized __read_mostly;
 
-static void __init sti_init_roms(void)
+static void __devinit sti_init_roms(void)
 {
 	if (sticore_initialized)
 		return;
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
