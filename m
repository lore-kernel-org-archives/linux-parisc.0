From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Fix order of EREFUSED define in errno.h
Date: Sat, 20 Aug 2016 11:51:38 +0200
Message-ID: <20160820095138.GA15356@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

When building gccgo in userspace, errno.h gets parsed and the go include file
sysinfo.go is generated.

Since EREFUSED is defined to the same value as ECONNREFUSED, and ECONNREFUSED
is defined later on in errno.h, this leads to go complaining that EREFUSED
isn't defined yet.

Fix this trivial problem by moving the define of EREFUSED down after
ECONNREFUSED in errno.h (and clean up the indenting while touching this line).

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/arch/parisc/include/uapi/asm/errno.h b/arch/parisc/include/uapi/asm/errno.h
index c0ae625..a714d01 100644
--- a/arch/parisc/include/uapi/asm/errno.h
+++ b/arch/parisc/include/uapi/asm/errno.h
@@ -97,10 +97,10 @@
 #define	ENOTCONN	235	/* Transport endpoint is not connected */
 #define	ESHUTDOWN	236	/* Cannot send after transport endpoint shutdown */
 #define	ETOOMANYREFS	237	/* Too many references: cannot splice */
-#define EREFUSED	ECONNREFUSED	/* for HP's NFS apparently */
 #define	ETIMEDOUT	238	/* Connection timed out */
 #define	ECONNREFUSED	239	/* Connection refused */
-#define EREMOTERELEASE	240	/* Remote peer released connection */
+#define	EREFUSED	ECONNREFUSED	/* for HP's NFS apparently */
+#define	EREMOTERELEASE	240	/* Remote peer released connection */
 #define	EHOSTDOWN	241	/* Host is down */
 #define	EHOSTUNREACH	242	/* No route to host */
 
