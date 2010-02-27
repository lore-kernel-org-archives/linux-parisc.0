From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 19/66] arch/parisc/include/asm/current.h: Checkpatch cleanup
Date: Sat, 27 Feb 2010 17:51:00 +0100
Message-ID: <1267289508-31031-20-git-send-email-andrea.gelmini@gelma.net>
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

arch/parisc/include/asm/current.h:8: ERROR: "foo * bar" should be "foo *bar"
arch/parisc/include/asm/current.h:12: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/parisc/include/asm/current.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/include/asm/current.h b/arch/parisc/include/asm/current.h
index 0fb9338..4cbf4ad 100644
--- a/arch/parisc/include/asm/current.h
+++ b/arch/parisc/include/asm/current.h
@@ -5,11 +5,11 @@
 
 struct task_struct;
 
-static inline struct task_struct * get_current(void)
+static inline struct task_struct *get_current(void)
 {
 	return current_thread_info()->task;
 }
- 
+
 #define current get_current()
 
 #endif /* !(_PARISC_CURRENT_H) */
-- 
1.7.0.90.g251a4
