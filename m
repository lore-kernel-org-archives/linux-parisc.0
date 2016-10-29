From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Ignore the pkey system calls for now
Date: Sat, 29 Oct 2016 23:47:57 +0200
Message-ID: <20161029214757.GA17608@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/unistd.h b/arch/parisc/include/uapi/asm/unistd.h
index a9b9407..6b0741e 100644
--- a/arch/parisc/include/uapi/asm/unistd.h
+++ b/arch/parisc/include/uapi/asm/unistd.h
@@ -368,7 +368,9 @@
 
 #define __IGNORE_select		/* newselect */
 #define __IGNORE_fadvise64	/* fadvise64_64 */
