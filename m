From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH, PA-RISC] Fix SMP cache related HPMCs running libgomp testsuite
Date: Sun, 31 Jul 2011 18:11:43 -0400
Message-ID: <BLU0-SMTP33BC220C6C43A14F8BF18697390@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-58-983138103"
To: linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-58-983138103
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

After a considerable amount of testing, I have found that the HPMCs  
that I have been seeing
in the GCC libgomp testsuite are caused by the implementation of  
flush_user_dcache_range.
The current implementation doesn't flush all aliases (e.g., kernel)  
and this leads to cache corruption.
As with flush_cache_mm, we need to either whack the entire cache, or  
do something similar to that
in flush_dcache_page.

The for-[1-8].C tests are the principle problem.  They turn "for  
loops" into a large number of
parallel threads.

I was hoping someone else would have solved this problem, but arm, for  
example, appears to
flush the entire cache on vipt architectures.

The problem with the attached patch is that flushing the entire data  
cache on the rp3440 is
incredibly slow (0x40000 iterations).  I have a patch to unroll the  
loops in flush_instruction_cache_local
and flush_data_cache_local, but still they are still slow.

We are probably missing opportunities to skip flushing the instruction  
cache, but still the data
cache flush will be slow.

What I think needs to be done is to determine the ptep pointer for the  
starting and ending addresses
when the context is current.  From this, we can get the page pointer.   
Then, we may be able to
call flush_dcache_page.  Currently, the only page table lookup that I  
see is in entry.S.

Maybe there is a simpler method?  For example, is there a way to force  
the kernel to use
flush_cache_page.

I'm not sure the change is needed on machines that support non  
equivalent aliases.

Dave



--Apple-Mail-58-983138103
Content-Disposition: attachment; filename="cache.c.d.1.txt"
Content-Type: text/plain; x-unix-mode=0644; name="cache.c.d.1.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 83335f3..532e3bf 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -472,10 +472,14 @@ void flush_cache_mm(struct mm_struct *mm)
 void
 flush_user_dcache_range(unsigned long start, unsigned long end)
 {
+#ifdef CONFIG_SMP
+	flush_data_cache();
+#else
 	if ((end - start) < parisc_cache_flush_threshold)
 		flush_user_dcache_range_asm(start,end);
 	else
 		flush_data_cache();
+#endif
 }
 
 void

--Apple-Mail-58-983138103
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit


--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-58-983138103--
