From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: add braces around arguments in assembler macros
Date: Sun, 18 Jan 2009 18:13:53 +0100
Message-ID: <49736351.5050201@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Add braces around the macro arguments, else for example
"shl %r1, 5-3, %r2" would not expand to what you would assume.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/assembly.h b/arch/parisc/include/asm/assembly.h
index ffb2088..ab7cc37 100644
--- a/arch/parisc/include/asm/assembly.h
+++ b/arch/parisc/include/asm/assembly.h
@@ -129,27 +129,27 @@
 
 	/* Shift Left - note the r and t can NOT be the same! */
 	.macro shl r, sa, t
-	dep,z	\r, 31-\sa, 32-\sa, \t
+	dep,z	\r, 31-(\sa), 32-(\sa), \t
 	.endm
 
 	/* The PA 2.0 shift left */
 	.macro shlw r, sa, t
-	depw,z	\r, 31-\sa, 32-\sa, \t
+	depw,z	\r, 31-(\sa), 32-(\sa), \t
 	.endm
 
 	/* And the PA 2.0W shift left */
 	.macro shld r, sa, t
-	depd,z	\r, 63-\sa, 64-\sa, \t
+	depd,z	\r, 63-(\sa), 64-(\sa), \t
 	.endm
 
 	/* Shift Right - note the r and t can NOT be the same! */
 	.macro shr r, sa, t
-	extru \r, 31-\sa, 32-\sa, \t
+	extru \r, 31-(\sa), 32-(\sa), \t
 	.endm
 
 	/* pa20w version of shift right */
 	.macro shrd r, sa, t
-	extrd,u \r, 63-\sa, 64-\sa, \t
+	extrd,u \r, 63-(\sa), 64-(\sa), \t
 	.endm
 
 	/* load 32-bit 'value' into 'reg' compensating for the ldil
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index d1fa4ed..19d5749 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -368,7 +368,7 @@
 	 * abstractions for the macros */
 	.macro		EXTR	reg1,start,length,reg2
 #ifdef CONFIG_64BIT
-	extrd,u		\reg1,32+\start,\length,\reg2
+	extrd,u		\reg1,32+(\start),\length,\reg2
 #else
 	extrw,u		\reg1,\start,\length,\reg2
 #endif
@@ -376,7 +376,7 @@
 
 	.macro		DEP	reg1,start,length,reg2
 #ifdef CONFIG_64BIT
-	depd		\reg1,32+\start,\length,\reg2
+	depd		\reg1,32+(\start),\length,\reg2
 #else
 	depw		\reg1,\start,\length,\reg2
 #endif
@@ -384,7 +384,7 @@
 
 	.macro		DEPI	val,start,length,reg
 #ifdef CONFIG_64BIT
-	depdi		\val,32+\start,\length,\reg
+	depdi		\val,32+(\start),\length,\reg
 #else
 	depwi		\val,\start,\length,\reg
 #endif
