From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Avoid include of linux/types.h in pdc.h
Date: Mon, 2 Oct 2017 07:44:24 +0200
Message-ID: <20171002054424.GA12619@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Make pdc.h more easily reuseable outside of the kernel, e.g. for seabios
and qemu builds.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/pdc.h b/arch/parisc/include/uapi/asm/pdc.h
index 1f30b49772aa..25e85448b252 100644
--- a/arch/parisc/include/uapi/asm/pdc.h
+++ b/arch/parisc/include/uapi/asm/pdc.h
@@ -339,9 +339,6 @@
 
 #if !defined(__ASSEMBLY__)
 
-#include <linux/types.h>
-
