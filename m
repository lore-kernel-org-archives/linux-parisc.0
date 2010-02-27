From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 01/66] arch/parisc/include/asm/percpu.h: Checkpatch cleanup
Date: Sat, 27 Feb 2010 17:50:42 +0100
Message-ID: <1267289508-31031-2-git-send-email-andrea.gelmini@gelma.net>
References: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
Cc: Andrea Gelmini <andrea.gelmini@gelma.net>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1267289508-31031-1-git-send-email-andrea.gelmini@gelma.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

arch/parisc/include/asm/percpu.h:6: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/include/asm/percpu.h |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/percpu.h b/arch/parisc/include/asm/percpu.h
index a0dcd19..fb92561 100644
--- a/arch/parisc/include/asm/percpu.h
+++ b/arch/parisc/include/asm/percpu.h
@@ -3,5 +3,4 @@
 
 #include <asm-generic/percpu.h>
 
-#endif 
-
+#endif
-- 
1.7.0.90.g251a4
