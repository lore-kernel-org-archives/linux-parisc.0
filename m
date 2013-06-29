From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Ensure volatile space register %sr1 is not clobbered (v2)
Date: Sat, 29 Jun 2013 16:42:12 -0400
Message-ID: <BLU0-SMTP161BD1EB89F066AC13DE2497770@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-11--905658420"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-11--905658420
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

This patch is functionally identical to the previous one except the  
computation of the space id
is moved outside the lock region in the first hunk.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-11--905658420
Content-Disposition: attachment; filename="sr1-v2.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="sr1-v2.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 5273da9..d703061 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -63,13 +63,14 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 static inline void flush_tlb_page(struct vm_area_struct *vma,
 	unsigned long addr)
 {
-	unsigned long flags;
+	unsigned long flags, sid;
 
 	/* For one page, it's not worth testing the split_tlb variable */
 
 	mb();
-	mtsp(vma->vm_mm->context,1);
+	sid = vma->vm_mm->context;
 	purge_tlb_start(flags);
+	mtsp(sid,1);
 	pdtlb(addr);
 	pitlb(addr);
 	purge_tlb_end(flags);
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 65fb4cb..2e65aa5 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -440,8 +440,8 @@ void __flush_tlb_range(unsigned long sid, unsigned long start,
 	else {
 		unsigned long flags;
 
-		mtsp(sid, 1);
 		purge_tlb_start(flags);
+		mtsp(sid, 1);
 		if (split_tlb) {
 			while (npages--) {
 				pdtlb(start);

--Apple-Mail-11--905658420
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-11--905658420--
