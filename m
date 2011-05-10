From: Hugh Dickins <hughd@google.com>
Subject: [PATCH] vm: fix vm_pgoff wrap in upward expansion
Date: Mon, 9 May 2011 17:44:42 -0700 (PDT)
Message-ID: <alpine.LSU.2.00.1105091739140.7047@sister.anvils>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Robert Swiecki <robert@swiecki.net>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-parisc@vger.kernel.org,
	linux-ia64@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit a626ca6a6564 ("vm: fix vm_pgoff wrap in stack expansion") fixed
the case of an expanding mapping causing vm_pgoff wrapping when you had
downward stack expansion.  But there was another case where IA64 and
PA-RISC expand mappings: upward expansion.

This fixes that case too.

Signed-off-by: Hugh Dickins <hughd@google.com.>
Cc: stable@kernel.org
---
On April 12th you asked "Guys, can you think of any other thing
that might expand a mapping?": this is the only one I thought of.

 mm/mmap.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

--- 2.6.39-rc6/mm/mmap.c	2011-05-04 12:10:31.477543104 -0700
+++ linux/mm/mmap.c	2011-05-09 17:16:34.251725877 -0700
@@ -1767,10 +1767,13 @@ int expand_upwards(struct vm_area_struct
 		size = address - vma->vm_start;
 		grow = (address - vma->vm_end) >> PAGE_SHIFT;
 
-		error = acct_stack_growth(vma, size, grow);
-		if (!error) {
-			vma->vm_end = address;
-			perf_event_mmap(vma);
+		error = -ENOMEM;
+		if (vma->vm_pgoff + (size >> PAGE_SHIFT) >= vma->vm_pgoff) {
+			error = acct_stack_growth(vma, size, grow);
+			if (!error) {
+				vma->vm_end = address;
+				perf_event_mmap(vma);
+			}
 		}
 	}
 	vma_unlock_anon_vma(vma);
