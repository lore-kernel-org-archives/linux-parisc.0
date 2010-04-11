From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 11 Apr 2010 18:25:54 -0400
Message-ID: <20100411222554.GA10147@hiauly1.hia.nrc.ca>
References: <20100408215453.GA18445@hiauly1.hia.nrc.ca> <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <x2p119aab441004090714v107c8fc1s9ca94066871a3e8b@mail.gmail.com> <20100409151330.GA23889@hiauly1.hia.nrc.ca> <4BC0E3AD.4050802@gmx.de> <20100410225355.GA2812@hiauly1.hia.nrc.ca> <4BC219F7.5020204@gmx.de>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BC219F7.5020204@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 11 Apr 2010, Helge Deller wrote:

> Nevertheless, I still see the crashes with all kernel patches applied.
> 
> What I usually do is to start up more than 8 screen sessions. In each of the
> sessions I start the bash loop:
> -> i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail; done;
> and detach from the screen sessions.
> After some time, the load goes up to 8-16 and a few crashes fill the syslog.
> I'm sure the crashes are related to how much load the machine is, and how
> often process switches will happen.
> How many minifail testcases do you run in parallel?

Sigh, never more than one...

That said, I did realize last night that the cache flush in ptep_set_wrprotect
based on pte_dirty was flawed.  In a SMP kernel with a user on a different
cpu pounding on the page to be write protected, there was a race between
the pte_dirty check and the write protect.

Further, I don't believe the dirty bit is reliable.  Our cmpxchg is not
atomic with respect to changes in the dirty bit.  Thus, there is a small
window where a change in the dirty bit could get lost.

So for now, I think it safest to move the flush after the setting of the
write protect bit, and do it unconditionally.  This should be ok since
page faults are disabled.  I recognize that this will hurt performance.

I'm going to test the following on my rp3440.  The flushing has greatly
improved SMP userspace stability.  However, I have still seen a few issues
in the GCC testsuite.

Maybe it will help your B2000.  However, let's just go one step at a time.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index a27d2e2..e85f43c 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -14,6 +14,7 @@
 #include <linux/bitops.h>
 #include <asm/processor.h>
 #include <asm/cache.h>
+extern void flush_cache_page(struct vm_area_struct *vma, unsigned long vmaddr, unsigned long pfn);
 
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -456,7 +457,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return old_pte;
 }
 
-static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	unsigned long new, old;
@@ -469,6 +470,8 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 	pte_t old_pte = *ptep;
 	set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
 #endif
+
+	flush_cache_page(vma, addr, pte_pfn(*ptep));
 }
 
 #define pte_same(A,B)	(pte_val(A) == pte_val(B))
