From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next] parisc: asm/pdc.h should include asm/page.h
Date: Wed, 1 Apr 2009 13:44:08 +0400
Message-ID: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixes this build error:
arch/parisc/kernel/pdc_cons.c:117: error: '__PAGE_OFFSET' undeclared
(first use in this function)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 arch/parisc/include/asm/pdc.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index a26e98d..fde8045 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -340,6 +340,7 @@
 #if !defined(__ASSEMBLY__)

 #include <linux/types.h>
+#include <asm/page.h>

 #ifdef __KERNEL__
