From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop parisc-specific NSIGTRAP define
Date: Sun, 10 Jan 2016 09:36:24 +0100
Message-ID: <20160110083624.GA7508@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

NIGTRAP is already defined in asm-generic/siginfo.h, so no need to
define it ourselves.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/siginfo.h b/arch/parisc/include/uapi/asm/siginfo.h
index 1c75565..8fd10f8 100644
--- a/arch/parisc/include/uapi/asm/siginfo.h
+++ b/arch/parisc/include/uapi/asm/siginfo.h
@@ -7,7 +7,4 @@
 
 #include <asm-generic/siginfo.h>
 
-#undef NSIGTRAP
-#define NSIGTRAP	4
