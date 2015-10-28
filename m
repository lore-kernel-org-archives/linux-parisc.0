From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix struct ipc64_perm to use userspace-clean types
Date: Wed, 28 Oct 2015 23:27:09 +0100
Message-ID: <20151028222709.GA13026@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The current implementation is just wrong. It should not use standard
types like uid_t which may be different if used with 32 or 64bit
userspace. Instead use the __kernel_* types which do not pollute
userspace.

This change fixes build errors like for the trinity debian package.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/ipcbuf.h b/arch/parisc/include/uapi/asm/ipcbuf.h
index bd956c4..53472bc4 100644
--- a/arch/parisc/include/uapi/asm/ipcbuf.h
+++ b/arch/parisc/include/uapi/asm/ipcbuf.h
@@ -1,6 +1,8 @@
 #ifndef __PARISC_IPCBUF_H__
 #define __PARISC_IPCBUF_H__
 
+#include <linux/posix_types.h>
+
 /*
  * The ipc64_perm structure for PA-RISC is almost identical to
  * kern_ipc_perm as we have always had 32-bit UIDs and GIDs in the kernel.
@@ -10,16 +12,17 @@
 
 struct ipc64_perm
 {
-	key_t           key;
-	uid_t           uid;
-	gid_t           gid;
-	uid_t           cuid;
-	gid_t           cgid;
-	unsigned short int	__pad1;
-	mode_t          mode;
+	__kernel_key_t		key;
+	__kernel_uid_t		uid;
+	__kernel_gid_t		gid;
+	__kernel_uid_t		cuid;
+	__kernel_gid_t		cgid;
+				/* pad if mode_t is u16: */
+	unsigned char		__pad1[4 - sizeof(__kernel_mode_t)];
+	__kernel_mode_t		mode;
 	unsigned short int	__pad2;
 	unsigned short int	seq;
-	unsigned int	__pad3;
+	unsigned int		__pad3;
 	unsigned long long int __unused1;
 	unsigned long long int __unused2;
 };
