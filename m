From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: fix mmap(MAP_FIXED|MAP_SHARED) to already mmapped address
Date: Thu, 03 Apr 2014 21:41:21 +0200
Message-ID: <533DB961.9010607@gmx.de>
References: <20131219191750.GC2881@blackmetal.musicnaut.iki.fi>	<BLU0-SMTP47556722282C83F98582B797C50@phx.gbl>	<201312191619.05005.vapier@gentoo.org>	<5313A12E.7010307@gmx.de>	<20140401182627.GA3285@drone.musicnaut.iki.fi>	<533B0A57.2060700@gmx.de> <CAE2sS1jZTzccFy_uWri++cgVz+AYVfY0_aFqXFxnJXZV3d1a0g@mail.gmail.com> <533C7C9A.5080703@gmx.de> <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030402020607000106090508"
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Mike Frysinger <vapier@gentoo.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>,
	Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP84F101069B44354FC1070C976D0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------030402020607000106090508
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/02/2014 11:41 PM, John David Anglin wrote:
> On 4/2/2014 5:09 PM, Helge Deller wrote:
>> On 04/02/2014 09:09 PM, Carlos O'Donell wrote:
>>> On Tue, Apr 1, 2014 at 2:49 PM, Helge Deller <deller@gmx.de> wrote:
>>>> Yes.
>>>> But it's not a kernel bug. Kernel 3.14 and previous stable releases are OK.
>>>>
>>>> I did proposed a glibc change in my previous mail (http://www.spinics.net/lists/linux-parisc/msg05384.html).
>>>> Debian bug report with patch is here:
>>>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=741243
>>>>
>>>> And this is what I proposed:
>>>>
>>>> A trivial FIX/workaround would be to change libc-mmap.h like this:
>>>> #ifdef __hppa__
>>>> #define MAP_FIXED_ALIGNMENT 4096
>>>> #else
>>>> #define MAP_FIXED_ALIGNMENT SHMLBA
>>>> #endif
>>>>
>>>> That works because then the new aligned address is then the same as the original
>>>> (the mmap call returns 4k aligned addresses, so it stays unchanged), but I'm not sure
>>>> if such a patch would be acceptable.
>>>> Do you have another idea/proposal?
>>> The responsibility for fixing this falls to me, but I've been busy.
>> No problem.
>>
>>> If someone wants to propose a patch for glibc please email
>>> libc-alpha@sourceware.org, TO me, and I'll review and commit the patch
>>> granted that you show you've done the appropriate testing.
>>>
>>> Otherwise I'll get to this at some point in the next couple of weeks :-(
>> Hi Carlos,
>>
>> I'm not really sure if my patch is the best way to go. Technically it's correct
>> and it's tested since all our debian buildservers currently run with this patch.
>> But all other options would probably involve more code changes.
>>
>> So, I think I'm happy if you can look at it at some point when you find time.
>> Your input would be very valuable here.

> I'm wondering if kernel value for SHMLBA shouldn't change to PAGE_SIZE to better
> reflect that attach addresses are page aligned.  The color alignment for shared maps
> seems a separate issue which maybe userspace doesn't need to worry about.

I think this is a very interesting idea and it should be pretty simple!

The attached patch for eglibc should resolve it.
And the attached patch for kernel isn't necessary, but makes it clear that the colouring is important.
 
I did tested the kernel patch - and it seems to work without problems.

I'm not sure if this might introduce userspace compile problems though (although unlikely).

Helge


--------------030402020607000106090508
Content-Type: text/x-patch;
 name="kernel_SHMLBA.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="kernel_SHMLBA.patch"

diff --git a/arch/parisc/include/asm/shmparam.h b/arch/parisc/include/asm/shmparam.h
index 628ddc2..d749144 100644
--- a/arch/parisc/include/asm/shmparam.h
+++ b/arch/parisc/include/asm/shmparam.h
@@ -1,8 +1,7 @@
 #ifndef _ASMPARISC_SHMPARAM_H
 #define _ASMPARISC_SHMPARAM_H
 
-#define __ARCH_FORCE_SHMLBA 	1
-
-#define SHMLBA 0x00400000   /* attach addr needs to be 4 Mb aligned */
+#define SHMLBA	   PAGE_SIZE	/* attach addr a multiple of this */
+#define SHM_COLOUR 0x00400000	/* shared mappings coulouring */
 
 #endif /* _ASMPARISC_SHMPARAM_H */
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index a6ffc77..2ea77e7 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -323,7 +323,7 @@ void flush_dcache_page(struct page *page)
 		 * specifically accesses it, of course) */
 
 		flush_tlb_page(mpnt, addr);
-		if (old_addr == 0 || (old_addr & (SHMLBA - 1)) != (addr & (SHMLBA - 1))) {
+		if (old_addr == 0 || (old_addr & (SHM_COLOUR - 1)) != (addr & (SHM_COLOUR - 1))) {
 			__flush_cache_page(mpnt, addr, page_to_phys(page));
 			if (old_addr)
 				printk(KERN_ERR "INEQUIVALENT ALIASES 0x%lx and 0x%lx in file %s\n", old_addr, addr, mpnt->vm_file ? (char *)mpnt->vm_file->f_path.dentry->d_name.name : "(null)");
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index b7cadc4..31ffa9b 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -45,7 +45,7 @@
 
 static int get_offset(unsigned int last_mmap)
 {
-	return (last_mmap & (SHMLBA-1)) >> PAGE_SHIFT;
+	return (last_mmap & (SHM_COLOUR-1)) >> PAGE_SHIFT;
 }
 
 static unsigned long shared_align_offset(unsigned int last_mmap,
@@ -57,8 +57,8 @@ static unsigned long shared_align_offset(unsigned int last_mmap,
 static inline unsigned long COLOR_ALIGN(unsigned long addr,
 			 unsigned int last_mmap, unsigned long pgoff)
 {
-	unsigned long base = (addr+SHMLBA-1) & ~(SHMLBA-1);
-	unsigned long off  = (SHMLBA-1) &
+	unsigned long base = (addr+SHM_COLOUR-1) & ~(SHM_COLOUR-1);
+	unsigned long off  = (SHM_COLOUR-1) &
 		(shared_align_offset(last_mmap, pgoff) << PAGE_SHIFT);
 
 	return base + off;
@@ -101,7 +101,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (flags & MAP_FIXED) {
 		if ((flags & MAP_SHARED) && last_mmap &&
 		    (addr - shared_align_offset(last_mmap, pgoff))
-				& (SHMLBA - 1))
+				& (SHM_COLOUR - 1))
 			return -EINVAL;
 		goto found_addr;
 	}
@@ -122,7 +122,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_legacy_base;
 	info.high_limit = mmap_upper_limit();
-	info.align_mask = last_mmap ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	info.align_mask = last_mmap ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(last_mmap, pgoff);
 	addr = vm_unmapped_area(&info);
 
@@ -161,7 +161,7 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	if (flags & MAP_FIXED) {
 		if ((flags & MAP_SHARED) && last_mmap &&
 		    (addr - shared_align_offset(last_mmap, pgoff))
-			& (SHMLBA - 1))
+			& (SHM_COLOUR - 1))
 			return -EINVAL;
 		goto found_addr;
 	}
@@ -182,7 +182,7 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
-	info.align_mask = last_mmap ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	info.align_mask = last_mmap ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(last_mmap, pgoff);
 	addr = vm_unmapped_area(&info);
 	if (!(addr & ~PAGE_MASK))

--------------030402020607000106090508
Content-Type: text/x-patch;
 name="eglibc.shmlba.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="eglibc.shmlba.patch"

diff -up ./ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h.org ./ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h
--- ./ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h.org	2014-04-03 13:20:43.644098000 -0600
+++ ./ports/sysdeps/unix/sysv/linux/hppa/bits/shm.h	2014-04-03 13:22:15.840098000 -0600
@@ -36,7 +36,7 @@
 #define SHM_UNLOCK	12		/* unlock segment (root only) */
 
 /* Segment low boundary address multiple.  */
-#define SHMLBA 0x00400000		/* address needs to be 4 Mb aligned */
+#define SHMLBA		(__getpagesize ())
 
 /* Type to count number of attaches.  */
 typedef unsigned long int shmatt_t;

--------------030402020607000106090508--
