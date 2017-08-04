From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH] docs/features: parisc implements tracehook
Date: Fri, 4 Aug 2017 11:28:39 +0100
Message-ID: <20170804102839.23737-1-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: James Hogan <james.hogan@imgtec.com>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-parisc@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>
Return-path: <linux-doc-owner@vger.kernel.org>
List-ID: <linux-doc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Since commit 64e2a42bca12 ("parisc: Add ARCH_TRACEHOOK and regset
support") in v4.7, parisc selects HAVE_ARCH_TRACEHOOK, so update its
entry in Documentation/features from TODO to ok.

Fixes: 64e2a42bca12 ("parisc: Add ARCH_TRACEHOOK and regset support")
Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-parisc@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/features/core/tracehook/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/core/tracehook/arch-support.txt b/Documentation/features/core/tracehook/arch-support.txt
index 5e97a89420ef..dfb638c2f842 100644
--- a/Documentation/features/core/tracehook/arch-support.txt
+++ b/Documentation/features/core/tracehook/arch-support.txt
@@ -25,7 +25,7 @@
     |     mn10300: |  ok  |
     |       nios2: |  ok  |
     |    openrisc: |  ok  |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |        s390: |  ok  |
     |       score: | TODO |
-- 
2.13.2

