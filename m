From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Ensure volatile space register %sr1 is not clobbered
Date: Tue, 25 Jun 2013 19:10:04 -0400
Message-ID: <BLU0-SMTP2112E5305CF38E7EA12B08978B0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-19-905097367"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-19-905097367
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

I still see the occasional random segv on rp3440.  Looking at one of  
these (a code 15), it appeared the problem must
be with the cache handling of anonymous pages.  Reviewing this, I  
noticed that the space register %sr1 might be
being clobbered when we flush an anonymous page.

Register %sr1 is used for TLB purges in a couple of places.  These  
purges are needed on PA8800 and PA8900
processors to ensure cache consistency of flushed cache lines.

The solution here is simply to move the %sr1 load into the TLB lock  
region needed to ensure that one purge executes
at a time on SMP systems.  This was already the case for one use.   
After a few days of operation, I haven't had a random
segv on my rp3440.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---


--Apple-Mail-19-905097367
Content-Disposition: attachment; filename="sr1.txt"
Content-Type: text/plain; x-unix-mode=0644; name="sr1.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index 5273da9..9cdbc74 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -68,8 +68,8 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 	/* For one page, it's not worth testing the split_tlb variable */
 
 	mb();
-	mtsp(vma->vm_mm->context,1);
 	purge_tlb_start(flags);
+	mtsp(vma->vm_mm->context,1);
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

--Apple-Mail-19-905097367
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-19-905097367--
