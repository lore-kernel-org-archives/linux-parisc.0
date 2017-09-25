From: Helge Deller <deller@gmx.de>
Subject: [PATCH][RFC] parisc: Convert MAP_TYPE to cover 4 bits on parisc
Date: Tue, 26 Sep 2017 00:21:27 +0200
Message-ID: <20170925222127.GA29387@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On parisc we want to be as much as possible compatible to the major
architectures like x86. Those architectures have MAP_TYPE defined as 0x0f which
covers MAP_SHARED and MAP_PRIVATE and leaves two more bits unused.

In contrast, on parisc we have MAP_TYPE defined to 0x03 which covers MAP_SHARED
and MAP_PRIVATE only. But we don't have the 2 bits free as x86.

Usually that's not a problem, but during the discussions for pmem+dax support
the idea came up to use the two remaining bits of MAP_TYPE (on x86 and others)
for the new MAP_DIRECT and MAP_SYNC flags. One requirement is, that an old
kernel should correctly handle MAP_DIRECT and MAP_SYNC and fail on those if
set. This only works if MAP_TYPE has 4 bits.

That said, this patch adds the two missing bits in order to gain compatibility
to x86 and to be maybe prepared if at some point in future we will add pmem+dax
support (or any other use case as it's done for x86). The patch as it is now
will not break any old kernel, and if those bits will be used at some point in
future, it's a requirement that users will need to run a kernel with this patch
installed.

Link: http://lkml.org/lkml/2017/8/25/502
Link: http://lkml.org/r/4de21e8d-5e10-ec40-c731-0c079953cf48@gmx.de
Cc: stable@vger.kernel.org
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
index 775b5d5e41a1..71b0d58dcacd 100644
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@ -11,9 +11,11 @@
 
 #define MAP_SHARED	0x01		/* Share changes */
 #define MAP_PRIVATE	0x02		/* Changes are private */
-#define MAP_TYPE	0x03		/* Mask for type of mapping */
+#define MAP_TYPE	(MAP_SHARED|MAP_PRIVATE|MAP_RESRVD1|MAP_RESRVD2) /* Mask for type of mapping */
 #define MAP_FIXED	0x04		/* Interpret addr exactly */
+#define MAP_RESRVD1	0x08		/* reserved for 3rd bit of MAP_TYPE */
 #define MAP_ANONYMOUS	0x10		/* don't use a file */
+#define MAP_RESRVD2	0x20		/* reserved for 4th bit of MAP_TYPE */
 
 #define MAP_DENYWRITE	0x0800		/* ETXTBSY */
 #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
