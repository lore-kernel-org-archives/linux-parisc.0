From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] parisc: remove CVS keywords
Date: Fri, 3 Apr 2009 05:49:22 +0400
Message-ID: <20090403014922.GA28891@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 arch/parisc/include/asm/dma.h  |    3 +--
 arch/parisc/kernel/cache.c     |    3 +--
 arch/parisc/kernel/pci.c       |    3 +--
 arch/parisc/kernel/processor.c |    3 +--
 arch/parisc/kernel/setup.c     |    3 +--
 arch/parisc/lib/checksum.c     |    2 --
 arch/parisc/mm/fault.c         |    3 +--
 7 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/parisc/include/asm/dma.h b/arch/parisc/include/asm/dma.h
index 31ad0f0..f7a18f9 100644
--- a/arch/parisc/include/asm/dma.h
+++ b/arch/parisc/include/asm/dma.h
@@ -1,5 +1,4 @@
-/* $Id: dma.h,v 1.2 1999/04/27 00:46:18 deller Exp $
- * linux/include/asm/dma.h: Defines for using and allocating dma channels.
+/* asm/dma.h: Defines for using and allocating dma channels.
  * Written by Hennus Bergman, 1992.
  * High DMA channel support & info by Hannu Savolainen
  * and John Boyd, Nov. 1992.
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 837530e..f34082d 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -1,5 +1,4 @@
-/* $Id: cache.c,v 1.4 2000/01/25 00:11:38 prumpf Exp $
- *
+/*
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index 6936386..f7064ab 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -1,5 +1,4 @@
-/* $Id: pci.c,v 1.6 2000/01/29 00:12:05 grundler Exp $
- *
+/*
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
diff --git a/arch/parisc/kernel/processor.c b/arch/parisc/kernel/processor.c
index ecb6093..6ce3b52 100644
--- a/arch/parisc/kernel/processor.c
+++ b/arch/parisc/kernel/processor.c
@@ -1,5 +1,4 @@
-/*    $Id: processor.c,v 1.1 2002/07/20 16:27:06 rhirst Exp $
- *
+/*
  *    Initial setup-routines for HP 9000 based hardware.
  *
  *    Copyright (C) 1991, 1992, 1995  Linus Torvalds
diff --git a/arch/parisc/kernel/setup.c b/arch/parisc/kernel/setup.c
index 82131ca..cb71f3d 100644
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@ -1,5 +1,4 @@
-/*    $Id: setup.c,v 1.8 2000/02/02 04:42:38 prumpf Exp $
- *
+/*
  *    Initial setup-routines for HP 9000 based hardware.
  *
  *    Copyright (C) 1991, 1992, 1995  Linus Torvalds
diff --git a/arch/parisc/lib/checksum.c b/arch/parisc/lib/checksum.c
index 462696d..ae66d31 100644
--- a/arch/parisc/lib/checksum.c
+++ b/arch/parisc/lib/checksum.c
@@ -13,8 +13,6 @@
  *		modify it under the terms of the GNU General Public License
  *		as published by the Free Software Foundation; either version
  *		2 of the License, or (at your option) any later version.
- *
- * $Id: checksum.c,v 1.3 1997/12/01 17:57:34 ralf Exp $
  */
 #include <linux/module.h>
 #include <linux/types.h>
diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
index 92c7fa4..d617e79 100644
--- a/arch/parisc/mm/fault.c
+++ b/arch/parisc/mm/fault.c
@@ -1,5 +1,4 @@
-/* $Id: fault.c,v 1.5 2000/01/26 16:20:29 jsm Exp $
- *
+/*
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
