From: Helge Deller <deller@gmx.de>
Subject: [RFC][PATCH] parisc: Add support for self-extracting kernel
Date: Sun, 20 Aug 2017 10:52:22 +0200
Message-ID: <20170820085222.GA10546@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index dda1f55..3109541 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -17,6 +17,12 @@ config PARISC
 	select BUG
 	select BUILDTIME_EXTABLE_SORT
 	select HAVE_PERF_EVENTS
+	select HAVE_KERNEL_BZIP2
+	select HAVE_KERNEL_GZIP
+	select HAVE_KERNEL_LZ4
+	select HAVE_KERNEL_LZMA
+	select HAVE_KERNEL_LZO
+	select HAVE_KERNEL_XZ
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PCI_IOMAP
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 75cb451..58fae5d 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -24,15 +24,20 @@ KBUILD_DEFCONFIG := default_defconfig
 NM		= sh $(srctree)/arch/parisc/nm
 CHECKFLAGS	+= -D__hppa__=1
 LIBGCC		= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
+export LIBGCC
 
 ifdef CONFIG_64BIT
 UTS_MACHINE	:= parisc64
 CHECKFLAGS	+= -D__LP64__=1 -m64
 CC_ARCHES	= hppa64
+LD_BFD		:= elf64-hppa-linux
 else # 32-bit
 CC_ARCHES	= hppa hppa2.0 hppa1.1
+LD_BFD		:= elf32-hppa-linux
 endif
 
+export LD_BFD
+
 ifneq ($(SUBARCH),$(UTS_MACHINE))
 	ifeq ($(CROSS_COMPILE),)
 		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu
@@ -88,6 +93,8 @@ libs-y	+= arch/parisc/lib/ $(LIBGCC)
 
 drivers-$(CONFIG_OPROFILE)		+= arch/parisc/oprofile/
 
+boot	:= arch/parisc/boot
+
 PALO := $(shell if (which palo 2>&1); then : ; \
 	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
 	fi)
@@ -116,11 +123,14 @@ INSTALL_TARGETS = zinstall install
 
 PHONY += bzImage $(BOOT_TARGETS) $(INSTALL_TARGETS)
 
-bzImage zImage: vmlinuz
+zImage: vmlinuz
 Image: vmlinux
 
-vmlinuz: vmlinux
-	@gzip -cf -9 $< > $@
+bzImage: vmlinux
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+
+vmlinuz: bzImage
+	$(OBJCOPY) $(boot)/bzImage $@
 
 install:
 	$(CONFIG_SHELL) $(src)/arch/parisc/install.sh \
diff --git a/arch/parisc/boot/.gitignore b/arch/parisc/boot/.gitignore
new file mode 100644
index 0000000..017d591
--- /dev/null
+++ b/arch/parisc/boot/.gitignore
@@ -0,0 +1,2 @@
+image
+bzImage
diff --git a/arch/parisc/boot/Makefile b/arch/parisc/boot/Makefile
new file mode 100644
index 0000000..cad68a5
--- /dev/null
+++ b/arch/parisc/boot/Makefile
@@ -0,0 +1,26 @@
+#
+# Makefile for the linux parisc-specific parts of the boot image creator.
+#
+
+COMPILE_VERSION := __linux_compile_version_id__`hostname |  \
+			tr -c '[0-9A-Za-z]' '_'`__`date | \
+			tr -c '[0-9A-Za-z]' '_'`_t
+
+ccflags-y  := -DCOMPILE_VERSION=$(COMPILE_VERSION) -gstabs -I.
+
+targets := image
+targets += bzImage
+subdir- := compressed
+
+$(obj)/image: vmlinux FORCE
+	$(call if_changed,objcopy)
+
+$(obj)/bzImage: $(obj)/compressed/vmlinux FORCE
+	$(call if_changed,objcopy)
+
+$(obj)/compressed/vmlinux: FORCE
+	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
+
+install: $(CONFIGURE) $(obj)/bzImage
+	sh -x  $(srctree)/$(obj)/install.sh $(KERNELRELEASE) $(obj)/bzImage \
+	      System.map "$(INSTALL_PATH)"
diff --git a/arch/parisc/boot/compressed/.gitignore b/arch/parisc/boot/compressed/.gitignore
new file mode 100644
index 0000000..ae06b9b
--- /dev/null
+++ b/arch/parisc/boot/compressed/.gitignore
@@ -0,0 +1,3 @@
+sizes.h
+vmlinux
+vmlinux.lds
diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
new file mode 100644
index 0000000..9b2d304
--- /dev/null
+++ b/arch/parisc/boot/compressed/Makefile
@@ -0,0 +1,87 @@
+#
+# linux/arch/parisc/boot/compressed/Makefile
+#
+# create a compressed self-extracting vmlinux image from the original vmlinux
+#
+
+KCOV_INSTRUMENT := n
+GCOV_PROFILE := n
+UBSAN_SANITIZE := n
+
+targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2
+targets += vmlinux.bin.xz vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.lz4
+targets += misc.o piggy.o sizes.h head.o real2.o firmware.o
+
+KBUILD_CFLAGS := -D__KERNEL__ -O2 -DBOOTLOADER
+KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
+KBUILD_CFLAGS += $(cflags-y) -fno-delete-null-pointer-checks
+KBUILD_CFLAGS += $(call cc-option,-mpacked-stack)
+KBUILD_CFLAGS += -fno-PIE -mno-space-regs
+ifndef CONFIG_64BIT
+KBUILD_CFLAGS += -mfast-indirect-calls
+endif
+
+OBJECTS += $(obj)/head.o $(obj)/real2.o $(obj)/firmware.o $(obj)/misc.o $(obj)/piggy.o
+
+# LDFLAGS_vmlinux := -X --whole-archive -e startup -T
+LDFLAGS_vmlinux := -X -e startup --as-needed -T
+$(obj)/vmlinux: $(obj)/vmlinux.lds $(OBJECTS) $(LIBGCC)
+	$(call if_changed,ld)
+
+sed-sizes := -e 's/^\([0-9a-fA-F]*\) . \(__bss_start\|_end\|parisc_kernel_start\)$$/\#define SZ\2 0x\1/p'
+
+quiet_cmd_sizes = GEN $@
+      cmd_sizes = $(NM) $< | sed -n $(sed-sizes) > $@
+
+$(obj)/sizes.h: vmlinux
+	$(call if_changed,sizes)
+
+AFLAGS_head.o += -I$(objtree)/$(obj) -DBOOTLOADER
+$(obj)/head.o: $(obj)/sizes.h
+
+CFLAGS_misc.o += -I$(objtree)/$(obj)
+$(obj)/misc.o: $(obj)/sizes.h
+
+$(obj)/firmware.o: $(obj)/firmware.c
+$(obj)/firmware.c: $(srctree)/arch/$(SRCARCH)/kernel/firmware.c
+	$(call cmd,shipped)
+
+AFLAGS_real2.o += -DBOOTLOADER
+$(obj)/real2.o: $(obj)/real2.S
+$(obj)/real2.S: $(srctree)/arch/$(SRCARCH)/kernel/real2.S
+	$(call cmd,shipped)
+
+$(obj)/misc.o: $(obj)/sizes.h
+
+CPPFLAGS_vmlinux.lds += -I$(objtree)/$(obj) -DBOOTLOADER
+$(obj)/vmlinux.lds: $(obj)/sizes.h
+
+OBJCOPYFLAGS_vmlinux.bin := -O binary -R .comment -S
+$(obj)/vmlinux.bin: vmlinux
+	$(call if_changed,objcopy)
+
+vmlinux.bin.all-y := $(obj)/vmlinux.bin
+
+suffix-$(CONFIG_KERNEL_GZIP)  := gz
+suffix-$(CONFIG_KERNEL_BZIP2) := bz2
+suffix-$(CONFIG_KERNEL_LZ4)  := lz4
+suffix-$(CONFIG_KERNEL_LZMA)  := lzma
+suffix-$(CONFIG_KERNEL_LZO)  := lzo
+suffix-$(CONFIG_KERNEL_XZ)  := xz
+
+$(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y)
+	$(call if_changed,gzip)
+$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y)
+	$(call if_changed,bzip2)
+$(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y)
+	$(call if_changed,lz4)
+$(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y)
+	$(call if_changed,lzma)
+$(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y)
+	$(call if_changed,lzo)
+$(obj)/vmlinux.bin.xz: $(vmlinux.bin.all-y)
+	$(call if_changed,xzkern)
+
+LDFLAGS_piggy.o := -r --format binary --oformat $(LD_BFD) -T
+$(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y)
+	$(call if_changed,ld)
diff --git a/arch/parisc/boot/compressed/head.S b/arch/parisc/boot/compressed/head.S
new file mode 100644
index 0000000..5aba20f
--- /dev/null
+++ b/arch/parisc/boot/compressed/head.S
@@ -0,0 +1,85 @@
+/*
+ * Startup glue code to uncompress the kernel
+ *
+ *   (C) 2017 Helge Deller <deller@gmx.de>
+ */
+
+#include <linux/init.h>
+#include <linux/linkage.h>
+#include <asm/asm-offsets.h>
+#include <asm/page.h>
+#include <asm/psw.h>
+#include <asm/pdc.h>
+#include <asm/assembly.h>
+#include "sizes.h"
+
+#define BOOTADDR(x)	(x)
+
+#ifndef CONFIG_64BIT
+	.import	$global$		/* forward declaration */
+#endif /*!CONFIG_64BIT*/
+
+	__HEAD
+
+ENTRY(startup)
+	 .level LEVEL
+
+#define PSW_W_SM	0x200
+#define PSW_W_BIT       36
+
+	;! nuke the W bit, saving original value
+	.level 2.0
+	rsm	PSW_W_SM, %r1
+
+	.level 1.1
+	extrw,u	%r1, PSW_W_BIT-32, 1, %r1
+	copy	%r1, %arg0
+
+	/* Make sure sr4-sr7 are set to zero for the kernel address space */
+	mtsp    %r0,%sr4
+	mtsp    %r0,%sr5
+	mtsp    %r0,%sr6
+	mtsp    %r0,%sr7
+
+	/* Clear BSS */
+
+	.import _bss,data
+	.import _ebss,data
+
+	load32	BOOTADDR(_bss),%r3
+	load32	BOOTADDR(_ebss),%r4
+	ldo	FRAME_SIZE(%r4),%sp	/* stack at end of bss */
+$bss_loop:
+	cmpb,<<,n %r3,%r4,$bss_loop
+	stw,ma	%r0,4(%r3)
+
+	/* Initialize the global data pointer */
+	loadgp
+
+	/* arg0..arg4 were set by palo. */
+	copy	%arg1, %r6		/* command line */
+	copy	%arg2, %r7		/* rd-start */
+	copy	%arg3, %r8		/* rd-end */
+	load32	BOOTADDR(decompress_kernel),%r3
+
+#ifdef CONFIG_64BIT
+	.level LEVEL
+	ssm	PSW_W_SM, %r0		/* set W-bit */
+	depdi	0, 31, 32, %r3
+#endif
+	load32	BOOTADDR(startup_continue), %r2
+	bv,n	0(%r3)
+
+startup_continue:
+#ifdef CONFIG_64BIT
+	.level LEVEL
+	rsm	PSW_W_SM, %r0		/* clear W-bit */
+#endif
+
+	load32	KERNEL_BINARY_TEXT_START, %arg0 /* free mem */
+	copy	%r6, %arg1		/* command line */
+	copy	%r7, %arg2		/* rd-start */
+	copy	%r8, %arg3		/* rd-end */
+
+	bv,n	0(%ret0)
+END(startup)
diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compressed/misc.c
new file mode 100644
index 0000000..248e232
--- /dev/null
+++ b/arch/parisc/boot/compressed/misc.c
@@ -0,0 +1,301 @@
+/*
+ * Definitions and wrapper functions for kernel decompressor
+ *
+ *   (C) 2017 Helge Deller <deller@gmx.de>
+ */
+
+#include <linux/uaccess.h>
+#include <asm/unaligned.h>
+#include <asm/page.h>
+#include "sizes.h"
+
+/*
+ * gzip declarations
+ */
+#define STATIC static
+
+#undef memmove
+#define memmove memmove
+#define memzero(s, n) memset((s), 0, (n))
+
+#define malloc	malloc_gzip
+#define free	free_gzip
+
+/* Symbols defined by linker scripts */
+extern char input_data[];
+extern int input_len;
+extern __le32 output_len;	/* at unaligned address, little-endian */
+extern char _text, _end;
+extern char _bss, _ebss;
+extern char _startcode_end;
+extern void startup_continue(void *entry, unsigned long cmdline,
+	unsigned long rd_start, unsigned long rd_end) __noreturn;
+
+void error(char *m) __noreturn;
+
+static unsigned long free_mem_ptr;
+static unsigned long free_mem_end_ptr;
+
+#ifdef CONFIG_KERNEL_GZIP
+#include "../../../../lib/decompress_inflate.c"
+#endif
+
+#ifdef CONFIG_KERNEL_BZIP2
+#include "../../../../lib/decompress_bunzip2.c"
+#endif
+
+#ifdef CONFIG_KERNEL_LZ4
+#include "../../../../lib/decompress_unlz4.c"
+#endif
+
+#ifdef CONFIG_KERNEL_LZMA
+#include "../../../../lib/decompress_unlzma.c"
+#endif
+
+#ifdef CONFIG_KERNEL_LZO
+#include "../../../../lib/decompress_unlzo.c"
+#endif
+
+#ifdef CONFIG_KERNEL_XZ
+#include "../../../../lib/decompress_unxz.c"
+#endif
+
+void *memmove(void *dest, const void *src, size_t n)
+{
+	const char *s = src;
+	char *d = dest;
+
+	if (d <= s) {
+		while (n--)
+			*d++ = *s++;
+	} else {
+		d += n;
+		s += n;
+		while (n--)
+			*--d = *--s;
+	}
+	return dest;
+}
+
+void *memset(void *s,int c, size_t count)
+{
+	char *xs = (char *)s;
+
+	while (count--)
+		*xs++ = c;
+	return s;
+}
+
+void *memcpy(void *d, const void *s, size_t len)
+{
+	char *dest = (char *)d;
+	const char *source = (const char *)s;
+
+	while (len--)
+		*dest++ = *source++;
+	return d;
+}
+
+size_t strlen(const char *s)
+{
+        const char *sc;
+
+        for (sc = s; *sc != '\0'; ++sc)
+                /* nothing */;
+        return sc - s;
+}
+
+char *strchr(const char *s, int c)
+{
+	while (*s) {
+		if (*s == (char)c)
+			return (char *)s;
+		++s;
+	}
+	return NULL;
+}
+
+int puts(const char *s)
+{
+    const char *nuline = s;
+
+    while ((nuline = strchr(s, '\n')) != NULL)
+    {
+	if (nuline != s)
+		pdc_iodc_print(s, nuline - s);
+	pdc_iodc_print("\r\n", 2);
+	s = nuline + 1;
+    }
+    if (*s != '\0')
+	pdc_iodc_print(s, strlen(s));
+    return 0;
+}
+
+static int putchar(int c)
+{
+    char buf[2];
+
+    buf[0] = c;
+    buf[1] = '\0';
+    puts(buf);
+    return c;
+}
+
+void __noreturn error(char *x)
+{
+	puts("\n\n");
+	puts(x);
+	puts("\n\n -- System halted");
+	while (1) /* wait forever. */;
+}
+
+static int print_hex(unsigned long num)
+{
+	const char hex[] = "0123456789abcdef";
+	char str[40];
+	int i = sizeof(str)-1;
+
+	str[i--] = '\0';
+	do {
+		str[i--] = hex[num & 0x0f];
+		num >>= 4;
+	} while (num);
+
+	str[i--] = 'x';
+	str[i] = '0';
+	puts(&str[i]);
+
+	return 0;
+}
+
+int printk(const char *fmt, ...)
+{
+	va_list args;
+	int i = 0;
+
+	va_start(args, fmt);
+
+	while (fmt[i]) {
+		if (fmt[i] != '%') {
+put:
+			putchar(fmt[i++]);
+			continue;
+		}
+
+		if (fmt[++i] == '%')
+			goto put;
+		++i;
+		print_hex(va_arg(args, unsigned long));
+	}
+
+	va_end(args);
+	return 0;
+}
+
+/* helper functions for libgcc */
+void abort(void)
+{
+	error("abort() called.");
+}
+
+#undef malloc
+void *malloc(size_t size)
+{
+	return malloc_gzip(size);
+}
+
+#undef free
+void free(void *ptr)
+{
+	return free_gzip(ptr);
+}
+
+
+static void flush_data_cache(char *start, unsigned long length)
+{
+    char *end = start + length;
+
+    do
+    {
+	asm volatile("fdc 0(%0)" : : "r" (start));
+	asm volatile("fic 0(%%sr0,%0)" : : "r" (start));
+	start += 16;
+    } while (start < end);
+    asm volatile("fdc 0(%0)" : : "r" (end));
+
+    asm ("sync");
+}
+
+unsigned long decompress_kernel(unsigned int started_wide,
+		unsigned int command_line,
+		const unsigned int rd_start,
+		const unsigned int rd_end)
+{
+	char *output;
+	unsigned long len, len_all;
+
+#ifdef CONFIG_64BIT
+	parisc_narrow_firmware = 0;
+#endif
+
+	set_firmware_width_unlocked();
+
+	putchar('U');	/* if you get this p and no more, string storage */
+			/* in $GLOBAL$ is wrong or %dp is wrong */
+	puts("ncompressing ...\n");
+
+	output = (char *) KERNEL_BINARY_TEXT_START;
+	len_all = __pa(SZ_end) - __pa(SZparisc_kernel_start);
+
+	if ((unsigned long) &_startcode_end > (unsigned long) output)
+		error("Bootcode overlaps kernel code");
+
+	len = get_unaligned_le32(&output_len);
+	if (len > len_all)
+		error("Output len too big.");
+	else
+		memset(&output[len], 0, len_all - len);
+
+	/*
+	 * Initialize free_mem_ptr and free_mem_end_ptr.
+	 */
+	free_mem_ptr = (unsigned long) &_ebss;
+	free_mem_ptr += 2*1024*1024;	/* leave 2 MB for stack */
+
+	/* Limit memory for bootoader to 1GB */
+	#define ARTIFICIAL_LIMIT (1*1024*1024*1024)
+	free_mem_end_ptr = PAGE0->imm_max_mem;
+	if (free_mem_end_ptr > ARTIFICIAL_LIMIT)
+		free_mem_end_ptr = ARTIFICIAL_LIMIT;
+
+#ifdef CONFIG_BLK_DEV_INITRD
+	/* if we have ramdisk this is at end of memory */
+	if (rd_start && rd_start < free_mem_end_ptr)
+		free_mem_end_ptr = rd_start;
+#endif
+
+#ifdef DEBUG
+	printk("startcode_end = %x\n", &_startcode_end);
+	printk("commandline   = %x\n", command_line);
+	printk("rd_start      = %x\n", rd_start);
+	printk("rd_end        = %x\n", rd_end);
+
+	printk("free_ptr      = %x\n", free_mem_ptr);
+	printk("free_ptr_end  = %x\n", free_mem_end_ptr);
+
+	printk("input_data    = %x\n", input_data);
+	printk("input_len     = %x\n", input_len);
+	printk("output        = %x\n", output);
+	printk("output_len    = %x\n", len);
+	printk("output_max    = %x\n", len_all);
+#endif
+
+	__decompress(input_data, input_len, NULL, NULL,
+			output, 0, NULL, error);
+
+	flush_data_cache(output, len);
+
+	printk("Booting kernel ...\n\n");
+
+	return (unsigned long) output;
+}
diff --git a/arch/parisc/boot/compressed/vmlinux.lds.S b/arch/parisc/boot/compressed/vmlinux.lds.S
new file mode 100644
index 0000000..a4ce331
--- /dev/null
+++ b/arch/parisc/boot/compressed/vmlinux.lds.S
@@ -0,0 +1,101 @@
+#include <asm-generic/vmlinux.lds.h>
+#include <asm/page.h>
+#include "sizes.h"
+
+#ifndef CONFIG_64BIT
+OUTPUT_FORMAT("elf32-hppa-linux")
+OUTPUT_ARCH(hppa)
+#else
+OUTPUT_FORMAT("elf64-hppa-linux")
+OUTPUT_ARCH(hppa:hppa2.0w)
+#endif
+
+ENTRY(startup)
+
+SECTIONS
+{
+	/* palo loads at 0x60000 */
+	/* loaded kernel will move to 0x10000 */
+	. = 0xe0000;    /* should not overwrite palo code */
+
+	.head.text : {
+		_head = . ;
+		HEAD_TEXT
+		_ehead = . ;
+	}
+
+	/* keep __gp below 0x1000000 */
+#ifdef CONFIG_64BIT
+	. = ALIGN(16);
+	/* Linkage tables */
+	.opd : {
+		*(.opd)
+	} PROVIDE (__gp = .);
+	.plt : {
+		*(.plt)
+	}
+	.dlt : {
+		*(.dlt)
+	}
+#endif
+	_startcode_end = .;
+
+	/* bootloader code and data starts behind area of extracted kernel */
+	. = (SZ_end - SZparisc_kernel_start + KERNEL_BINARY_TEXT_START);
+
+	/* align on next page boundary */
+	. = ALIGN(4096);
+	.text :	{
+		_text = .;	/* Text */
+		*(.text)
+		*(.text.*)
+		_etext = . ;
+	}
+	. = ALIGN(8);
+	.data :	{
+		_data = . ;
+		*(.data)
+		*(.data.*)
+		_edata = . ;
+	}
+	. = ALIGN(8);
+	.rodata : {
+		_rodata = . ;
+		*(.rodata)	 /* read-only data */
+		*(.rodata.*)
+		_erodata = . ;
+	}
+	. = ALIGN(8);
+	.rodata.compressed : {
+		*(.rodata.compressed)
+	}
+	. = ALIGN(8);
+	.bss : {
+		_bss = . ;
+		*(.bss)
+		*(.bss.*)
+		*(COMMON)
+		. = ALIGN(4096);
+		_ebss = .;
+	}
+
+	STABS_DEBUG
+	.note 0 : { *(.note) }
+
+	/* Sections to be discarded */
+	DISCARDS
+	/DISCARD/ : {
+#ifdef CONFIG_64BIT
+		/* temporary hack until binutils is fixed to not emit these
+		 * for static binaries
+		 */
+		*(.PARISC.unwind)	/* no unwind data */
+		*(.interp)
+		*(.dynsym)
+		*(.dynstr)
+		*(.dynamic)
+		*(.hash)
+		*(.gnu.hash)
+#endif
+	}
+}
diff --git a/arch/parisc/boot/compressed/vmlinux.scr b/arch/parisc/boot/compressed/vmlinux.scr
new file mode 100644
index 0000000..dac2d14
--- /dev/null
+++ b/arch/parisc/boot/compressed/vmlinux.scr
@@ -0,0 +1,10 @@
+SECTIONS
+{
+  .rodata.compressed : {
+	input_len = .;
+	LONG(input_data_end - input_data) input_data = .;
+	*(.data)
+	output_len = . - 4; /* can be at unaligned address */
+	input_data_end = .;
+	}
+}
diff --git a/arch/parisc/boot/install.sh b/arch/parisc/boot/install.sh
new file mode 100644
index 0000000..8f7c365
--- /dev/null
+++ b/arch/parisc/boot/install.sh
@@ -0,0 +1,65 @@
+#!/bin/sh
+#
+# arch/parisc/install.sh, derived from arch/i386/boot/install.sh
+#
+# This file is subject to the terms and conditions of the GNU General Public
+# License.  See the file "COPYING" in the main directory of this archive
+# for more details.
+#
+# Copyright (C) 1995 by Linus Torvalds
+#
+# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
+#
+# "make install" script for i386 architecture
+#
+# Arguments:
+#   $1 - kernel version
+#   $2 - kernel image file
+#   $3 - kernel map file
+#   $4 - default install path (blank if root directory)
+#
+
+verify () {
+	if [ ! -f "$1" ]; then
+		echo ""                                                   1>&2
+		echo " *** Missing file: $1"                              1>&2
+		echo ' *** You need to run "make" before "make install".' 1>&2
+		echo ""                                                   1>&2
+		exit 1
+	fi
+}
+
+# Make sure the files actually exist
+
+verify "$2"
+verify "$3"
+
+# User may have a custom install script
+
+if [ -n "${INSTALLKERNEL}" ]; then
+  if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
+  if [ -x /sbin/${INSTALLKERNEL} ]; then exec /sbin/${INSTALLKERNEL} "$@"; fi
+fi
+
+# Default install
+
+if [ "$(basename $2)" = "zImage" ]; then
+# Compressed install
+  echo "Installing compressed kernel"
+  base=vmlinuz
+else
+# Normal install
+  echo "Installing normal kernel"
+  base=vmlinux
+fi
+
+if [ -f $4/$base-$1 ]; then
+  mv $4/$base-$1 $4/$base-$1.old
+fi
+cat $2 > $4/$base-$1
+
+# Install system map file
+if [ -f $4/System.map-$1 ]; then
+  mv $4/System.map-$1 $4/System.map-$1.old
+fi
+cp $3 $4/System.map-$1
diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
index 80e742a..bfed09d 100644
--- a/arch/parisc/include/asm/page.h
+++ b/arch/parisc/include/asm/page.h
@@ -116,11 +116,15 @@ extern int npmem_ranges;
 /* This governs the relationship between virtual and physical addresses.
  * If you alter it, make sure to take care of our various fixed mapping
  * segments in fixmap.h */
+#if defined(BOOTLOADER)
+#define __PAGE_OFFSET	(0)		/* bootloader uses physical addresses */
+#else
 #ifdef CONFIG_64BIT
 #define __PAGE_OFFSET	(0x40000000)	/* 1GB */
 #else
 #define __PAGE_OFFSET	(0x10000000)	/* 256MB */
 #endif
+#endif /* BOOTLOADER */
 
 #define PAGE_OFFSET		((unsigned long)__PAGE_OFFSET)
 
diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 7569627..26b4455 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -5,6 +5,8 @@
 
 #if !defined(__ASSEMBLY__)
 
+extern int parisc_narrow_firmware;
+
 extern int pdc_type;
 extern unsigned long parisc_cell_num; /* cell number the CPU runs on (PAT) */
 extern unsigned long parisc_cell_loc; /* cell location of CPU (PAT)	   */
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index f622a31..41efeed 100644
--- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -69,7 +69,15 @@
 #include <asm/pdcpat.h>
 #include <asm/processor.h>	/* for boot_cpu_data */
 
+#if defined(BOOTLOADER)
+# undef  spin_lock_irqsave
+# define spin_lock_irqsave(a,b) b = 1
+# undef  spin_unlock_irqrestore
+# define spin_unlock_irqrestore(a,b)
+#else
 static DEFINE_SPINLOCK(pdc_lock);
+#endif
+
 extern unsigned long pdc_result[NUM_PDC_RESULT];
 extern unsigned long pdc_result2[NUM_PDC_RESULT];
 
@@ -186,6 +194,8 @@ void set_firmware_width(void)
 }
 #endif /*CONFIG_64BIT*/
 
+
+#if !defined(BOOTLOADER)
 /**
  * pdc_emergency_unlock - Unlock the linux pdc lock
  *
@@ -1143,6 +1153,8 @@ void pdc_io_reset_devices(void)
 	spin_unlock_irqrestore(&pdc_lock, flags);
 }
 
+#endif /* defined(BOOTLOADER) */
+
 /* locked by pdc_console_lock */
 static int __attribute__((aligned(8)))   iodc_retbuf[32];
 static char __attribute__((aligned(64))) iodc_dbuf[4096];
@@ -1187,6 +1199,7 @@ int pdc_iodc_print(const unsigned char *str, unsigned count)
 	return i;
 }
 
+#if !defined(BOOTLOADER)
 /**
  * pdc_iodc_getc - Read a character (non-blocking) from the PDC console.
  *
@@ -1524,6 +1537,7 @@ int pdc_pat_mem_get_dimm_phys_location(
 	return retval;
 }
 #endif /* CONFIG_64BIT */
+#endif /* defined(BOOTLOADER) */
 
 
 /***************** 32-bit real-mode calls ***********/
@@ -1633,4 +1647,3 @@ long real64_call(unsigned long fn, ...)
 }
 
 #endif /* CONFIG_64BIT */
-
diff --git a/arch/parisc/kernel/real2.S b/arch/parisc/kernel/real2.S
index 1db58e5..cc99634 100644
--- a/arch/parisc/kernel/real2.S
+++ b/arch/parisc/kernel/real2.S
@@ -162,6 +162,7 @@ ENDPROC_CFI(restore_control_regs)
 	.text
 	.align 128
 ENTRY_CFI(rfi_virt2real)
+#if !defined(BOOTLOADER)
 	/* switch to real mode... */
 	rsm		PSW_SM_I,%r0
 	load32		PA(rfi_v2r_1), %r1
@@ -191,6 +192,7 @@ ENTRY_CFI(rfi_virt2real)
 	nop
 rfi_v2r_1:
 	tophys_r1 %r2
+#endif /* defined(BOOTLOADER) */
 	bv	0(%r2)
 	nop
 ENDPROC_CFI(rfi_virt2real)
@@ -198,6 +200,7 @@ ENDPROC_CFI(rfi_virt2real)
 	.text
 	.align 128
 ENTRY_CFI(rfi_real2virt)
+#if !defined(BOOTLOADER)
 	rsm		PSW_SM_I,%r0
 	load32		(rfi_r2v_1), %r1
 	nop
@@ -226,6 +229,7 @@ ENTRY_CFI(rfi_real2virt)
 	nop
 rfi_r2v_1:
 	tovirt_r1 %r2
+#endif /* defined(BOOTLOADER) */
 	bv	0(%r2)
 	nop
 ENDPROC_CFI(rfi_real2virt)
