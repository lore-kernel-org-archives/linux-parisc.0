From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Remove arch/parisc/kernel/sys32.h header
Date: Sun, 28 Jul 2013 17:49:53 -0400
Message-ID: <BLU0-SMTP455DABAD7E46C405F81EBF97540@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-18--543481663"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-18--543481663
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The KERNEL_SYSCALL define is not used anymore so the header can be  
removed.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---


--Apple-Mail-18--543481663
Content-Disposition: attachment; filename="sysv32.diff.txt"
Content-Type: text/plain; x-unix-mode=0644; name="sysv32.diff.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 940188d..07349b0 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -56,13 +56,6 @@
 #define A(__x)	((unsigned long)(__x))
 
 /*
- * Atomically swap in the new signal mask, and wait for a signal.
- */
-#ifdef CONFIG_64BIT
-#include "sys32.h"
-#endif
-
-/*
  * Do a signal return - restore sigcontext.
  */
 
diff --git a/arch/parisc/kernel/signal32.c b/arch/parisc/kernel/signal32.c
index 33eca1b..6c6a271 100644
--- a/arch/parisc/kernel/signal32.c
+++ b/arch/parisc/kernel/signal32.c
@@ -34,7 +34,6 @@
 #include <asm/uaccess.h>
 
 #include "signal32.h"
-#include "sys32.h"
 
 #define DEBUG_COMPAT_SIG 0 
 #define DEBUG_COMPAT_SIG_LEVEL 2
diff --git a/arch/parisc/kernel/sys32.h b/arch/parisc/kernel/sys32.h
deleted file mode 100644
index 60dd470..0000000
--- a/arch/parisc/kernel/sys32.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* 
- *    Copyright (C) 2002 Richard Hirst <rhirst at parisc-linux.org>
- *    Copyright (C) 2003 James Bottomley <jejb at parisc-linux.org>
- *    Copyright (C) 2003 Randolph Chung <tausq with parisc-linux.org>
- *
- *    This program is free software; you can redistribute it and/or modify
- *    it under the terms of the GNU General Public License as published by
- *    the Free Software Foundation; either version 2 of the License, or
- *    (at your option) any later version.
- *
- *    This program is distributed in the hope that it will be useful,
- *    but WITHOUT ANY WARRANTY; without even the implied warranty of
- *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *    GNU General Public License for more details.
- *
- *    You should have received a copy of the GNU General Public License
- *    along with this program; if not, write to the Free Software
- *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- */
-#ifndef _PARISC64_KERNEL_SYS32_H
-#define _PARISC64_KERNEL_SYS32_H
-
-#include <linux/compat.h>
-
-/* Call a kernel syscall which will use kernel space instead of user
- * space for its copy_to/from_user.
- */
-#define KERNEL_SYSCALL(ret, syscall, args...) \
-{ \
-    mm_segment_t old_fs = get_fs(); \
-    set_fs(KERNEL_DS); \
-    ret = syscall(args); \
-    set_fs (old_fs); \
-}
-
-#endif
diff --git a/arch/parisc/kernel/sys_parisc32.c b/arch/parisc/kernel/sys_parisc32.c
index a134ff4..bb9f3b6 100644
--- a/arch/parisc/kernel/sys_parisc32.c
+++ b/arch/parisc/kernel/sys_parisc32.c
@@ -42,8 +42,6 @@
 #include <asm/uaccess.h>
 #include <asm/mmu_context.h>
 
-#include "sys32.h"
--Apple-Mail-18--543481663--
