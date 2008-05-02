From: akpm@linux-foundation.org
Subject: [patch 5/5] arch/parisc/kernel/unaligned.c: use time_* macros
Date: Fri, 02 May 2008 13:43:34 -0700
Message-ID: <200805022043.m42KhYRu013908@imap1.linux-foundation.org>
Cc: linux-parisc@vger.kernel.org, akpm@linux-foundation.org,
	caglar@pardus.org.tr, grundler@parisc-linux.org, matthew@wil.cx
To: kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: S.Caglar Onur <caglar@pardus.org.tr>

The functions time_before, time_before_eq, time_after, and time_after_eq are
more robust for comparing jiffies against other values.  

So use the time_after() macro, defined in linux/jiffies.h, which deals with
wrapping correctl

[akpm@linux-foundation.org: coding-style fixes]
Signed-off-by: S.Caglar Onur <caglar@pardus.org.tr>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@parisc-linux.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/parisc/kernel/unaligned.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -puN arch/parisc/kernel/unaligned.c~arch-parisc-kernel-unalignedc-use-time_-macros arch/parisc/kernel/unaligned.c
--- a/arch/parisc/kernel/unaligned.c~arch-parisc-kernel-unalignedc-use-time_-macros
+++ a/arch/parisc/kernel/unaligned.c
@@ -460,7 +460,8 @@ void handle_unaligned(struct pt_regs *re
 			goto force_sigbus;
 		}
 
-		if (unaligned_count > 5 && jiffies - last_time > 5*HZ) {
+		if (unaligned_count > 5 &&
+				time_after(jiffies, last_time + 5 * HZ)) {
 			unaligned_count = 0;
 			last_time = jiffies;
 		}
_
