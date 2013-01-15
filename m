From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Purge existing TLB entries in set_pte_at and ptep_set_wrprotect - take 2
Date: Mon, 14 Jan 2013 19:45:00 -0500
Message-ID: <BLU0-SMTP8691FD3EB8749D3303BA57972D0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-8--201105462"
Cc: Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-8--201105462
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Attached is new version of patch which no longer saves and restores  
%sr1.  Lightly tested with a GCC build
and a build of Debian gtk+3.0 package.

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-8--201105462
Content-Disposition: attachment; filename="purge_tlb.d.1.txt"
Content-Type: text/plain; x-unix-mode=0644; name="purge_tlb.d.1.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index ee99f23..2c6dedb 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -12,11 +12,10 @@
 
 #include <linux/bitops.h>
 #include <linux/spinlock.h>
+#include <linux/mm_types.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
 
-struct vm_area_struct;
-
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
  * memory.  For the return value to be meaningful, ADDR must be >=
@@ -40,7 +39,14 @@ struct vm_area_struct;
         do{                                                     \
                 *(pteptr) = (pteval);                           \
         } while(0)
-#define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
+
+extern void purge_tlb_entries(struct mm_struct *, unsigned long);
+
+#define set_pte_at(mm,addr,ptep, pteval)                        \
+        do{                                                     \
+                set_pte(ptep,pteval);                           \
+                purge_tlb_entries(mm,addr);                     \
+        } while(0)
 
 #endif /* !__ASSEMBLY__ */
 
@@ -466,6 +472,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 		old = pte_val(*ptep);
 		new = pte_val(pte_wrprotect(__pte (old)));
 	} while (cmpxchg((unsigned long *) ptep, old, new) != old);
+	purge_tlb_entries(mm, addr);
 #else
 	pte_t old_pte = *ptep;
 	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 48e16dc..1524fd8 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -419,6 +419,24 @@ void kunmap_parisc(void *addr)
 EXPORT_SYMBOL(kunmap_parisc);
 #endif
 
+void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
+{
+	unsigned long flags;
+
+	/* Note: purge_tlb_entries can be called at startup with
+	   no context.  */
+
+	/* Disable preemption while we play with %sr1.  */
+	preempt_disable();
+	mtsp(mm->context,1);
+	purge_tlb_start(flags);
+	pdtlb(addr);
+	pitlb(addr);
+	purge_tlb_end(flags);
+	preempt_enable();
+}
+EXPORT_SYMBOL(purge_tlb_entries);
+
 void __flush_tlb_range(unsigned long sid, unsigned long start,
 		       unsigned long end)
 {

--Apple-Mail-8--201105462
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-8--201105462--
