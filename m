From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH next] parisc: asm/pdc.h should include asm/page.h
Date: Wed, 1 Apr 2009 19:43:40 +0400
Message-ID: <a4423d670904010843r76c3a4faxd2841387772be89@mail.gmail.com>
References: <a4423d670904010244q1cfbce88qaa635d8e4070db07@mail.gmail.com>
	 <20090401150115.GA1443@bombadil.infradead.org>
	 <a4423d670904010806j7de7b311yb3137e8b73ad12f2@mail.gmail.com>
	 <20090401150956.GB1443@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090401150956.GB1443@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] parisc: asm/pdc.h should include asm/page.h

Fixes this build error:
arch/parisc/kernel/pdc_cons.c:117: error: '__PAGE_OFFSET' undeclared

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 arch/parisc/include/asm/pdc.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index a26e98d..90d6973 100644
--- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -343,6 +343,8 @@

 #ifdef __KERNEL__

+#include <asm/page.h> /* for __PAGE_OFFSET */
+
 extern int pdc_type;

 /* Values for pdc_type */
