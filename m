Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hptux.heylan (p50841CD1.dip.t-dialin.net [80.132.28.209])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CF944829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 18:27:11 -0600 (MDT)
Date: Fri, 20 Sep 2002 02:27:01 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: parisc-linux@lists.parisc-linux.org
Cc: Petr Vandrovec <vandrove@vc.cvut.cz>
Message-ID: <20020920002700.GY22068@gate450.dyndns.org>
References: <20020821232010.GD15344@gate450.dyndns.org> <20020822225054.GA24190@ppc.vc.cvut.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="hUH5gZbnpyIv7Mn4"
In-Reply-To: <20020822225054.GA24190@ppc.vc.cvut.cz>
Subject: [parisc-linux] partial success with matroxfb
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello list,

here is a report about my experiments with a "Matrox Mystique" in
a C200. The attached diff shows the _temporary_ changes I made to the
matroxfb.

I replaced the {read,write}{b,w,l} calls to their __raw equivalents,
because Petr Vandrovec told me that matroxfb expects them to do BE to
PCI on BE machines. I had no success when running the card in LE mode.

After modprobing the module with noinit=0 the frame buffer seems to be 
up and working. I can use fbset on the device and display text by 
writing to /dev/tty1. But as soon as there is much traffic (like ping
-f through a NIC or disk i/o) on the PCI bus, the kernel hangs. 

testing was done with 2.4.19-pa17

This is the output of PIM after doing a TOC:

=============

-----------------  Processor 0 HPMC Information ------------------

Timestamp =   Mon Sep  16 01:49:14 GMT 2002    (20:02:09:16:01:49:14)

HPMC Chassis Codes = 0xcbf0  0x5002  0x540f  0x5508  0xcbfb  

General Registers 0 - 31
00-03   0000000000000000  fffffffffff0bdc0  00000000f3ef8000  00000000f3ef8002
04-07   000000001fb9d940  000000000000000f  000000000000003b  00000000103d2010
08-11   000000000000000f  000000000000004d  000000000004000e  00000000103705ac
12-15   0000000000000000  0000000000000000  00000000000000fd  00000000f0100000
16-19   00000000103b45c0  00000000f000020c  00000000f0000204  00000000000000de
20-23   000000000000000e  00000000000003e8  000000000bebc200  00000000000f4240
24-27   0000000000000000  00000000000f4240  05f5e10000000032  00000000102fa010
28-31   000000001fb9dd6c  17d78400000000c8  00000000103b4980  000000000004d518

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   00000000000000a0  0000000000000000  00000000000000c0  000000000000001f
12-15   0000000000000000  0000000000000000  0000000000107000  00000000f0000000
16-19   00000024a0d4f160  0000000000000000  000000000004d534  0000000000141860
20-23   0000000000000000  0000000000000000  000000ff0004fc0c  0000000000000000
24-27   000000000031c000  000000000f022000  00000000ffffffff  00000000ffffffff
28-31   00000000ffffffff  00000000ffffffff  00000000103b4000  00000000103b8000

Space Registers 0 - 7
00-03   00000000          00000000          00000000          00000050
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000000004d538
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00305004
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fff3ef8002
System Requestor Address     = 0xfffffffffffa0000
Check Summary                = 0x8000000810004000
Available Memory             = 0x0000000000000000
CPU Diagnose Register 2      = 0x0501000000000004
CPU Status Register 0        = 0x1420c20000000000
CPU Status Register 1        = 0x8000000800000000
SADD LOG                     = 0x7f1fde477f7fde47
Read Short LOG               = 0xc10200fff3ef8002

<Press any key to continue (q to quit)> 

Memory Error Log Information:

Timestamp =   Mon Sep  16 01:49:14 GMT 2002    (20:02:09:16:01:49:14)

   No memory errors logged


I/O Module Error Log Information:

Timestamp =   Mon Sep  16 01:49:16 GMT 2002    (20:02:09:16:01:49:16)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Responder
--- ---------- ---------------- -------- -- -- ---- ----- ---------- ----------
 0  0xfff88000 I/O Adapter      8         2  0  he   0x3d 0xf2000000 0x000a1000 
 0  0xfff8a000 I/O Adapter      10        2  2  he   0x0d 0x00000000 0x00000000 

=============

I suspect that there's something wrong with the pci bus, but I couldn't
decode it further.

here is the log from modprobing the module:

================
matroxfb: Matrox Mystique 220 (PCI) detected
matroxfb: Your Matrox device does not have BIOS
post_shift_max: 3
ref_freq: 14318
freq: 133333
vco_freq_min: 62000
in_div_min: 1
in_div_max: 31
feed_div_min: 100
feed_div_max: 127
fmax: 220000
clk: 0C 78 00 14318 133267 66666
requested 640*480/8bpp (640*6547)
matroxfb: 640x480x8bpp (virtual: 640x6547)
matroxfb: framebuffer at 0xF3000000, mapped to 0xf3000000, size
4194304
requested 640*480/8bpp (640*6547)
post_shift_max: 3
ref_freq: 14318
freq: 25175
vco_freq_min: 62000
in_div_min: 1
in_div_max: 31
feed_div_min: 100
feed_div_max: 127
fmax: 220000
clk: 08 7E 03 14318 202042 50350
matroxfb: Pixel PLL not locked after 5 secs
MiscOutReg: 8B
SEQ regs:   00:01:0F:00:0E:
GDC regs:   00:00:00:00:00:40:05:0F:FF:
CRTC regs:
5F:4F:4F:83:51:9D:0B:3E:00:40:00:00:00:00:00:00:E9:2B:DF:28:00:DF:0C:C3:FF:
ATTR regs:
00:01:02:03:04:05:06:07:08:09:0A:0B:0C:0D:0E:0F:41:FF:0F:00:00:
requested 640*480/8bpp (640*6547)
post_shift_max: 3
ref_freq: 14318
freq: 25175
vco_freq_min: 62000
in_div_min: 1
in_div_max: 31
feed_div_min: 100
feed_div_max: 127
fmax: 220000
clk: 08 7E 03 14318 202042 50350
MiscOutReg: 8B
SEQ regs:   00:01:0F:00:0E:
GDC regs:   00:00:00:00:00:40:05:0F:FF:
CRTC regs:
5F:4F:4F:83:51:9D:0B:3E:00:40:00:00:00:00:00:00:E9:2B:DF:28:00:DF:0C:C3:FF:
ATTR regs:
00:01:02:03:04:05:06:07:08:09:0A:0B:0C:0D:0E:0F:41:FF:0F:00:00:
Console: switching to colour frame buffer device 80x30
fb0: MATROX VGA frame buffer device

=============

anotherhpmachien:~# cat /proc/pci 
PCI devices found:
  Bus  0, device   1, function  0:
    VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG [Mystique] (rev 3).
      IRQ 97.
      Master Capable.  Latency=248.  
      Prefetchable 32 bit memory at 0xf3000000 [0xf37fffff].
      Non-prefetchable 32 bit memory at 0xf3ffc000 [0xf3ffffff].
  Bus  0, device  19, function  0:
    SCSI storage controller: LSI Logic / Symbios Logic (formerly NCR) 53c875 (rev 4).
      IRQ 99.
      Master Capable.  Latency=255. Min Gnt=17.Max Lat=64.
      I/O at 0xfe00 [0xfeff].
      Non-prefetchable 32 bit memory at 0xf3ff9000 [0xf3ff90ff].
      Non-prefetchable 32 bit memory at 0xf3ffa000 [0xf3ffafff].
  Bus  0, device  20, function  0:
    Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 48).
      IRQ 96.
      Master Capable.  Latency=255.  Min Gnt=20.Max Lat=40.
      I/O at 0xff00 [0xff7f].
      Non-prefetchable 32 bit memory at 0xf3ffb000 [0xf3ffb07f].

=============
anotherhpmachien:~# cat /proc/iomem 
00000000-0fffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-002f3fff : Kernel code
  002f4000-003f9f3f : Kernel data
f0190001-f0190001 : led_data
f1000000-f1ffffff : GSC Bus [10/]
  f1000000-f1000fff : Cujo
f2000000-f3ffffff : GSC Bus [8/]
  f2000000-f2000fff : Dino
  f2003000-f2003fff : Serial RS232
  f2800000-f2ffffff : Dino LMMIO
  f3000000-f37fffff : matroxfb FB
  f3ffb000-f3ffb07f : tulip
  f3ffc000-f3ffffff : matroxfb MMIO
f4000000-fff7ffff : GSC Bus [8/]
  ffd00000-ffdfffff : Lasi
    ffd00000-ffd00fff : Lasi
    ffd02000-ffd02fff : Parallel
    ffd04000-ffd04fff : Lasi Harmony
    ffd05000-ffd05fff : Serial RS232
    ffd06000-ffd06fff : Lasi SCSI
    ffd08000-ffd08fff : Lasi psaux
fff80000-fffaffff : Central Bus
  fff88000-fff88fff : U2/Uturn
  fff8a000-fff8afff : U2/Uturn
  fffa0000-fffa0fff : CPU
fffb0000-fffdffff : Local Broadcast
fffe0000-ffffffff : Global Broadcast

thanks
andreas

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="temporary-changes.diff"

--- linux/drivers/video/matrox/matroxfb_base.h	Mon Aug  5 02:12:55 2002
+++ linux/drivers/video/matrox/matroxfb_base.h	Fri Sep 20 01:13:54 2002
@@ -10,10 +10,12 @@
 
 /* general, but fairly heavy, debugging */
 #undef MATROXFB_DEBUG
+#define MATROXFB_DEBUG
 
 /* heavy debugging: */
 /* -- logs putc[s], so everytime a char is displayed, it's logged */
 #undef MATROXFB_DEBUG_HEAVY
+#define MATROXFB_DEBUG_HEAVY
 
 /* This one _could_ cause infinite loops */
 /* It _does_ cause lots and lots of messages during idle loops */
@@ -21,9 +23,11 @@
 
 /* Debug register calls, too? */
 #undef MATROXFB_DEBUG_REG
+#define MATROXFB_DEBUG_REG
 
 /* Guard accelerator accesses with spin_lock_irqsave... */
 #undef MATROXFB_USE_SPINLOCKS
+#define MATROXFB_USE_SPINLOCKS
 
 #include <linux/config.h>
 #include <linux/module.h>
@@ -108,7 +112,7 @@
 #endif
 #endif
 
-#if defined(__alpha__) || defined(__m68k__)
+#if defined(__alpha__) || defined(__m68k__) || defined(__hppa__)
 #define READx_WORKS
 #define MEMCPYTOIO_WORKS
 #else
@@ -174,27 +178,33 @@
 
 #ifdef READx_WORKS
 static inline unsigned int mga_readb(vaddr_t va, unsigned int offs) {
+	return __raw_readb(va.vaddr + offs);
 	return readb(va.vaddr + offs);
 }
 
 static inline unsigned int mga_readw(vaddr_t va, unsigned int offs) {
+	return __raw_readw(va.vaddr + offs);
 	return readw(va.vaddr + offs);
 }
 
 static inline u_int32_t mga_readl(vaddr_t va, unsigned int offs) {
+	return __raw_readl(va.vaddr + offs);
 	return readl(va.vaddr + offs);
 }
 
 static inline void mga_writeb(vaddr_t va, unsigned int offs, u_int8_t value) {
-	writeb(value, va.vaddr + offs);
+//	writeb(value, va.vaddr + offs);
+	__raw_writeb(value, va.vaddr + offs);
 }
 
 static inline void mga_writew(vaddr_t va, unsigned int offs, u_int16_t value) {
-	writew(value, va.vaddr + offs);
+//	writew(value, va.vaddr + offs);	
+	__raw_writew(value, va.vaddr + offs);
 }
 
 static inline void mga_writel(vaddr_t va, unsigned int offs, u_int32_t value) {
-	writel(value, va.vaddr + offs);
+//	writel(value, va.vaddr + offs);	
+	__raw_writel(value, va.vaddr + offs);
 }
 #else
 static inline unsigned int mga_readb(vaddr_t va, unsigned int offs) {

--hUH5gZbnpyIv7Mn4--
