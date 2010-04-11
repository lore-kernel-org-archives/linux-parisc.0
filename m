From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [PATCH] Call pagefault_disable/pagefault_enable in
	kmap_atomic/kunmap_atomic
Date: Sun, 11 Apr 2010 12:36:14 -0400
Message-ID: <20100411163613.GA7365@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100409151330.GA23889@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 09 Apr 2010, John David Anglin wrote:

> On Fri, 09 Apr 2010, Carlos O'Donell wrote:
> 
> > We need to start splitting up your giant "stability" patch into
> > manageable chunks.

Here's the first chunk.

Based on the generic implementation of kmap_atomic and kunmap_atomic,
we should call pagefault_disable and pagefault_enable in our PA8000
implementation.

The define for kmap_atomic_prot was also missing, and I updated
kmap_atomic_pfn to use the generic implementation because of the
change to kmap_atomic.

I believe that this change is needed to fix the fork copy-on-write
bug.

Signed-off-by: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cacheflush.h.d"

diff --git a/arch/parisc/include/asm/cacheflush.h b/arch/parisc/include/asm/cacheflush.h
index 7a73b61..ab87176 100644
--- a/arch/parisc/include/asm/cacheflush.h
+++ b/arch/parisc/include/asm/cacheflush.h
@@ -2,6 +2,7 @@
 #define _PARISC_CACHEFLUSH_H
 
 #include <linux/mm.h>
+#include <linux/uaccess.h>
 
 /* The usual comment is "Caches aren't brain-dead on the <architecture>".
  * Unfortunately, that doesn't apply to PA-RISC. */
@@ -113,11 +114,20 @@ static inline void *kmap(struct page *page)
 
 #define kunmap(page)			kunmap_parisc(page_address(page))
 
-#define kmap_atomic(page, idx)		page_address(page)
+static inline void *kmap_atomic(struct page *page, enum km_type idx)
+{
+	pagefault_disable();
+	return page_address(page);
+}
 
-#define kunmap_atomic(addr, idx)	kunmap_parisc(addr)
+static inline void kunmap_atomic(void *addr, enum km_type idx)
+{
+	kunmap_parisc(addr);
+	pagefault_enable();
+}
 
-#define kmap_atomic_pfn(pfn, idx)	page_address(pfn_to_page(pfn))
+#define kmap_atomic_prot(page, idx, prot)	kmap_atomic(page, idx)
+#define kmap_atomic_pfn(pfn, idx)	kmap_atomic(pfn_to_page(pfn), (idx))
 #define kmap_atomic_to_page(ptr)	virt_to_page(ptr)
 #endif
 

--EVF5PPMfhYS0aIcm--
