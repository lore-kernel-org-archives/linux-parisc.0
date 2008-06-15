From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] parisc/lib/: make code static
Date: Sun, 15 Jun 2008 19:13:35 +0300
Message-ID: <20080615161335.GE7865@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: kyle@mcmartin.ca, matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch makes the following needlessly global code static:
- iomap.c: struct iomap_ops[]
- memcpy.c: pa_memcpy()

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 arch/parisc/lib/iomap.c  |    2 +-
 arch/parisc/lib/memcpy.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

45e7cd0b2c678dda4f5ba4ac6d0ed628df9381bd diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index 9abed07..5069e8b 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -261,7 +261,7 @@ static const struct iomap_ops iomem_ops = {
 	iomem_write32r,
 };
 
-const struct iomap_ops *iomap_ops[8] = {
+static const struct iomap_ops *iomap_ops[8] = {
 	[0] = &ioport_ops,
 	[7] = &iomem_ops
 };
diff --git a/arch/parisc/lib/memcpy.c b/arch/parisc/lib/memcpy.c
index 2d68431..bbda909 100644
--- a/arch/parisc/lib/memcpy.c
+++ b/arch/parisc/lib/memcpy.c
@@ -275,7 +275,7 @@ handle_store_error:
 
 
 /* Returns 0 for success, otherwise, returns number of bytes not transferred. */
-unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
+static unsigned long pa_memcpy(void *dstp, const void *srcp, unsigned long len)
 {
 	register unsigned long src, dst, t1, t2, t3;
 	register unsigned char *pcs, *pcd;

