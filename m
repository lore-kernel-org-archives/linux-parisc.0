From: Helge Deller <deller@gmx.de>
Subject: [PATCH] prctl: implement PR_GET_ENDIAN for all architectures
Date: Sat, 28 Jan 2017 12:13:10 +0100
Message-ID: <20170128111310.GA13389@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The prctl(PR_GET_ENDIAN) syscall was added to Kernel 2.6.18, but
implemented for PowerPC only.
This trivial patch adds support for this syscall for all other architectures.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/kernel/sys.c b/kernel/sys.c
index 842914e..5818e5e 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -79,9 +79,6 @@
 #ifndef GET_FPEXC_CTL
 # define GET_FPEXC_CTL(a, b)	(-EINVAL)
 #endif
-#ifndef GET_ENDIAN
-# define GET_ENDIAN(a, b)	(-EINVAL)
-#endif
 #ifndef SET_ENDIAN
 # define SET_ENDIAN(a, b)	(-EINVAL)
 #endif
@@ -2136,7 +2133,13 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EFAULT;
 		break;
 	case PR_GET_ENDIAN:
+#ifdef GET_ENDIAN
 		error = GET_ENDIAN(me, arg2);
+#elif defined(__BIG_ENDIAN)
+		error = put_user(PR_ENDIAN_BIG, (unsigned int __user *)arg2);
+#else
+		error = put_user(PR_ENDIAN_LITTLE, (unsigned int __user *)arg2);
+#endif
 		break;
 	case PR_SET_ENDIAN:
 		error = SET_ENDIAN(me, arg2);
