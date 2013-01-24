From: Michel Lespinasse <walken@google.com>
Subject: [PATCH 2/8] mm: use vm_unmapped_area() on alpha architecture
Date: Wed, 23 Jan 2013 17:29:45 -0800
Message-ID: <1358990991-21316-3-git-send-email-walken@google.com>
References: <1358990991-21316-1-git-send-email-walken@google.com>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-parisc@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Tony Luck <tony.luck@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1358990991-21316-1-git-send-email-walken@google.com>
List-ID: <linux-mm.kvack.org>

Update the alpha arch_get_unmapped_area function to make use of
vm_unmapped_area() instead of implementing a brute force search.

Signed-off-by: Michel Lespinasse <walken@google.com>
Acked-by: Rik van Riel <riel@redhat.com>

---
 arch/alpha/kernel/osf_sys.c |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 14db93e4c8a8..ba707e23ef37 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1298,17 +1298,15 @@ static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 		         unsigned long limit)
 {
-	struct vm_area_struct *vma = find_vma(current->mm, addr);
-
-	while (1) {
-		/* At this point:  (!vma || addr < vma->vm_end). */
-		if (limit - len < addr)
-			return -ENOMEM;
-		if (!vma || addr + len <= vma->vm_start)
-			return addr;
-		addr = vma->vm_end;
-		vma = vma->vm_next;
-	}
+	struct vm_unmapped_area_info info;
+
+	info.flags = 0;
+	info.length = len;
+	info.low_limit = addr;
+	info.high_limit = limit;
+	info.align_mask = 0;
+	info.align_offset = 0;
+	return vm_unmapped_area(&info);
 }
 
 unsigned long
-- 
1.7.7.3

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
