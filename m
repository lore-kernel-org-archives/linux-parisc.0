Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 2DE79482A
	for <parisc-linux@parisc-linux.org>; Sat, 18 Aug 2001 13:39:08 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <willy@ldl.fc.hp.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Turn off CONFIG_PCI
Date: Sat, 18 Aug 2001 21:37:06 +0200
References: <E15Xdn8-0000kt-00@chrysl>
In-Reply-To: <E15Xdn8-0000kt-00@chrysl>
MIME-Version: 1.0
Message-Id: <20010818193908.2DE79482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthew,

I tested your patch sucessfully on my c3k and my 715/64.
I've only added a small security check to setup.c to prevent PA2.x machines
from booting without CONFIG_PCI and to print a small panic-message
at bootup instead of just HPMC'ing.
Please commit if nobody else complains, 

Greetings,
Helge

Index: linux/arch/parisc/kernel/setup.c
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/setup.c,v
retrieving revision 1.88
diff -u -r1.88 setup.c
--- setup.c	2001/08/16 20:57:18	1.88
+++ setup.c	2001/08/18 19:21:47
@@ -401,6 +401,18 @@
 	cache_init();
 	paging_init();
 
+#ifndef CONFIG_PCI
+	/* security check: PA2.x processor machines won't detect their main
+	 * PCI-based devices (screen, serial, SCSI, ...), so it's better to
+	 * stop them from booting right here. If we would continue we would
+	 * only get a HPMC without any other information. */
+	if (boot_cpu_data.cpu_type >= pcxu) { /* >=PA8000 (PCX-U) CPU ? */
+		/* switch back to PDC console for panic */
+		pdc_console_restart();
+		panic("This system will not boot without PCI-support in the kernel !\n");
+	}
+#endif
+	
 #ifdef CONFIG_CHASSIS_LCD_LED
 	/* initialize the LCD/LED after boot_cpu_data is available ! */
         led_init();				/* LCD/LED initialization */
Index: linux/drivers/char/serial.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/char/serial.c,v
retrieving revision 1.25
diff -u -r1.25 serial.c
--- serial.c	2001/08/17 06:10:06	1.25
+++ serial.c	2001/08/18 19:21:56
@@ -414,11 +414,7 @@
 		return readb((unsigned long) info->iomem_base +
 			     (offset<<info->iomem_reg_shift));
 	default:
-#if defined(CONFIG_PCI) || defined(CONFIG_ISA)
 		return inb(info->port + offset);
-#else
-		BUG();
-#endif
 	}
 }
 
@@ -437,11 +433,7 @@
 			      (offset<<info->iomem_reg_shift));
 		break;
 	default:
-#if defined(CONFIG_PCI) || defined(CONFIG_ISA)
 		outb(value, info->port+offset);
-#else
-		BUG();
-#endif
 	}
 }
 
Index: linux/include/asm-parisc/io.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/io.h,v
retrieving revision 1.22
diff -u -r1.22 io.h
--- io.h	2001/07/15 22:30:29	1.22
+++ io.h	2001/08/18 19:22:08
@@ -43,9 +43,6 @@
 #endif /* USE_HPPA_IOREMAP */
 
 #if defined(CONFIG_PCI) || defined(CONFIG_ISA)
-/*
- *	So we get clear link errors 
- */
 extern unsigned char inb(unsigned long addr);
 extern unsigned short inw(unsigned long addr);
 extern unsigned int inl(unsigned long addr);
@@ -53,7 +50,28 @@
 extern void outb(unsigned char b, unsigned long addr);
 extern void outw(unsigned short b, unsigned long addr);
 extern void outl(unsigned int b, unsigned long addr);
+#else
+static inline char inb(unsigned long addr)
+{
+	BUG();
+	return -1;
+}
 
+static inline short inw(unsigned long addr)
+{
+	BUG();
+	return -1;
+}
+
+static inline int inl(unsigned long addr)
+{
+	BUG();
+	return -1;
+}
+
+#define outb(x, y)	BUG()
+#define outw(x, y)	BUG()
+#define outl(x, y)	BUG()
 #endif
 
 extern void memcpy_fromio(void *dest, unsigned long src, int count);




On Friday 17 August 2001 09:11, Matthew Wilcox wrote:
> A number of people have been asking for the ability to turn off CONFIG_PCI,
> and while I was reviewing the outstanding diff vs 2.4.9, I noticed I could
> take out some of the patch if I just made some slight alterations.  Please
> test this patch; it compiles for me.
>
... <original patch deleted>...
