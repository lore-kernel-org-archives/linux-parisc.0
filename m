From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: sticon - fix 64bit and font selection
 (unfinished support-for-64bit-STI-API patch)
Date: Thu, 7 Nov 2013 20:29:59 +0100
Message-ID: <20131107192959.GA1320@p100.box>
References: <20131106223859.GA15569@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131106223859.GA15569@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Helge Deller <deller@gmx.de>:
> STI text console (sticon) was broken on 64bit machines with more than
> 4GB and lead in some cases to a kernel crash.
> 
> Since sticon uses the 32bit STI API it needs to keep pointers to memory
> below 4GB. But on a 64bit kernel some memory regions (e.g. the kernel
> stack) might be above 4GB which then may crash the kernel in the STI
> functions.
> 
> Additionally sticon didn't selected the built-in framebuffer fonts by
> default. This is now fixed.
> 
> On a side-note: Theoretically we could enhance the sticon driver to
> use the 64bit STI API. But this just adds complexity and on some
> machines a 64bit STI is just not available.

Just for the archive - here is an unfinished version of my STIcon patch
which can be used to develop a version which additionally supports the
64bit STI functions.
Most changes are identical to the committed version.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 7eb616e..501e564 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -318,9 +318,14 @@ int pdc_iodc_getc(void);
 int pdc_iodc_print(const unsigned char *str, unsigned count);
 
 void pdc_emergency_unlock(void);
-int pdc_sti_call(unsigned long func, unsigned long flags,
+int pdc_sti_call32(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
                  unsigned long glob_cfg);
+#ifdef CONFIG_64BIT
+int pdc_sti_call64(unsigned long func, unsigned long flags,
+                 unsigned long inptr, unsigned long outputr,
+                 unsigned long glob_cfg);
+#endif
 
 static inline char * os_id_to_string(u16 os_id) {
 	switch(os_id) {
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index 2239590..cb50107 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1185,7 +1185,7 @@ int pdc_iodc_getc(void)
 	return ch;
 }
 
-int pdc_sti_call(unsigned long func, unsigned long flags,
+int pdc_sti_call32(unsigned long func, unsigned long flags,
                  unsigned long inptr, unsigned long outputr,
                  unsigned long glob_cfg)
 {
@@ -1198,9 +1198,25 @@ int pdc_sti_call(unsigned long func, unsigned long flags,
 
         return retval;
 }
-EXPORT_SYMBOL(pdc_sti_call);
+EXPORT_SYMBOL(pdc_sti_call32);
 
 #ifdef CONFIG_64BIT
+int pdc_sti_call64(unsigned long func, unsigned long flags,
+                 unsigned long inptr, unsigned long outputr,
+                 unsigned long glob_cfg)
+{
+	int retval;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&pdc_lock, irqflags);
+	retval = real64_call(func, flags, inptr, outputr, glob_cfg);
+	spin_unlock_irqrestore(&pdc_lock, irqflags);
+
+	return retval;
+}
+EXPORT_SYMBOL(pdc_sti_call64);
+
+
 /**
  * pdc_pat_cell_get_number - Returns the cell number.
  * @cell_info: The return buffer.
diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index 35687fd..0095f50 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -73,28 +73,34 @@ static const struct sti_init_flags default_init_flags = {
 
 static int sti_init_graph(struct sti_struct *sti)
 {
-	struct sti_init_inptr_ext inptr_ext = { 0, };
-	struct sti_init_inptr inptr = {
-		.text_planes	= 3, /* # of text planes (max 3 for STI) */
-		.ext_ptr	= STI_PTR(&inptr_ext)
-	};
-	struct sti_init_outptr outptr = { 0, };
+	struct sti_init_inptr *inptr = &sti->sti_data->init_inptr;
+	struct sti_init_inptr_ext *inptr_ext = &sti->sti_data->init_inptr_ext;
+	struct sti_init_outptr *outptr = &sti->sti_data->init_outptr;
 	unsigned long flags;
-	int ret;
+	int ret, err;
 
 	spin_lock_irqsave(&sti->lock, flags);
 
-	ret = STI_CALL(sti->init_graph, &default_init_flags, &inptr,
-		&outptr, sti->glob_cfg);
+	memset(inptr, 0, sizeof(*inptr));
+	inptr->text_planes = 3; /* # of text planes (max 3 for STI) */
+	memset(inptr_ext, 0, sizeof(*inptr_ext));
+	inptr->ext_ptr = STI_LONGPTR(sti, inptr_ext);
+	outptr->errno = 0;
+
+	ret = sti_call(sti, sti->init_graph, &default_init_flags, inptr,
+		outptr, sti->glob_cfg);
+
+	if (ret >= 0)
+		sti->text_planes = outptr->text_planes;
+	err = outptr->errno;
 
 	spin_unlock_irqrestore(&sti->lock, flags);
 
 	if (ret < 0) {
-		printk(KERN_ERR "STI init_graph failed (ret %d, errno %d)\n",ret,outptr.errno);
+		printk(KERN_ERR "STI init_graph failed (ret %d, errno %d)\n", ret, err);
 		return -1;
 	}
 	
-	sti->text_planes = outptr.text_planes;
 	return 0;
 }
 
@@ -104,16 +110,18 @@ static const struct sti_conf_flags default_conf_flags = {
 
 static void sti_inq_conf(struct sti_struct *sti)
 {
-	struct sti_conf_inptr inptr = { 0, };
+	struct sti_conf_inptr *inptr = &sti->sti_data->inq_inptr;
+	struct sti_conf_outptr *outptr = &sti->sti_data->inq_outptr;
 	unsigned long flags;
 	s32 ret;
 
-	sti->outptr.ext_ptr = STI_PTR(&sti->outptr_ext);
+	outptr->ext_ptr = STI_LONGPTR(sti, &sti->sti_data->inq_outptr_ext);
 	
 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		ret = STI_CALL(sti->inq_conf, &default_conf_flags,
-			&inptr, &sti->outptr, sti->glob_cfg);
+		memset(inptr, 0, sizeof(*inptr));
+		ret = sti_call(sti, sti->inq_conf, &default_conf_flags,
+			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
 	} while (ret == 1);
 }
@@ -126,7 +134,8 @@ static const struct sti_font_flags default_font_flags = {
 void
 sti_putc(struct sti_struct *sti, int c, int y, int x)
 {
-	struct sti_font_inptr inptr = {
+	struct sti_font_inptr *inptr = &sti->sti_data->font_inptr;
+	struct sti_font_inptr inptr_default = {
 		.font_start_addr= STI_PTR(sti->font->raw),
 		.index		= c_index(sti, c),
 		.fg_color	= c_fg(sti, c),
@@ -134,14 +143,15 @@ sti_putc(struct sti_struct *sti, int c, int y, int x)
 		.dest_x		= x * sti->font_width,
 		.dest_y		= y * sti->font_height,
 	};
-	struct sti_font_outptr outptr = { 0, };
+	struct sti_font_outptr *outptr = &sti->sti_data->font_outptr;
 	s32 ret;
 	unsigned long flags;
 
 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		ret = STI_CALL(sti->font_unpmv, &default_font_flags,
-			&inptr, &outptr, sti->glob_cfg);
+		*inptr = inptr_default;
+		ret = sti_call(sti, sti->font_unpmv, &default_font_flags,
+			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
 	} while (ret == 1);
 }
@@ -156,7 +166,8 @@ void
 sti_set(struct sti_struct *sti, int src_y, int src_x,
 	int height, int width, u8 color)
 {
-	struct sti_blkmv_inptr inptr = {
+	struct sti_blkmv_inptr *inptr = &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr inptr_default = {
 		.fg_color	= color,
 		.bg_color	= color,
 		.src_x		= src_x,
@@ -166,14 +177,15 @@ sti_set(struct sti_struct *sti, int src_y, int src_x,
 		.width		= width,
 		.height		= height,
 	};
-	struct sti_blkmv_outptr outptr = { 0, };
+	struct sti_blkmv_outptr *outptr = &sti->sti_data->blkmv_outptr;
 	s32 ret;
 	unsigned long flags;
 	
 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		ret = STI_CALL(sti->block_move, &clear_blkmv_flags,
-			&inptr, &outptr, sti->glob_cfg);
+		*inptr = inptr_default;
+		ret = sti_call(sti, sti->block_move, &clear_blkmv_flags,
+			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
 	} while (ret == 1);
 }
@@ -182,7 +194,8 @@ void
 sti_clear(struct sti_struct *sti, int src_y, int src_x,
 	  int height, int width, int c)
 {
-	struct sti_blkmv_inptr inptr = {
+	struct sti_blkmv_inptr *inptr = &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr inptr_default = {
 		.fg_color	= c_fg(sti, c),
 		.bg_color	= c_bg(sti, c),
 		.src_x		= src_x * sti->font_width,
@@ -192,14 +205,15 @@ sti_clear(struct sti_struct *sti, int src_y, int src_x,
 		.width		= width * sti->font_width,
 		.height		= height* sti->font_height,
 	};
-	struct sti_blkmv_outptr outptr = { 0, };
+	struct sti_blkmv_outptr *outptr = &sti->sti_data->blkmv_outptr;
 	s32 ret;
 	unsigned long flags;
 
 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		ret = STI_CALL(sti->block_move, &clear_blkmv_flags,
-			&inptr, &outptr, sti->glob_cfg);
+		*inptr = inptr_default;
+		ret = sti_call(sti, sti->block_move, &clear_blkmv_flags,
+			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
 	} while (ret == 1);
 }
@@ -212,7 +226,8 @@ void
 sti_bmove(struct sti_struct *sti, int src_y, int src_x,
 	  int dst_y, int dst_x, int height, int width)
 {
-	struct sti_blkmv_inptr inptr = {
+	struct sti_blkmv_inptr *inptr = &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr inptr_default = {
 		.src_x		= src_x * sti->font_width,
 		.src_y		= src_y * sti->font_height,
 		.dest_x		= dst_x * sti->font_width,
@@ -220,14 +235,15 @@ sti_bmove(struct sti_struct *sti, int src_y, int src_x,
 		.width		= width * sti->font_width,
 		.height		= height* sti->font_height,
 	};
-	struct sti_blkmv_outptr outptr = { 0, };
+	struct sti_blkmv_outptr *outptr = &sti->sti_data->blkmv_outptr;
 	s32 ret;
 	unsigned long flags;
 
 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		ret = STI_CALL(sti->block_move, &default_blkmv_flags,
-			&inptr, &outptr, sti->glob_cfg);
+		*inptr = inptr_default;
+		ret = sti_call(sti, sti->block_move, &default_blkmv_flags,
+			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
 	} while (ret == 1);
 }
@@ -389,10 +405,10 @@ static void sti_dump_outptr(struct sti_struct *sti)
 		"%d used bits\n"
 		"%d planes\n"
 		"attributes %08x\n",
-		 sti->outptr.bits_per_pixel,
-		 sti->outptr.bits_used,
-		 sti->outptr.planes,
-		 sti->outptr.attributes));
+		 sti->sti_data->inq_outptr.bits_per_pixel,
+		 sti->sti_data->inq_outptr.bits_used,
+		 sti->sti_data->inq_outptr.planes,
+		 sti->sti_data->inq_outptr.attributes));
 }
 
 static int sti_init_glob_cfg(struct sti_struct *sti, unsigned long rom_address,
@@ -402,24 +418,21 @@ static int sti_init_glob_cfg(struct sti_struct *sti, unsigned long rom_address,
 	struct sti_glob_cfg_ext *glob_cfg_ext;
 	void *save_addr;
 	void *sti_mem_addr;
-	const int save_addr_size = 1024;	/* XXX */
-	int i;
+	int i, size;
 
-	if (!sti->sti_mem_request)
+	if (sti->sti_mem_request < 256)
 		sti->sti_mem_request = 256; /* STI default */
 
-	glob_cfg = kzalloc(sizeof(*sti->glob_cfg), GFP_KERNEL);
-	glob_cfg_ext = kzalloc(sizeof(*glob_cfg_ext), GFP_KERNEL);
-	save_addr = kzalloc(save_addr_size, GFP_KERNEL);
-	sti_mem_addr = kzalloc(sti->sti_mem_request, GFP_KERNEL);
+	size = sizeof(struct sti_all_data) + sti->sti_mem_request - 256;
 
-	if (!(glob_cfg && glob_cfg_ext && save_addr && sti_mem_addr)) {
-		kfree(glob_cfg);
-		kfree(glob_cfg_ext);
-		kfree(save_addr);
-		kfree(sti_mem_addr);
+	sti->sti_data = kzalloc(size, GFP_KERNEL | GFP_DMA);
+	if (!sti->sti_data)
 		return -ENOMEM;
-	}
+
+	glob_cfg	= &sti->sti_data->glob_cfg;
+	glob_cfg_ext	= &sti->sti_data->glob_cfg_ext;
+	save_addr	= &sti->sti_data->save_addr;
+	sti_mem_addr	= &sti->sti_data->sti_mem_addr;
 
 	glob_cfg->ext_ptr = STI_PTR(glob_cfg_ext);
 	glob_cfg->save_addr = STI_PTR(save_addr);
@@ -500,7 +513,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 	size = bpc * 256;
 	size += sizeof(struct sti_rom_font);
 
-	nf = kzalloc(size, GFP_KERNEL);
+	nf = kzalloc(size, GFP_KERNEL | GFP_DMA);
 	if (!nf)
 		return NULL;
 
@@ -637,7 +650,7 @@ static void *sti_bmode_font_raw(struct sti_cooked_font *f)
 	unsigned char *n, *p, *q;
 	int size = f->raw->bytes_per_char*256+sizeof(struct sti_rom_font);
 	
-	n = kzalloc (4*size, GFP_KERNEL);
+	n = kzalloc (4*size, GFP_KERNEL | GFP_DMA);
 	if (!n)
 		return NULL;
 	p = n + 3;
@@ -673,7 +686,7 @@ static struct sti_rom *sti_get_bmode_rom (unsigned long address)
 	sti_bmode_rom_copy(address + BMODE_LAST_ADDR_OFFS, sizeof(size), &size);
 
 	size = (size+3) / 4;
-	raw = kmalloc(size, GFP_KERNEL);
+	raw = kmalloc(size, GFP_KERNEL | GFP_DMA);
 	if (raw) {
 		sti_bmode_rom_copy(address, size, raw);
 		memmove (&raw->res004, &raw->type[0], 0x3c);
@@ -707,7 +720,7 @@ static struct sti_rom *sti_get_wmode_rom(unsigned long address)
 	/* read the ROM size directly from the struct in ROM */ 
 	size = gsc_readl(address + offsetof(struct sti_rom,last_addr));
 
-	raw = kmalloc(size, GFP_KERNEL);
+	raw = kmalloc(size, GFP_KERNEL | GFP_DMA);
 	if (raw)
 		sti_rom_copy(address, size, raw);
 
@@ -743,11 +756,48 @@ static int sti_read_rom(int wordmode, struct sti_struct *sti,
 
 	address = (unsigned long) STI_PTR(raw);
 
+	pr_info("STI ROM supports 32 %sbit firmware functions.\n",
+		raw->alt_code_type == ALT_CODE_TYPE_PA_RISC_64 ? "and 64 ":"");
+
+#ifdef CONFIG_64BIT
+	/* Check if STI firmware includes 64bit API functions. */
+	sti->use_64bit = (raw->alt_code_type == ALT_CODE_TYPE_PA_RISC_64);
+
+ sti->use_64bit = 0; /* XXX */
+
+	/* Prefer 64bit STI API if available. */
+	if (STI_USE_64bit) {
+		pr_warn("STI: Using 64bit STI functions.\n");
+		sti->font_unpmv = address + (raw->font_unp_64bit   & 0x03ffffff);
+		sti->block_move = address + (raw->block_move_64bit & 0x03ffffff);
+		sti->init_graph = address + (raw->init_graph_64bit & 0x03ffffff);
+		sti->inq_conf   = address + (raw->inq_conf_64bit   & 0x03ffffff);
+		goto cont1;
+	}
+
+	pr_warn("STI: Memory = %u bytes\n", PAGE0->imm_max_mem);
+	if (PAGE0->imm_max_mem >= (3UL*1024+512)*1024*1024) {
+		pr_warn("STI: Sorry, 64bit STI firmware functions needed on machines with > 3.5 GB.\n");
+		goto out_err;
+	}
+
+	/* If the machine has less than 4GB physical RAM, then just use the
+	 * 32bit STI functions. Since we need to convert all pointers into
+	 * physical addresses, all will be below 4GB which is reachable by
+	 * the 32bit STI implementation.
+	 */
+#endif
+
+	pr_warn("STI: Using 32bit STI functions.\n");
 	sti->font_unpmv = address + (raw->font_unpmv & 0x03ffffff);
 	sti->block_move = address + (raw->block_move & 0x03ffffff);
 	sti->init_graph = address + (raw->init_graph & 0x03ffffff);
 	sti->inq_conf   = address + (raw->inq_conf   & 0x03ffffff);
 
+#ifdef CONFIG_64BIT
+cont1:
+#endif
+
 	sti->rom = cooked;
 	sti->rom->raw = raw;
 	
@@ -901,7 +951,7 @@ test_rom:
 	sti_dump_globcfg(sti->glob_cfg, sti->sti_mem_request);
 	sti_dump_outptr(sti);
 	
-	printk(KERN_INFO "    graphics card name: %s\n", sti->outptr.dev_name );
+	printk(KERN_INFO "    graphics card name: %s\n", sti->sti_data->inq_outptr.dev_name );
 
 	sti_roms[num_sti_roms] = sti;
 	num_sti_roms++;
@@ -1073,6 +1123,35 @@ struct sti_struct * sti_get_rom(unsigned int index)
 }
 EXPORT_SYMBOL(sti_get_rom);
 
+
+int sti_call(const struct sti_struct *sti, unsigned long func, const void *flags,
+                void *inptr, void *outptr, struct sti_glob_cfg *glob_cfg)
+{
+	unsigned long _flags = STI_PTR(flags);
+	unsigned long _inptr = STI_PTR(inptr);
+	unsigned long _outptr = STI_PTR(outptr);
+	unsigned long _glob_cfg = STI_PTR(glob_cfg);
+	int ret;
+
+	if (!STI_USE_64bit) {
+		/* Check for overflow when using 32bit STI on 64bit kernel. */
+		if (_flags>>32 || _inptr>>32 || _outptr>>32 || _glob_cfg>>32) {
+			WARN_ONCE(1, "INVALID POINTERS!");
+			return -1;
+		}
+	}
+
+//	pr_warn("sti_call(%#lx, %#lx, %#lx, %#lx, %#lx)\n",
+//		func, _flags, _inptr, _outptr, _glob_cfg);
+
+	if (STI_USE_64bit)
+		ret = pdc_sti_call64( func, _flags, _inptr, _outptr, _glob_cfg);
+	else
+		ret = pdc_sti_call32( func, _flags, _inptr, _outptr, _glob_cfg);
+
+	return ret;
+}
+
 MODULE_AUTHOR("Philipp Rumpf, Helge Deller, Thomas Bogendoerfer");
 MODULE_DESCRIPTION("Core STI driver for HP's NGLE series graphics cards in HP PARISC machines");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/video/sticore.h b/drivers/video/sticore.h
index addf7b6..fe42c93 100644
--- a/drivers/video/sticore.h
+++ b/drivers/video/sticore.h
@@ -3,7 +3,7 @@
 
 /* generic STI structures & functions */
 
-#if 0
+#if 1
 #define DPRINTK(x)	printk x
 #else
 #define DPRINTK(x) 
@@ -18,6 +18,9 @@
 #define STI_FONT_HPROMAN8 1
 #define STI_FONT_KANA8 2
 
+#define ALT_CODE_TYPE_UNKNOWN 0x00	/* alt code type values */
+#define ALT_CODE_TYPE_PA_RISC_64 0x01
+
 /* The latency of the STI functions cannot really be reduced by setting
  * this to 0;  STI doesn't seem to be designed to allow calling a different
  * function (or the same function with different arguments) after a
@@ -35,19 +38,25 @@
  */
  
 #include <asm/io.h>
+#include <linux/bug.h>
 
 #define STI_WAIT 1
 
-#define STI_PTR(p)	( virt_to_phys(p) )
-#define PTR_STI(p)	( phys_to_virt((unsigned long)p) )
-#define STI_CALL(func, flags, inptr, outptr, glob_cfg)	\
-       ({						\
-               pdc_sti_call( func, STI_PTR(flags),	\
-				   STI_PTR(inptr),	\
-				   STI_PTR(outptr),	\
-				   STI_PTR(glob_cfg));	\
-       })
+#ifdef CONFIG_64BIT
+#define STI_USE_64bit		sti->use_64bit
+#else
+#define STI_USE_64bit		0
+#endif
+
+// #define STI_PTR(p)		( virt_to_phys(p) )
+#define STI_PTR(p)		({ unsigned long _p = virt_to_phys(p); WARN_ONCE(_p>>32, "STI_PTR too big"); _p; })
+#define PTR_STI(p)		( phys_to_virt((unsigned long)p) )
 
+#if 0  // def CONFIG_64BIT
+# define STI_LONGPTR(sti,p)	({ unsigned long _x = virt_to_phys(p); STI_USE_64bit ? (u32*)_x:(u32*)(_x<<32); })
+#else
+# define STI_LONGPTR(sti,p)	STI_PTR(p)
+#endif
 
 #define sti_onscreen_x(sti) (sti->glob_cfg->onscreen_x)
 #define sti_onscreen_y(sti) (sti->glob_cfg->onscreen_y)
@@ -80,8 +89,8 @@ struct sti_glob_cfg_ext {
 	 u8 friendly_boot;		/* in friendly boot mode */
 	s16 power;			/* power calculation (in Watts) */
 	s32 freq_ref;			/* frequency reference */
-	u32 sti_mem_addr;		/* pointer to global sti memory (size=sti_mem_request) */
-	u32 future_ptr; 		/* pointer to future data */
+	u32 sti_mem_addr;		/* XXX pointer to global sti memory (size=sti_mem_request) */
+	u32 *future_ptr; 		/* pointer to future data */
 };
 
 struct sti_glob_cfg {
@@ -92,13 +101,12 @@ struct sti_glob_cfg {
 	s16 offscreen_y;		/* offset height in pixels */
 	s16 total_x;			/* frame buffer width in pixels */
 	s16 total_y;			/* frame buffer height in pixels */
-	u32 region_ptrs[STI_REGION_MAX]; /* region pointers */
+	u32 region_ptrs[STI_REGION_MAX]; /* XXX region pointers */
 	s32 reent_lvl;			/* storage for reentry level value */
 	u32 save_addr;			/* where to save or restore reentrant state */
 	u32 ext_ptr;			/* pointer to extended glob_cfg data structure */
 };
 
-
 /* STI init function structs */
 
 struct sti_init_flags {
@@ -121,14 +129,14 @@ struct sti_init_flags {
 	u32 caller_kernel : 1;	/* set only by kernel for each call */
 	u32 caller_other : 1;	/* set only by non-[BR/K] caller */
 	u32 pad	: 14;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_init_inptr_ext {
 	u8  config_mon_type;	/* configure to monitor type */
 	u8  pad[1];		/* pad to word boundary */
 	u16 inflight_data;	/* inflight data possible on PCI */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_init_inptr {
@@ -140,7 +148,7 @@ struct sti_init_inptr {
 struct sti_init_outptr {
 	s32 errno;		/* error number on failure */
 	s32 text_planes;	/* number of planes used for text */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 
@@ -150,17 +158,17 @@ struct sti_init_outptr {
 struct sti_conf_flags {
 	u32 wait : 1;		/* should routine idle wait or not */
 	u32 pad : 31;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_conf_inptr {
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_conf_outptr_ext {
 	u32 crt_config[3];	/* hardware specific X11/OGL information */	
 	u32 crt_hdw[3];
-	u32 future_ptr;
+	u32 *future_ptr;
 };
 
 struct sti_conf_outptr {
@@ -214,18 +222,18 @@ struct sti_rom {
 	u32 inq_conf;
 	u32 set_cm_entry;
 	u32 dma_ctrl;
-	 u8 res040[7 * 4];
+	u32 res040[7];
 	
-	u32 init_graph_addr;
-	u32 state_mgmt_addr;
-	u32 font_unp_addr;
-	u32 block_move_addr;
-	u32 self_test_addr;
-	u32 excep_hdlr_addr;
-	u32 inq_conf_addr;
-	u32 set_cm_entry_addr;
-	u32 image_unpack_addr;
-	u32 pa_risx_addrs[7];
+	u32 init_graph_64bit;
+	u32 state_mgmt_64bit;
+	u32 font_unp_64bit;
+	u32 block_move_64bit;
+	u32 self_test_64bit;
+	u32 excep_hdlr_64bit;
+	u32 inq_conf_64bit;
+	u32 set_cm_entry_64bit;
+	u32 image_unpack_64bit;
+	u32 pa_risx_64bits[7];
 };
 
 struct sti_rom_font {
@@ -256,25 +264,25 @@ struct sti_cooked_rom {
 /* STI font printing function structs */
 
 struct sti_font_inptr {
-	u32 font_start_addr;	/* address of font start */
+	u32 font_start_addr;	/* XXX address of font start */
 	s16 index;		/* index into font table of character */
 	u8 fg_color;		/* foreground color of character */
 	u8 bg_color;		/* background color of character */
 	s16 dest_x;		/* X location of character upper left */
 	s16 dest_y;		/* Y location of character upper left */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_font_flags {
 	u32 wait : 1;		/* should routine idle wait or not */
 	u32 non_text : 1;	/* font unpack/move in non_text planes =1, text =0 */
 	u32 pad : 30;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 	
 struct sti_font_outptr {
 	s32 errno;		/* error number on failure */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 /* STI blockmove structs */
@@ -285,7 +293,7 @@ struct sti_blkmv_flags {
 	u32 clear : 1;		/* clear during move? */
 	u32 non_text : 1;	/* block move in non_text planes =1, text =0 */
 	u32 pad : 28;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_blkmv_inptr {
@@ -297,15 +305,43 @@ struct sti_blkmv_inptr {
 	s16 dest_y;		/* dest upper left pixel y location */
 	s16 width;		/* block width in pixels */
 	s16 height;		/* block height in pixels */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 struct sti_blkmv_outptr {
 	s32 errno;		/* error number on failure */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr; 	/* pointer to future data */
 };
 
 
+/* this internal struct needs to be allocated in low_mem (<4GB)
+ * if used with 32bit STI */
+
+struct sti_all_data {
+	struct sti_glob_cfg glob_cfg;
+	struct sti_glob_cfg_ext glob_cfg_ext;
+
+	struct sti_conf_inptr		inq_inptr;
+	struct sti_conf_outptr		inq_outptr; /* configuration */
+	struct sti_conf_outptr_ext	inq_outptr_ext;
+
+	struct sti_init_inptr_ext	init_inptr_ext;
+	struct sti_init_inptr		init_inptr;
+	struct sti_init_outptr		init_outptr;
+
+	struct sti_blkmv_inptr		blkmv_inptr;
+	struct sti_blkmv_outptr		blkmv_outptr;
+
+	struct sti_font_inptr		font_inptr;
+	struct sti_font_outptr		font_outptr;
+
+	/* leave as last entries */
+	unsigned long save_addr[1024 / sizeof(unsigned long)];
+	   /* min 256 bytes which is STI default, max sti->sti_mem_request */
+	unsigned long sti_mem_addr[256 / sizeof(unsigned long)];
+	/* do not add something below here ! */
+};
+
 /* internal generic STI struct */
 
 struct sti_struct {
@@ -320,6 +356,7 @@ struct sti_struct {
 
 	struct sti_cooked_rom *rom;
 
+	int use_64bit;	/* enabled, if 64bit sti functions are being called. */
 	unsigned long font_unpmv;
 	unsigned long block_move;
 	unsigned long init_graph;
@@ -330,11 +367,9 @@ struct sti_struct {
 	region_t regions[STI_REGION_MAX];
 	unsigned long regions_phys[STI_REGION_MAX];
 
-	struct sti_glob_cfg *glob_cfg;
-	struct sti_cooked_font *font;	/* ptr to selected font (cooked) */
+	struct sti_glob_cfg *glob_cfg;	/* points into sti_all_data */
 
-	struct sti_conf_outptr outptr; /* configuration */
-	struct sti_conf_outptr_ext outptr_ext;
+	struct sti_cooked_font *font;	/* ptr to selected font (cooked) */
 
 	struct pci_dev *pd;
 
@@ -343,6 +378,9 @@ struct sti_struct {
 
 	/* pointer to the fb_info where this STI device is used */
 	struct fb_info *info;
+
+	/* pointer to all internal data */
+	struct sti_all_data *sti_data;
 };
 
 
@@ -350,6 +388,13 @@ struct sti_struct {
 
 struct sti_struct *sti_get_rom(unsigned int index); /* 0: default sti */
 
+
+/* sticore main function to call STI firmware */
+
+int sti_call(const struct sti_struct *sti, unsigned long func, const void *flags,
+		void *inptr, void *outptr, struct sti_glob_cfg *glob_cfg);
+
+
 /* functions to call the STI ROM directly */
 
 void sti_putc(struct sti_struct *sti, int c, int y, int x);
