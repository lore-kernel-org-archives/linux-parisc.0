From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] parisc: Change structure intialisation to C99 style
Date: Tue, 14 Jun 2016 12:13:06 +0530
Message-ID: <20160614064306.GA23993@amitoj-Inspiron-3542>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: julia.lawall@lip6.fr
To: jejb@parisc-linux.org, deller@gmx.de, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Replace the in order struct initialisation style with explicit field
style.

The Coccinelle semantic patch used to make this change is as follows:

@decl@
identifier i1,fld;
type T;
field list[n] fs;
@@

struct i1 {
 fs
 T fld;
 ...};

@@
identifier decl.i1,i2,decl.fld;
expression e;
position bad.p, bad.fix;
@@

struct i1 i2@p = { ...,
+ .fld = e
- e@fix
 ,...};

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
 arch/parisc/lib/iomap.c | 64 ++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index fb8e10a..eaffbb9 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -125,22 +125,22 @@ static void ioport_write32r(void __iomem *addr, const void *s, unsigned long n)
 }
 
 static const struct iomap_ops ioport_ops = {
-	ioport_read8,
-	ioport_read16,
-	ioport_read16,
-	ioport_read32,
-	ioport_read32,
-	ioport_write8,
-	ioport_write16,
-	ioport_write16,
-	ioport_write32,
-	ioport_write32,
-	ioport_read8r,
-	ioport_read16r,
-	ioport_read32r,
-	ioport_write8r,
-	ioport_write16r,
-	ioport_write32r,
+	.read8 = ioport_read8,
+	.read16 = ioport_read16,
+	.read16be = ioport_read16,
+	.read32 = ioport_read32,
+	.read32be = ioport_read32,
+	.write8 = ioport_write8,
+	.write16 = ioport_write16,
+	.write16be = ioport_write16,
+	.write32 = ioport_write32,
+	.write32be = ioport_write32,
+	.read8r = ioport_read8r,
+	.read16r = ioport_read16r,
+	.read32r = ioport_read32r,
+	.write8r = ioport_write8r,
+	.write16r = ioport_write16r,
+	.write32r = ioport_write32r,
 };
 
 /* Legacy I/O memory ops */
@@ -244,22 +244,22 @@ static void iomem_write32r(void __iomem *addr, const void *s, unsigned long n)
 }
 
 static const struct iomap_ops iomem_ops = {
-	iomem_read8,
-	iomem_read16,
-	iomem_read16be,
-	iomem_read32,
-	iomem_read32be,
-	iomem_write8,
-	iomem_write16,
-	iomem_write16be,
-	iomem_write32,
-	iomem_write32be,
-	iomem_read8r,
-	iomem_read16r,
-	iomem_read32r,
-	iomem_write8r,
-	iomem_write16r,
-	iomem_write32r,
+	.read8 = iomem_read8,
+	.read16 = iomem_read16,
+	.read16be = iomem_read16be,
+	.read32 = iomem_read32,
+	.read32be = iomem_read32be,
+	.write8 = iomem_write8,
+	.write16 = iomem_write16,
+	.write16be = iomem_write16be,
+	.write32 = iomem_write32,
+	.write32be = iomem_write32be,
+	.read8r = iomem_read8r,
+	.read16r = iomem_read16r,
+	.read32r = iomem_read32r,
+	.write8r = iomem_write8r,
+	.write16r = iomem_write16r,
+	.write32r = iomem_write32r,
 };
 
 static const struct iomap_ops *iomap_ops[8] = {
-- 
1.9.1

