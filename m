From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH][RFC] parisc: Fix some PTE/TLB race conditions and optimize __flush_tlb_range based on timing results
Date: Wed, 1 Jul 2015 17:18:37 -0400
Message-ID: <BLU436-SMTP102D0AAFD30CFC540272CF897A80@phx.gbl>
References: <20150529201317.GA4795@ls3530.box> <5568CD6E.20204@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary="Apple-Mail-81-64300394"
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5568CD6E.20204@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-81-64300394
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

This patch is an evolution of the change posted by Helge based on buildd =
testing.

The increased use of pdtlb/pitlb instructions seemed to increase the =
frequency of random segmentation
faults building packages.  Further, we had a number of cases where TLB =
inserts would repeatedly fail and
all forward progress would stop.  The Haskell ghc package caused a lot =
of trouble in this area.  The final
indication of a race in pte handling was this syslog entry on sibaris:

[63165.884000] swap_free: Unused swap offset entry 00000004
[63165.948000] BUG: Bad page map in process mysqld  pte:00000100 =
pmd:019bbec5
[63166.028000] addr:00000000ec464000 vm_flags:00100073 =
anon_vma:0000000221023828 mapping:          (null) index:ec464
[63166.156000] CPU: 1 PID: 9176 Comm: mysqld Not tainted =
4.0.0-2-parisc64-smp #1 Debian 4.0.5-1
[63166.256000] Backtrace:
[63166.284000]  [<0000000040173eb0>] show_stack+0x20/0x38
[63166.344000]  [<0000000040444424>] dump_stack+0x9c/0x110
[63166.408000]  [<00000000402a0d38>] print_bad_pte+0x1a8/0x278
[63166.476000]  [<00000000402a28b8>] unmap_single_vma+0x3d8/0x770
[63166.544000]  [<00000000402a4090>] zap_page_range+0xf0/0x198
[63166.612000]  [<00000000402ba2a4>] SyS_madvise+0x404/0x8c0

Note that the pte value is 0 except for the accessed bit 0x100.  This =
bit shouldn't be set without the
present bit.

It should be noted that the madvise system call is probably a trigger =
for many of the random segmentation
faults.

In looking at the kernel code, I found the following problems:

1) The pte_clear define didn't take TLB lock when clearing a pte.
2) We didn't test pte present bit inside lock in exception support.
3) The pte and tlb locks needed to merged in order to ensure consistency =
between page table and TLB.
This also has the effect of serializing TLB broadcasts on SMP systems.

The attached change implements the above and a few other tweaks to try =
to improve performance.  Based
on the timing code, TLB purges are very slow (e.g., ~ 209 cycles per =
page on rp3440).  Thus, I think it
beneficial to test the split_tlb variable to avoid duplicate purges.  =
Probably, all PA 2.0 machines have
combined TLBs.

I dropped using __flush_tlb_range in flush_tlb_mm as I realized all =
applications and most threads have
a stack size that is too large to make this useful.  I added some =
comments to this effect.

Since implementing 1 through 3, I haven't had any random segmentation =
faults on mx3210 (rp3440) in
about one week of building code and running as  a Debian buildd.

Signed-off-by: John David Anglin <dave.anglin@bell.net>

On 2015-05-29, at 4:34 PM, Helge Deller wrote:

> On 29.05.2015 22:13, Helge Deller wrote:
>> This patch optimizes the TLB flushing functions flush_tlb_mm() and
>> __flush_tlb_range() in a way that it adds timing routines to =
calculate
>> the optimal size up to which flushes of small TLB ranges perform =
faster
>> than when performing a full TLB shootdown.
>>=20
>> Here are some timing results for a rp5470 and J5000 machine:
>>=20
>> Machine: rp5470, PA8700, 875 MHz
>> I-cache         : 768 KB
>> D-cache         : 1536 KB (WB, direct mapped)
>> ITLB entries    : 240
>> DTLB entries    : 240 - shared with ITLB
>>=20
>> Whole cache flush 692084 cycles, flushing 13214592 bytes 5904392 =
cycles
>> Setting cache flush threshold to 1512 kB.
>> Whole TLB flush 40990 cycles, flushing 4096000 bytes 448989 cycles
>> Setting TLB flush threshold to 368 kB.
>>=20
>> Machine: J5000/785, PA8500, 440MHz
>> I-cache         : 512 KB
>> D-cache         : 1024 KB (WB, direct mapped)
>> ITLB entries    : 160
>> DTLB entries    : 160 - shared with ITLB
>>=20
>> Whole cache flush 268605 cycles, flushing 13214592 bytes 1861037 =
cycles
>> Setting cache flush threshold to 1024 kB
>> Whole TLB flush 14131 cycles, flushing 13221888 bytes 769329 cycles
>> Setting TLB flush threshold to 240 kB
>=20
>=20
> One more machine:
> Machine: C8000, PA8800, 2 CPUs each 900 MHz
> I-cache         : 32768 KB
> D-cache         : 32768 KB (WB, direct mapped)
> ITLB entries    : 240
> DTLB entries    : 240 - shared with ITLB
>=20
> Whole cache flush 4298354 cycles, flushing 13214592 bytes 1440513 =
cycles
> Setting cache flush threshold to 32768 kB
> Whole TLB flush 15625 cycles, flushing 13221888 bytes 781230 cycles
> Setting TLB flush threshold to 260 kB
>=20
>=20
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>=20
>> diff --git a/arch/parisc/include/asm/tlbflush.h =
b/arch/parisc/include/asm/tlbflush.h
>> index 9d086a5..5e81e17 100644
>> --- a/arch/parisc/include/asm/tlbflush.h
>> +++ b/arch/parisc/include/asm/tlbflush.h
>> @@ -24,40 +24,25 @@ extern void flush_tlb_all_local(void *);
>>=20
>>  #define smp_flush_tlb_all()	flush_tlb_all()
>>=20
>> -/*
>> - * flush_tlb_mm()
>> - *
>> - * XXX This code is NOT valid for HP-UX compatibility processes,
>> - * (although it will probably work 99% of the time). HP-UX
>> - * processes are free to play with the space id's and save them
>> - * over long periods of time, etc. so we have to preserve the
>> - * space and just flush the entire tlb. We need to check the
>> - * personality in order to do that, but the personality is not
>> - * currently being set correctly.
>> - *
>> - * Of course, Linux processes could do the same thing, but
>> - * we don't support that (and the compilers, dynamic linker,
>> - * etc. do not do that).
>> - */
>> +int __flush_tlb_range(unsigned long sid,
>> +	unsigned long start, unsigned long end);
>> +
>> +#define flush_tlb_range(vma, start, end) \
>> +	__flush_tlb_range((vma)->vm_mm->context, start, end)
>> +
>> +#define flush_tlb_kernel_range(start, end) \
>> +	__flush_tlb_range(0, start, end)
>>=20
>>  static inline void flush_tlb_mm(struct mm_struct *mm)
>>  {
>> -	BUG_ON(mm =3D=3D &init_mm); /* Should never happen */
>> -
>> -#if 1 || defined(CONFIG_SMP)
>> -	flush_tlb_all();
>> -#else
>> -	/* FIXME: currently broken, causing space id and protection ids
>> -	 *  to go out of sync, resulting in faults on userspace =
accesses.
>> -	 */
>> -	if (mm) {
>> -		if (mm->context !=3D 0)
>> -			free_sid(mm->context);
>> -		mm->context =3D alloc_sid();
>> -		if (mm =3D=3D current->active_mm)
>> -			load_context(mm->context);
>> +	struct vm_area_struct *vma;
>> +
>> +	for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
>> +		/* exit loop if flush_tlb_all() was called. */
>> +		if (unlikely(__flush_tlb_range(mm->context,
>> +				vma->vm_start, vma->vm_end)))
>> +			return;
>>  	}
>> -#endif
>>  }
>>=20
>>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>> @@ -76,11 +61,4 @@ static inline void flush_tlb_page(struct =
vm_area_struct *vma,
>>  	purge_tlb_end(flags);
>>  }
>>=20
>> -void __flush_tlb_range(unsigned long sid,
>> -	unsigned long start, unsigned long end);
>> -
>> -#define flush_tlb_range(vma,start,end) =
__flush_tlb_range((vma)->vm_mm->context,start,end)
>> -
>> -#define flush_tlb_kernel_range(start, end) =
__flush_tlb_range(0,start,end)
>> -
>>  #endif
>> diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
>> index f6448c7..4eac923 100644
>> --- a/arch/parisc/kernel/cache.c
>> +++ b/arch/parisc/kernel/cache.c
>> @@ -342,12 +342,15 @@ EXPORT_SYMBOL(flush_data_cache_local);
>>  EXPORT_SYMBOL(flush_kernel_icache_range_asm);
>>=20
>>  #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
>> -int parisc_cache_flush_threshold __read_mostly =3D FLUSH_THRESHOLD;
>> +static unsigned long parisc_cache_flush_threshold __read_mostly =3D =
FLUSH_THRESHOLD;
>> +
>> +#define FLUSH_TLB_THRESHOLD (2*1024*1024) /* 2MB initial TLB =
threshold */
>> +static unsigned long parisc_tlb_flush_threshold __read_mostly =3D =
FLUSH_TLB_THRESHOLD;
>>=20
>>  void __init parisc_setup_cache_timing(void)
>>  {
>>  	unsigned long rangetime, alltime;
>> -	unsigned long size;
>> +	unsigned long size, start;
>>=20
>>  	alltime =3D mfctl(16);
>>  	flush_data_cache();
>> @@ -364,14 +367,42 @@ void __init parisc_setup_cache_timing(void)
>>  	/* Racy, but if we see an intermediate value, it's ok too... */
>>  	parisc_cache_flush_threshold =3D size * alltime / rangetime;
>>=20
>> -	parisc_cache_flush_threshold =3D (parisc_cache_flush_threshold + =
L1_CACHE_BYTES - 1) &~ (L1_CACHE_BYTES - 1);
>> +	parisc_cache_flush_threshold =3D =
L1_CACHE_ALIGN(parisc_cache_flush_threshold);
>>  	if (!parisc_cache_flush_threshold)
>>  		parisc_cache_flush_threshold =3D FLUSH_THRESHOLD;
>>=20
>>  	if (parisc_cache_flush_threshold > cache_info.dc_size)
>>  		parisc_cache_flush_threshold =3D cache_info.dc_size;
>>=20
>> -	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs =
online)\n", parisc_cache_flush_threshold, num_online_cpus());
>> +	printk(KERN_INFO "Setting cache flush threshold to %lu kB\n",
>> +		parisc_cache_flush_threshold/1024);
>> +
>> +	/* calculate TLB flush threshold */
>> +
>> +	alltime =3D mfctl(16);
>> +	flush_tlb_all();
>> +	alltime =3D mfctl(16) - alltime;
>> +
>> +	size =3D PAGE_SIZE;
>> +	start =3D (unsigned long) _text;
>> +	rangetime =3D mfctl(16);
>> +	while (start < (unsigned long) _end) {
>> +		flush_tlb_kernel_range(start, start + PAGE_SIZE);
>> +		start +=3D PAGE_SIZE;
>> +		size +=3D PAGE_SIZE;
>> +	}
>> +	rangetime =3D mfctl(16) - rangetime;
>> +
>> +	printk(KERN_DEBUG "Whole TLB flush %lu cycles, flushing %lu =
bytes %lu cycles\n",
>> +		alltime, size, rangetime);
>> +
>> +	parisc_tlb_flush_threshold =3D size * alltime / rangetime;
>> +	parisc_tlb_flush_threshold =3D =
PAGE_ALIGN(parisc_tlb_flush_threshold);
>> +	if (!parisc_tlb_flush_threshold)
>> +		parisc_tlb_flush_threshold =3D FLUSH_TLB_THRESHOLD;
>> +
>> +	printk(KERN_INFO "Setting TLB flush threshold to %lu kB\n",
>> +		parisc_tlb_flush_threshold/1024);
>>  }
>>=20
>>  extern void purge_kernel_dcache_page_asm(unsigned long);
>> @@ -418,32 +449,39 @@ void purge_tlb_entries(struct mm_struct *mm, =
unsigned long addr)
>>  }
>>  EXPORT_SYMBOL(purge_tlb_entries);
>>=20
>> -void __flush_tlb_range(unsigned long sid, unsigned long start,
>> +/* __flush_tlb_range()
>> + *
>> + * returns 1 if all TLBs were flushed.
>> + */
>> +int __flush_tlb_range(unsigned long sid, unsigned long start,
>>  		       unsigned long end)
>>  {
>> -	unsigned long npages;
>> +	unsigned long size;
>>=20
>> -	npages =3D ((end - (start & PAGE_MASK)) + (PAGE_SIZE - 1)) >> =
PAGE_SHIFT;
>> -	if (npages >=3D 512)  /* 2MB of space: arbitrary, should be =
tuned */
>> +	size =3D (end - start);
>> +	if (size >=3D parisc_tlb_flush_threshold) {
>>  		flush_tlb_all();
>> +		return 1;
>> +	}
>>  	else {
>>  		unsigned long flags;
>>=20
>>  		purge_tlb_start(flags);
>>  		mtsp(sid, 1);
>>  		if (split_tlb) {
>> - 	 		while (npages--) {
>> +			while (start < end) {
>>  				pdtlb(start);
>>  				pitlb(start);
>>  				start +=3D PAGE_SIZE;
>>  			}
>>  		} else {
>> -			while (npages--) {
>> +			while (start < end) {
>>  				pdtlb(start);
>>  				start +=3D PAGE_SIZE;
>>  			}
>>  		}
>>  		purge_tlb_end(flags);
>> +		return 0;
>>  	}
>>  }
>>=20
>>=20
>=20
>=20




--Apple-Mail-81-64300394
Content-Disposition: attachment; filename="linux-4.1.1-20150701.d.txt"
Content-Type: text/plain; name="linux-4.1.1-20150701.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/arch/parisc/include/asm/pgtable.h =
b/arch/parisc/include/asm/pgtable.h
index 0a18375..0656235 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -16,7 +16,7 @@
 #include <asm/processor.h>
 #include <asm/cache.h>
=20
-extern spinlock_t pa_dbit_lock;
+extern spinlock_t pa_tlb_lock;
=20
 /*
  * kern_addr_valid(ADDR) tests if ADDR is pointing to valid kernel
@@ -33,6 +33,19 @@ extern spinlock_t pa_dbit_lock;
  */
 #define kern_addr_valid(addr)	(1)
=20
+/* Purge data and instruction TLB entries.  Must be called holding
+ * the pa_tlb_lock.  The TLB purge instructions are slow on SMP
+ * machines since the purge must be broadcast to all CPUs.
+ */
+
+static inline void purge_tlb_entries(struct mm_struct *mm, unsigned =
long addr)
+{
+	mtsp(mm->context, 1);
+	pdtlb(addr);
+	if (unlikely(split_tlb))
+		pitlb(addr);
+}
+
 /* Certain architectures need to do special things when PTEs
  * within a page table are directly modified.  Thus, the following
  * hook is made available.
@@ -42,15 +55,20 @@ extern spinlock_t pa_dbit_lock;
                 *(pteptr) =3D (pteval);                           \
         } while(0)
=20
-extern void purge_tlb_entries(struct mm_struct *, unsigned long);
+#define pte_inserted(x)						=
\
+	((pte_val(x) & (_PAGE_PRESENT|_PAGE_ACCESSED))		\
+	 =3D=3D (_PAGE_PRESENT|_PAGE_ACCESSED))
=20
-#define set_pte_at(mm, addr, ptep, pteval)                      \
-	do {                                                    \
+#define set_pte_at(mm, addr, ptep, pteval)			\
+	do {							\
+		pte_t old_pte;					\
 		unsigned long flags;				\
-		spin_lock_irqsave(&pa_dbit_lock, flags);	\
-		set_pte(ptep, pteval);                          \
-		purge_tlb_entries(mm, addr);                    \
-		spin_unlock_irqrestore(&pa_dbit_lock, flags);	\
+		spin_lock_irqsave(&pa_tlb_lock, flags);		\
+		old_pte =3D *ptep;				\
+		set_pte(ptep, pteval);				\
+		if (pte_inserted(old_pte))			\
+			purge_tlb_entries(mm, addr);		\
+		spin_unlock_irqrestore(&pa_tlb_lock, flags);	\
 	} while (0)
=20
 #endif /* !__ASSEMBLY__ */
@@ -268,7 +286,7 @@ extern unsigned long *empty_zero_page;
=20
 #define pte_none(x)     (pte_val(x) =3D=3D 0)
 #define pte_present(x)	(pte_val(x) & _PAGE_PRESENT)
-#define pte_clear(mm,addr,xp)	do { pte_val(*(xp)) =3D 0; } while (0)
+#define pte_clear(mm,addr,xp)	set_pte_at(mm, addr, xp, __pte(0))
=20
 #define pmd_flag(x)	(pmd_val(x) & PxD_FLAG_MASK)
 #define pmd_address(x)	((unsigned long)(pmd_val(x) &~ PxD_FLAG_MASK) << =
PxD_VALUE_SHIFT)
@@ -435,15 +453,15 @@ static inline int ptep_test_and_clear_young(struct =
vm_area_struct *vma, unsigned
 	if (!pte_young(*ptep))
 		return 0;
=20
-	spin_lock_irqsave(&pa_dbit_lock, flags);
+	spin_lock_irqsave(&pa_tlb_lock, flags);
 	pte =3D *ptep;
 	if (!pte_young(pte)) {
-		spin_unlock_irqrestore(&pa_dbit_lock, flags);
+		spin_unlock_irqrestore(&pa_tlb_lock, flags);
 		return 0;
 	}
 	set_pte(ptep, pte_mkold(pte));
 	purge_tlb_entries(vma->vm_mm, addr);
-	spin_unlock_irqrestore(&pa_dbit_lock, flags);
+	spin_unlock_irqrestore(&pa_tlb_lock, flags);
 	return 1;
 }
=20
@@ -453,11 +471,12 @@ static inline pte_t ptep_get_and_clear(struct =
mm_struct *mm, unsigned long addr,
 	pte_t old_pte;
 	unsigned long flags;
=20
-	spin_lock_irqsave(&pa_dbit_lock, flags);
+	spin_lock_irqsave(&pa_tlb_lock, flags);
 	old_pte =3D *ptep;
-	pte_clear(mm,addr,ptep);
-	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(&pa_dbit_lock, flags);
+	set_pte(ptep, __pte(0));
+	if (pte_inserted(old_pte))
+		purge_tlb_entries(mm, addr);
+	spin_unlock_irqrestore(&pa_tlb_lock, flags);
=20
 	return old_pte;
 }
@@ -465,10 +484,10 @@ static inline pte_t ptep_get_and_clear(struct =
mm_struct *mm, unsigned long addr,
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned =
long addr, pte_t *ptep)
 {
 	unsigned long flags;
-	spin_lock_irqsave(&pa_dbit_lock, flags);
+	spin_lock_irqsave(&pa_tlb_lock, flags);
 	set_pte(ptep, pte_wrprotect(*ptep));
 	purge_tlb_entries(mm, addr);
-	spin_unlock_irqrestore(&pa_dbit_lock, flags);
+	spin_unlock_irqrestore(&pa_tlb_lock, flags);
 }
=20
 #define pte_same(A,B)	(pte_val(A) =3D=3D pte_val(B))
diff --git a/arch/parisc/include/asm/tlbflush.h =
b/arch/parisc/include/asm/tlbflush.h
index 9d086a5..e84b964 100644
--- a/arch/parisc/include/asm/tlbflush.h
+++ b/arch/parisc/include/asm/tlbflush.h
@@ -13,6 +13,9 @@
  * active at any one time on the Merced bus.  This tlb purge
  * synchronisation is fairly lightweight and harmless so we activate
  * it on all systems not just the N class.
+
+ * It is also used to ensure PTE updates are atomic and consistent
+ * with the TLB.
  */
 extern spinlock_t pa_tlb_lock;
=20
@@ -24,20 +27,24 @@ extern void flush_tlb_all_local(void *);
=20
 #define smp_flush_tlb_all()	flush_tlb_all()
=20
+int __flush_tlb_range(unsigned long sid,
+	unsigned long start, unsigned long end);
+
+#define flush_tlb_range(vma, start, end) \
+	__flush_tlb_range((vma)->vm_mm->context, start, end)
+
+#define flush_tlb_kernel_range(start, end) \
+	__flush_tlb_range(0, start, end)
+
 /*
  * flush_tlb_mm()
  *
- * XXX This code is NOT valid for HP-UX compatibility processes,
- * (although it will probably work 99% of the time). HP-UX
- * processes are free to play with the space id's and save them
- * over long periods of time, etc. so we have to preserve the
- * space and just flush the entire tlb. We need to check the
- * personality in order to do that, but the personality is not
- * currently being set correctly.
- *
- * Of course, Linux processes could do the same thing, but
- * we don't support that (and the compilers, dynamic linker,
- * etc. do not do that).
+ * The code to switch to a new context is NOT valid for processes
+ * which play with the space id's.  Thus, we have to preserve the
+ * space and just flush the entire tlb.  However, the compilers,
+ * dynamic linker, etc, do not manipulate space id's, so there
+ * could be a significant performance benefit in switching contexts
+ * and not flushing the whole tlb.
  */
=20
 static inline void flush_tlb_mm(struct mm_struct *mm)
@@ -45,10 +52,18 @@ static inline void flush_tlb_mm(struct mm_struct =
*mm)
 	BUG_ON(mm =3D=3D &init_mm); /* Should never happen */
=20
 #if 1 || defined(CONFIG_SMP)
+	/* Except for very small threads, flushing the whole TLB is
+	 * faster than using __flush_tlb_range.  The pdtlb and pitlb
+	 * instructions are very slow because of the TLB broadcast.
+	 * It might be faster to do local range flushes on all CPUs
+	 * on PA 2.0 systems.
+	 */
 	flush_tlb_all();
 #else
 	/* FIXME: currently broken, causing space id and protection ids
-	 *  to go out of sync, resulting in faults on userspace =
accesses.
+	 * to go out of sync, resulting in faults on userspace accesses.
+	 * This approach needs further investigation since running many
+	 * small applications (e.g., GCC testsuite) is faster on HP-UX.
 	 */
 	if (mm) {
 		if (mm->context !=3D 0)
@@ -65,22 +80,12 @@ static inline void flush_tlb_page(struct =
vm_area_struct *vma,
 {
 	unsigned long flags, sid;
=20
-	/* For one page, it's not worth testing the split_tlb variable =
*/
-
-	mb();
 	sid =3D vma->vm_mm->context;
 	purge_tlb_start(flags);
 	mtsp(sid, 1);
 	pdtlb(addr);
-	pitlb(addr);
+	if (unlikely(split_tlb))
+		pitlb(addr);
 	purge_tlb_end(flags);
 }
-
-void __flush_tlb_range(unsigned long sid,
-	unsigned long start, unsigned long end);
-
-#define flush_tlb_range(vma,start,end) =
__flush_tlb_range((vma)->vm_mm->context,start,end)
-
-#define flush_tlb_kernel_range(start, end) =
__flush_tlb_range(0,start,end)
-
 #endif
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index f6448c7..cda6dbb 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -342,12 +342,15 @@ EXPORT_SYMBOL(flush_data_cache_local);
 EXPORT_SYMBOL(flush_kernel_icache_range_asm);
=20
 #define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
-int parisc_cache_flush_threshold __read_mostly =3D FLUSH_THRESHOLD;
+static unsigned long parisc_cache_flush_threshold __read_mostly =3D =
FLUSH_THRESHOLD;
+
+#define FLUSH_TLB_THRESHOLD (2*1024*1024) /* 2MB initial TLB threshold =
*/
+static unsigned long parisc_tlb_flush_threshold __read_mostly =3D =
FLUSH_TLB_THRESHOLD;
=20
 void __init parisc_setup_cache_timing(void)
 {
 	unsigned long rangetime, alltime;
-	unsigned long size;
+	unsigned long size, start;
=20
 	alltime =3D mfctl(16);
 	flush_data_cache();
@@ -364,14 +367,43 @@ void __init parisc_setup_cache_timing(void)
 	/* Racy, but if we see an intermediate value, it's ok too... */
 	parisc_cache_flush_threshold =3D size * alltime / rangetime;
=20
-	parisc_cache_flush_threshold =3D (parisc_cache_flush_threshold + =
L1_CACHE_BYTES - 1) &~ (L1_CACHE_BYTES - 1);=20
+	parisc_cache_flush_threshold =3D =
L1_CACHE_ALIGN(parisc_cache_flush_threshold);
 	if (!parisc_cache_flush_threshold)
 		parisc_cache_flush_threshold =3D FLUSH_THRESHOLD;
=20
 	if (parisc_cache_flush_threshold > cache_info.dc_size)
 		parisc_cache_flush_threshold =3D cache_info.dc_size;
=20
-	printk(KERN_INFO "Setting cache flush threshold to %x (%d CPUs =
online)\n", parisc_cache_flush_threshold, num_online_cpus());
+	printk(KERN_INFO "Setting cache flush threshold to %lu kB\n",
+		parisc_cache_flush_threshold/1024);
+
+	/* calculate TLB flush threshold */
+
+	alltime =3D mfctl(16);
+	flush_tlb_all();
+	alltime =3D mfctl(16) - alltime;
+
+	size =3D PAGE_SIZE;
+	start =3D (unsigned long) _text;
+	rangetime =3D mfctl(16);
+	while (start < (unsigned long) _end) {
+		flush_tlb_kernel_range(start, start + PAGE_SIZE);
+		start +=3D PAGE_SIZE;
+		size +=3D PAGE_SIZE;
+	}
+	rangetime =3D mfctl(16) - rangetime;
+
+	printk(KERN_DEBUG "Whole TLB flush %lu cycles, flushing %lu =
bytes %lu cycles\n",
+		alltime, size, rangetime);
+
+	parisc_tlb_flush_threshold =3D size * alltime / rangetime;
+	parisc_tlb_flush_threshold *=3D num_online_cpus();
+	parisc_tlb_flush_threshold =3D =
PAGE_ALIGN(parisc_tlb_flush_threshold);
+	if (!parisc_tlb_flush_threshold)
+		parisc_tlb_flush_threshold =3D FLUSH_TLB_THRESHOLD;
+
+	printk(KERN_INFO "Setting TLB flush threshold to %lu kB\n",
+		parisc_tlb_flush_threshold/1024);
 }
=20
 extern void purge_kernel_dcache_page_asm(unsigned long);
@@ -403,48 +435,45 @@ void copy_user_page(void *vto, void *vfrom, =
unsigned long vaddr,
 }
 EXPORT_SYMBOL(copy_user_page);
=20
-void purge_tlb_entries(struct mm_struct *mm, unsigned long addr)
-{
-	unsigned long flags;
-
-	/* Note: purge_tlb_entries can be called at startup with
-	   no context.  */
-
-	purge_tlb_start(flags);
-	mtsp(mm->context, 1);
-	pdtlb(addr);
-	pitlb(addr);
-	purge_tlb_end(flags);
-}
-EXPORT_SYMBOL(purge_tlb_entries);
-
-void __flush_tlb_range(unsigned long sid, unsigned long start,
-		       unsigned long end)
+/* __flush_tlb_range()
+ *
+ * returns 1 if all TLBs were flushed.
+ */
+int __flush_tlb_range(unsigned long sid, unsigned long start,
+		      unsigned long end)
 {
-	unsigned long npages;
+	unsigned long flags, size;
=20
-	npages =3D ((end - (start & PAGE_MASK)) + (PAGE_SIZE - 1)) >> =
PAGE_SHIFT;
-	if (npages >=3D 512)  /* 2MB of space: arbitrary, should be =
tuned */
+	size =3D (end - start);
+	if (size >=3D parisc_tlb_flush_threshold) {
 		flush_tlb_all();
-	else {
-		unsigned long flags;
+		return 1;
+	}
=20
+	/* Purge TLB entries for small ranges using the pdtlb and
+	   pitlb instructions.  These instructions execute locally
+	   but cause a purge request to be broadcast to other TLBs.  */
+	if (likely(!split_tlb)) {
+		while (start < end) {
+			purge_tlb_start(flags);
+			mtsp(sid, 1);
+			pdtlb(start);
+			purge_tlb_end(flags);
+			start +=3D PAGE_SIZE;
+		}
+		return 0;
+	}
+
+	/* split TLB case */
+	while (start < end) {
 		purge_tlb_start(flags);
 		mtsp(sid, 1);
-		if (split_tlb) {
-			while (npages--) {
-				pdtlb(start);
-				pitlb(start);
-				start +=3D PAGE_SIZE;
-			}
-		} else {
-			while (npages--) {
-				pdtlb(start);
-				start +=3D PAGE_SIZE;
-			}
-		}
+		pdtlb(start);
+		pitlb(start);
 		purge_tlb_end(flags);
+		start +=3D PAGE_SIZE;
 	}
+	return 0;
 }
=20
 static void cacheflush_h_tmp_function(void *dummy)
diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index 7581961..1c14e51 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -45,7 +45,7 @@
 	.level 2.0
 #endif
=20
-	.import         pa_dbit_lock,data
+	.import         pa_tlb_lock,data
=20
 	/* space_to_prot macro creates a prot id from a space id */
=20
@@ -420,8 +420,8 @@
 	SHLREG		%r9,PxD_VALUE_SHIFT,\pmd
 	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
 	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
-	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd
-	LDREG		%r0(\pmd),\pte		/* pmd is now pte */
+	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is =
now pte */
+	LDREG		%r0(\pmd),\pte
 	bb,>=3D,n		\pte,_PAGE_PRESENT_BIT,\fault
 	.endm
=20
@@ -453,57 +453,53 @@
 	L2_ptep		\pgd,\pte,\index,\va,\fault
 	.endm
=20
-	/* Acquire pa_dbit_lock lock. */
-	.macro		dbit_lock	spc,tmp,tmp1
+	/* Acquire pa_tlb_lock lock and recheck page is still present. =
*/
+	.macro		tlb_lock	spc,ptp,pte,tmp,tmp1,fault
 #ifdef CONFIG_SMP
 	cmpib,COND(=3D),n	0,\spc,2f
-	load32		PA(pa_dbit_lock),\tmp
+	load32		PA(pa_tlb_lock),\tmp
 1:	LDCW		0(\tmp),\tmp1
 	cmpib,COND(=3D)	0,\tmp1,1b
 	nop
+	LDREG		0(\ptp),\pte
+	bb,<,n		\pte,_PAGE_PRESENT_BIT,2f
+	b		\fault
+	stw             \spc,0(\tmp)
 2:
 #endif
 	.endm
=20
-	/* Release pa_dbit_lock lock without reloading lock address. */
-	.macro		dbit_unlock0	spc,tmp
+	/* Release pa_tlb_lock lock without reloading lock address. */
+	.macro		tlb_unlock0	spc,tmp
 #ifdef CONFIG_SMP
 	or,COND(=3D)	%r0,\spc,%r0
 	stw             \spc,0(\tmp)
 #endif
 	.endm
=20
-	/* Release pa_dbit_lock lock. */
-	.macro		dbit_unlock1	spc,tmp
+	/* Release pa_tlb_lock lock. */
+	.macro		tlb_unlock1	spc,tmp
 #ifdef CONFIG_SMP
-	load32		PA(pa_dbit_lock),\tmp
-	dbit_unlock0	\spc,\tmp
+	load32		PA(pa_tlb_lock),\tmp
+	tlb_unlock0	\spc,\tmp
 #endif
 	.endm
=20
 	/* Set the _PAGE_ACCESSED bit of the PTE.  Be clever and
 	 * don't needlessly dirty the cache line if it was already set =
*/
-	.macro		update_ptep	spc,ptep,pte,tmp,tmp1
-#ifdef CONFIG_SMP
-	or,COND(=3D)	%r0,\spc,%r0
-	LDREG		0(\ptep),\pte
-#endif
+	.macro		update_accessed	ptp,pte,tmp,tmp1
 	ldi		_PAGE_ACCESSED,\tmp1
 	or		\tmp1,\pte,\tmp
 	and,COND(<>)	\tmp1,\pte,%r0
-	STREG		\tmp,0(\ptep)
+	STREG		\tmp,0(\ptp)
 	.endm
=20
 	/* Set the dirty bit (and accessed bit).  No need to be
 	 * clever, this is only used from the dirty fault */
-	.macro		update_dirty	spc,ptep,pte,tmp
-#ifdef CONFIG_SMP
-	or,COND(=3D)	%r0,\spc,%r0
-	LDREG		0(\ptep),\pte
-#endif
+	.macro		update_dirty	ptp,pte,tmp
 	ldi		_PAGE_ACCESSED|_PAGE_DIRTY,\tmp
 	or		\tmp,\pte,\pte
-	STREG		\pte,0(\ptep)
+	STREG		\pte,0(\ptp)
 	.endm
=20
 	/* bitshift difference between a PFN (based on kernel's =
PAGE_SIZE)
@@ -1148,14 +1144,14 @@ dtlb_miss_20w:
=20
 	L3_ptep		ptp,pte,t0,va,dtlb_check_alias_20w
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20w
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
 =09
 	idtlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1174,14 +1170,14 @@ nadtlb_miss_20w:
=20
 	L3_ptep		ptp,pte,t0,va,nadtlb_check_alias_20w
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20w
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
 	idtlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1202,20 +1198,20 @@ dtlb_miss_11:
=20
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_11
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_11
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb_11	spc,pte,prot
=20
-	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb =
inserts */
+	mfsp		%sr1,t1  /* Save sr1 so we can use it in tlb =
inserts */
 	mtsp		spc,%sr1
=20
 	idtlba		pte,(%sr1,va)
 	idtlbp		prot,(%sr1,va)
=20
-	mtsp		t0, %sr1	/* Restore sr1 */
-	dbit_unlock1	spc,t0
+	mtsp		t1, %sr1	/* Restore sr1 */
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1235,21 +1231,20 @@ nadtlb_miss_11:
=20
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_11
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_11
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb_11	spc,pte,prot
=20
-
-	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb =
inserts */
+	mfsp		%sr1,t1  /* Save sr1 so we can use it in tlb =
inserts */
 	mtsp		spc,%sr1
=20
 	idtlba		pte,(%sr1,va)
 	idtlbp		prot,(%sr1,va)
=20
-	mtsp		t0, %sr1	/* Restore sr1 */
-	dbit_unlock1	spc,t0
+	mtsp		t1, %sr1	/* Restore sr1 */
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1269,16 +1264,16 @@ dtlb_miss_20:
=20
 	L2_ptep		ptp,pte,t0,va,dtlb_check_alias_20
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,dtlb_check_alias_20
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
-	f_extend	pte,t0
+	f_extend	pte,t1
=20
 	idtlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1297,16 +1292,16 @@ nadtlb_miss_20:
=20
 	L2_ptep		ptp,pte,t0,va,nadtlb_check_alias_20
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,nadtlb_check_alias_20
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
-	f_extend	pte,t0
+	f_extend	pte,t1
 =09
-        idtlbt          pte,prot
-	dbit_unlock1	spc,t0
+	idtlbt          pte,prot
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1406,14 +1401,14 @@ itlb_miss_20w:
=20
 	L3_ptep		ptp,pte,t0,va,itlb_fault
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
 =09
 	iitlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1430,14 +1425,14 @@ naitlb_miss_20w:
=20
 	L3_ptep		ptp,pte,t0,va,naitlb_check_alias_20w
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20w
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
 	iitlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1458,20 +1453,20 @@ itlb_miss_11:
=20
 	L2_ptep		ptp,pte,t0,va,itlb_fault
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb_11	spc,pte,prot
=20
-	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb =
inserts */
+	mfsp		%sr1,t1  /* Save sr1 so we can use it in tlb =
inserts */
 	mtsp		spc,%sr1
=20
 	iitlba		pte,(%sr1,va)
 	iitlbp		prot,(%sr1,va)
=20
-	mtsp		t0, %sr1	/* Restore sr1 */
-	dbit_unlock1	spc,t0
+	mtsp		t1, %sr1	/* Restore sr1 */
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1482,20 +1477,20 @@ naitlb_miss_11:
=20
 	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_11
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_11
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb_11	spc,pte,prot
=20
-	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb =
inserts */
+	mfsp		%sr1,t1  /* Save sr1 so we can use it in tlb =
inserts */
 	mtsp		spc,%sr1
=20
 	iitlba		pte,(%sr1,va)
 	iitlbp		prot,(%sr1,va)
=20
-	mtsp		t0, %sr1	/* Restore sr1 */
-	dbit_unlock1	spc,t0
+	mtsp		t1, %sr1	/* Restore sr1 */
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1516,16 +1511,16 @@ itlb_miss_20:
=20
 	L2_ptep		ptp,pte,t0,va,itlb_fault
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,itlb_fault
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
-	f_extend	pte,t0=09
+	f_extend	pte,t1=09
=20
 	iitlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1536,16 +1531,16 @@ naitlb_miss_20:
=20
 	L2_ptep		ptp,pte,t0,va,naitlb_check_alias_20
=20
-	dbit_lock	spc,t0,t1
-	update_ptep	spc,ptp,pte,t0,t1
+	tlb_lock	spc,ptp,pte,t0,t1,naitlb_check_alias_20
+	update_accessed	ptp,pte,t0,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
-	f_extend	pte,t0
+	f_extend	pte,t1
=20
 	iitlbt          pte,prot
-	dbit_unlock1	spc,t0
=20
+	tlb_unlock1	spc,t0
 	rfir
 	nop
=20
@@ -1568,14 +1563,14 @@ dbit_trap_20w:
=20
 	L3_ptep		ptp,pte,t0,va,dbit_fault
=20
-	dbit_lock	spc,t0,t1
-	update_dirty	spc,ptp,pte,t1
+	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
+	update_dirty	ptp,pte,t1
=20
 	make_insert_tlb	spc,pte,prot
 	=09
 	idtlbt          pte,prot
-	dbit_unlock0	spc,t0
=20
+	tlb_unlock0	spc,t0
 	rfir
 	nop
 #else
@@ -1588,8 +1583,8 @@ dbit_trap_11:
=20
 	L2_ptep		ptp,pte,t0,va,dbit_fault
=20
-	dbit_lock	spc,t0,t1
-	update_dirty	spc,ptp,pte,t1
+	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
+	update_dirty	ptp,pte,t1
=20
 	make_insert_tlb_11	spc,pte,prot
=20
@@ -1600,8 +1595,8 @@ dbit_trap_11:
 	idtlbp		prot,(%sr1,va)
=20
 	mtsp            t1, %sr1     /* Restore sr1 */
-	dbit_unlock0	spc,t0
=20
+	tlb_unlock0	spc,t0
 	rfir
 	nop
=20
@@ -1612,16 +1607,16 @@ dbit_trap_20:
=20
 	L2_ptep		ptp,pte,t0,va,dbit_fault
=20
-	dbit_lock	spc,t0,t1
-	update_dirty	spc,ptp,pte,t1
+	tlb_lock	spc,ptp,pte,t0,t1,dbit_fault
+	update_dirty	ptp,pte,t1
=20
 	make_insert_tlb	spc,pte,prot
=20
 	f_extend	pte,t1
 =09
-        idtlbt          pte,prot
-	dbit_unlock0	spc,t0
+	idtlbt          pte,prot
=20
+	tlb_unlock0	spc,t0
 	rfir
 	nop
 #endif
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 47ee620..7f67c4c 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -43,10 +43,6 @@
=20
 #include "../math-emu/math-emu.h"	/* for handle_fpe() */
=20
-#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
-DEFINE_SPINLOCK(pa_dbit_lock);
-#endif
--Apple-Mail-81-64300394--
