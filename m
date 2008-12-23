From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Mon, 22 Dec 2008 21:54:21 -0500
Message-ID: <20081223025421.GF30144@bombadil.infradead.org>
References: <1229985816.3345.43.camel@localhost.localdomain> <20081223023111.7D9D24EE8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	deller@gmx.de, kyle@infradead.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081223023111.7D9D24EE8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 22, 2008 at 09:31:10PM -0500, John David Anglin wrote:
> > Actually, it should bug more often.  This function:
> > flush_user_cache_page_non_current() is very rarely called (which is
> > hopefully why you don't see an increase in bugs).  However, this is a
> > kernel function ... if you call load_context() here, you'll get the user
> > protection IDs in the register and it will immediately fault when it
> > returns to the kernel.  All it should be doing (which is what it
> > currently does) is to set up sr3 to allow the kernel to poke into a user
> > address space, which is the design of the function.
> 
> As things stand, the call is fully inlined.  Nothing can be poked into
> the user address space without the protection ID register being correctly
> set.  The cache flushes can trigger a non-access tlb miss fault.  At
> the moment, I can't see how this function could cause a protection ID fault.
> However, it still seems good practice to set cr8 consistently when the
> user context is changed.
> 
> The kernel uses space register values of zero, so it shouldn't fault
> because of the change to sr3 and cr8 for non current.  The values are
> restored before flush_user_cache_page_non_current() exits.
> 

just fyi, jejb sleuthed out that it was flush_tlb_mm's non-SMP path
(which "flushes" the tlb by allocating a new spaceid) that was causing
the problem, and helge verified that it fixes the bug.

i'm confirming now with a make && make clean loop building ruby, if it
survives the night, i'll commit the patch tomorrow and push it to stable
until we have a clean(er) fix.

diff --git a/arch/parisc/include/asm/tlbflush.h b/arch/parisc/include/asm/tlbflush.h
index b72ec66..1f6fd4f 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -44,9 +44,12 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 {
 	BUG_ON(mm == &init_mm); /* Should never happen */
 
-#ifdef CONFIG_SMP
+#if 1 || defined(CONFIG_SMP)
 	flush_tlb_all();
 #else
+	/* FIXME: currently broken, causing space id and protection ids
+	 *  to go out of sync, resulting in faults on userspace accesses.
+	 */
 	if (mm) {
 		if (mm->context != 0)
 			free_sid(mm->context);
