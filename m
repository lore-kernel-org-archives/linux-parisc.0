Return-Path: <soete.joel@tiscali.be>
Received: from spoolo2.tiscali.be (spoolo2.tiscali.be [62.235.13.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2E38D48C8
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 18 Apr 2004 08:39:53 -0600 (MDT)
Message-ID: <40829331.6040905@tiscali.be>
Date: Sun, 18 Apr 2004 14:39:45 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
References: <407DA495.1090009@tiscali.be>
	<40711E5500006381@ocpmta2.freegates.net>
	<26419.193.161.152.244.1082114391.squirrel@www.puszczka.com>
	<4081731B.7070006@tiscali.be>
	<32875.127.0.0.1.1082234959.squirrel@www.puszczka.com>
	<4081A280.8050108@tiscali.be> <4081B70F.6060003@tiscali.be>
In-Reply-To: <4081B70F.6060003@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org, Andy Walker <ajwalker@broadpark.no>
Subject: [parisc-linux] Re: kernel>=2.6.4-rc3 hung or panic on C1[18]0 [was:
 2.6.5-rc2-pa2 boot panic on c110 :(]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

Sorry but I absolutly blind this week-end (no access to 192.25.206 ie debian.org, p-l.org and cvs.p-l.org :_( ), more over I had 
to confirm 'membership in the mailing list parisc-linux' which has been disabled, so I didn't received anymore followup :(

Any way I progress: I revert the following patch against the last pa kernel I had here ie 2.6.5-pa5:
===================================================================
RCS file: /var/lib/cvs/linux-2.6/drivers/parisc/ccio-dma.c,v
retrieving revision 1.12
retrieving revision 1.13
diff -u -r1.12 -r1.13
--- linux-2.6/drivers/parisc/ccio-dma.c 2004/03/09 21:49:04     1.12
+++ linux-2.6/drivers/parisc/ccio-dma.c 2004/03/10 19:24:48     1.13
@@ -38,9 +38,7 @@
  #include <linux/spinlock.h>
  #include <linux/slab.h>
  #include <linux/string.h>
-#define PCI_DEBUG
  #include <linux/pci.h>
-#undef PCI_DEBUG
  #include <linux/reboot.h>

  #include <asm/byteorder.h>
@@ -344,15 +342,16 @@
   * of available pages for the requested size.
   */
  static int
-ccio_alloc_range(struct ioc *ioc, unsigned long pages_needed)
+ccio_alloc_range(struct ioc *ioc, size_t size)
  {
+       unsigned int pages_needed = size >> IOVP_SHIFT;
         unsigned int res_idx;
  #ifdef CCIO_SEARCH_TIME
         unsigned long cr_start = mfctl(16);
  #endif

-       ASSERT(pages_needed);
-       ASSERT((pages_needed * IOVP_SIZE) <= DMA_CHUNK_SIZE);
+       BUG_ON(pages_needed == 0);
+       BUG_ON((pages_needed * IOVP_SIZE) > DMA_CHUNK_SIZE);

         DBG_RES("%s() size: %d pages_needed %d\n",
                 __FUNCTION__, size, pages_needed);
@@ -387,7 +386,7 @@
                 CCIO_FIND_FREE_MAPPING(ioc, res_idx, ~0UL, 64);
  #endif
         } else {
-               panic("%s: %s() Too many pages to map. pages_needed: %ld\n",
+               panic("%s: %s() Too many pages to map. pages_needed: %u\n",
                        __FILE__,  __FUNCTION__, pages_needed);
         }

@@ -420,7 +419,7 @@

  #define CCIO_FREE_MAPPINGS(ioc, res_idx, mask, size) \
          u##size *res_ptr = (u##size *)&((ioc)->res_map[res_idx]); \
-        ASSERT((*res_ptr & mask) == mask); \
+        BUG_ON((*res_ptr & mask) != mask); \
          *res_ptr &= ~(mask);

  /**
@@ -438,9 +437,9 @@
         unsigned long iovp = CCIO_IOVP(iova);
         unsigned int res_idx = PDIR_INDEX(iovp) >> 3;

-       ASSERT(pages_mapped);
-       ASSERT((pages_mapped * IOVP_SIZE) <= DMA_CHUNK_SIZE);
-       ASSERT(pages_mapped <= BITS_PER_LONG);
+       BUG_ON(pages_mapped == 0);
+       BUG_ON((pages_mapped * IOVP_SIZE) > DMA_CHUNK_SIZE);
+       BUG_ON(pages_mapped > BITS_PER_LONG);

         DBG_RES("%s():  res_idx: %d pages_mapped %d\n",
                 __FUNCTION__, res_idx, pages_mapped);
@@ -558,13 +557,14 @@
   * index are bits 12:19 of the value returned by LCI.
   */
  void CCIO_INLINE
-ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, void * vba, unsigned long hints)+ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, 
unsigned long vba,
+                  unsigned long hints)
  {
         register unsigned long pa = (volatile unsigned long) vba;
         register unsigned long ci; /* coherent index */

         /* We currently only support kernel addresses */
-       ASSERT(sid == KERNEL_SPACE);
+       BUG_ON(sid != KERNEL_SPACE);

         mtsp(sid,1);

@@ -677,7 +677,7 @@
                 unsigned int idx = PDIR_INDEX(iovp);
                 char *pdir_ptr = (char *) &(ioc->pdir_base[idx]);

-               ASSERT(idx < (ioc->pdir_size / sizeof(u64)));
+               BUG_ON(idx >= (ioc->pdir_size / sizeof(u64)));
                 pdir_ptr[7] = 0;        /* clear only VALID bit */
                 /*
                 ** FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
@@ -747,7 +747,7 @@
         BUG_ON(!dev);
         ioc = GET_IOC(dev);

-       ASSERT(size > 0);
+       BUG_ON(size <= 0);

         /* save offset bits */
         offset = ((unsigned long) addr) & ~IOVP_MASK;
@@ -761,7 +761,7 @@
         ioc->msingle_pages += size >> IOVP_SHIFT;
  #endif

-       idx = ccio_alloc_range(ioc, (size >> IOVP_SHIFT));
+       idx = ccio_alloc_range(ioc, size);
         iovp = (dma_addr_t)MKIOVP(idx);

         pdir_start = &(ioc->pdir_base[idx]);
@@ -774,7 +774,7 @@
                 hint |= HINT_SAFE_DMA;

         while(size > 0) {
-               ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, addr, hint);
+               ccio_io_pdir_entry(pdir_start, KERNEL_SPACE, (unsigned long)addr, hint);

                 DBG_RUN(" pdir %p %08x%08x\n",
                         pdir_start,
@@ -886,162 +886,10 @@
  */
  #define PIDE_FLAG 0x80000000UL

-/**
- * ccio_fill_pdir - Insert coalesced scatter/gather chunks into the I/O Pdir.
- * @ioc: The I/O Controller.
- * @startsg: The scatter/gather list of coalesced chunks.
- * @nents: The number of entries in the scatter/gather list.
- * @hint: The DMA Hint.
- *
- * This function inserts the coalesced scatter/gather list chunks into the
- * I/O Controller's I/O Pdir.
- */
-static CCIO_INLINE int
-ccio_fill_pdir(struct ioc *ioc, struct scatterlist *startsg, int nents,
-              unsigned long hint)
-{
-       struct scatterlist *dma_sg = startsg;   /* pointer to current DMA */
-       int n_mappings = 0;
-       unsigned long dma_offset = 0, dma_len = 0;
-       u64 *pdirp = NULL;
-
-       while (nents-- > 0) {
-               unsigned long vaddr;
-               long size;
-
-               DBG_RUN_SG(" %d : %08lx/%05x %08lx/%05x\n", nents,
-                          (unsigned long)sg_dma_address(startsg), cnt,
-                          sg_virt_addr(startsg), startsg->length
-               );
-
-
-               /*
-               ** Look for the start of a new DMA stream
-               */
-
-               if (sg_dma_address(startsg) & PIDE_FLAG) {
-                       u32 pide = sg_dma_address(startsg) & ~PIDE_FLAG;
-
-                       if (pdirp) {
-                               BUG_ON(dma_len != sg_dma_len(dma_sg));
-                               dma_sg++;
-                       }
-                       dma_len = sg_dma_len(startsg);
-                       dma_offset = (unsigned long) pide & ~IOVP_MASK;
-                       n_mappings++;
-                       sg_dma_address(dma_sg) = pide;
-                       pdirp = &(ioc->pdir_base[pide >> IOVP_SHIFT]);
-               }
-
-               BUG_ON(pdirp == NULL);
-
-               sg_dma_len(startsg) = 0;
-               vaddr = sg_virt_addr(startsg);
-               sg_dma_len(dma_sg) += startsg->length;
-               size = startsg->length + dma_offset;
-               dma_offset = 0;
-               if (unlikely(size > IOVP_SIZE)) {
-                       printk("VIRTUAL CHUNK has size 0x%lx\n",
-                              size);
-               }
  #ifdef CCIO_MAP_STATS
-               ioc->msg_pages += startsg->length >> IOVP_SHIFT;
+#define IOMMU_MAP_STATS
  #endif
-               do {
-                       ccio_io_pdir_entry(pdirp, KERNEL_SPACE,
-                                          (void *)vaddr, hint);
-                       vaddr += IOVP_SIZE;
-                       size -= IOVP_SIZE;
-                       pdirp++;
-               } while(unlikely(size > 0));
-               startsg++;
-       }
-       return(n_mappings);
-}
-
-/*
-** First pass is to walk the SG list and determine where the breaks are
-** in the DMA stream. Allocates PDIR entries but does not fill them.
-** Returns the number of DMA chunks.
-**
-** Doing the fill separate from the coalescing/allocation keeps the
-** code simpler. Future enhancement could make one pass through
-** the sglist do both.
-*/
-
-static CCIO_INLINE int
-ccio_coalesce_chunks(struct ioc *ioc, struct scatterlist *startsg, int nents)
-{
-       struct scatterlist *contig_sg;     /* contig chunk head */
-       unsigned long dma_offset, dma_len; /* start/len of DMA stream */
-       int n_mappings = 0;
-
-       while (nents > 0) {
-
-               /*
-               ** Prepare for first/next DMA stream
-               */
-               contig_sg = startsg;
-               dma_len = startsg->length;
-               dma_offset = sg_virt_addr(startsg) & ~IOVP_MASK;
-
-               /* PARANOID: clear entries */
-               sg_dma_address(startsg) = 0;
-               sg_dma_len(startsg) = 0;
-
-               /*
-               ** This loop terminates one iteration "early" since
-               ** it's always looking one "ahead".
-               */
-               while(--nents > 0) {
-                       unsigned long prevstartsg_end, startsg_end;
-
-                       prevstartsg_end = sg_virt_addr(startsg) +
-                               startsg->length;
-
-                       startsg++;
-                       startsg_end = sg_virt_addr(startsg) +
-                               startsg->length;
-
-                       /* PARANOID: clear entries */
-                       sg_dma_address(startsg) = 0;
-                       sg_dma_len(startsg) = 0;
-
-                       /*
-                       ** First make sure current dma stream won't
-                       ** exceed DMA_CHUNK_SIZE if we coalesce the
-                       ** next entry.
-                       */
-                       if(unlikely(ROUNDUP(dma_len + dma_offset + startsg->length,
-                                           IOVP_SIZE) > DMA_CHUNK_SIZE))
-                               break;
-
-                       /*
-                       ** Next see if we can append the next chunk (i.e.
-                       ** it must end on one page and begin on another
-                       */
-                       if (unlikely(((prevstartsg_end | sg_virt_addr(startsg))
& ~PAGE_MASK) != 0))
-                               break;
-
-                       dma_len += startsg->length;
-               }
-
-               /*
-               ** End of DMA Stream
-               ** Terminate last VCONTIG block.
-               ** Allocate space for DMA stream.
-               */
-               sg_dma_len(contig_sg) = dma_len;
-               dma_len = ROUNDUP(dma_len + dma_offset, IOVP_SIZE);
-               sg_dma_address(contig_sg) =
-                       PIDE_FLAG
-                       | (ccio_alloc_range(ioc, (dma_len >> IOVP_SHIFT)) << IOVP_SHIFT)
-                       | dma_offset;
-               n_mappings++;
-       }
-
-       return n_mappings;
-}
+#include "iommu-helpers.h"

  /**
   * ccio_map_sg - Map the scatter/gather list into the IOMMU.
@@ -1094,7 +942,7 @@
         ** w/o this association, we wouldn't have coherent DMA!
         ** Access to the virtual address is what forces a two pass algorithm.
         */
-       coalesced = ccio_coalesce_chunks(ioc, sglist, nents);
+       coalesced = iommu_coalesce_chunks(ioc, sglist, nents, ccio_alloc_range);
         /*
         ** Program the I/O Pdir
@@ -1104,7 +952,7 @@
         ** o dma_len will contain the number of bytes to map
         ** o page/offset contain the virtual address.
         */
-       filled = ccio_fill_pdir(ioc, sglist, nents, hint);
+       filled = iommu_fill_pdir(ioc, sglist, nents, hint, ccio_io_pdir_entry);

         spin_unlock_irqrestore(&ioc->res_lock, flags);

@@ -1446,16 +1294,16 @@
         */

         iov_order = get_order(iova_space_size) >> (IOVP_SHIFT - PAGE_SHIFT);
-       ASSERT(iov_order <= (30 - IOVP_SHIFT));   /* iova_space_size <= 1GB */
-       ASSERT(iov_order >= (20 - IOVP_SHIFT));   /* iova_space_size >= 1MB */
+       BUG_ON(iov_order > (30 - IOVP_SHIFT));   /* iova_space_size <= 1GB */
+       BUG_ON(iov_order < (20 - IOVP_SHIFT));   /* iova_space_size >= 1MB */
         iova_space_size = 1 << (iov_order + IOVP_SHIFT);

         ioc->pdir_size = (iova_space_size / IOVP_SIZE) * sizeof(u64);

-       ASSERT(ioc->pdir_size < 4 * 1024 * 1024);   /* max pdir size < 4MB */
+       BUG_ON(ioc->pdir_size >= 4 * 1024 * 1024);   /* max pdir size < 4MB */

         /* Verify it's a power of two */
-       ASSERT((1 << get_order(ioc->pdir_size)) == (ioc->pdir_size >> PAGE_SHIFT));
+       BUG_ON((1 << get_order(ioc->pdir_size)) != (ioc->pdir_size >> PAGE_SHIFT));

         DBG_INIT("%s() hpa 0x%p mem %luMB IOV %dMB (%d bits) PDIR size 0x%0x",
                 __FUNCTION__, ioc->ioc_hpa, physmem>>20, iova_space_size>>20,
@@ -1469,7 +1317,7 @@
         }
         memset(ioc->pdir_base, 0, ioc->pdir_size);

-       ASSERT((((unsigned long)ioc->pdir_base) & PAGE_MASK) == (unsigned long)ioc->pdir_base);
+       BUG_ON((((unsigned long)ioc->pdir_base) & PAGE_MASK) != (unsigned long)ioc->pdir_base);
         DBG_INIT(" base %p", ioc->pdir_base);

         /* resource map size dictated by pdir_size */
@@ -1708,6 +1556,7 @@
                                        proc_runway_root, ccio_resource_map, NULL);
         }
         parisc_vmerge_boundary = IOVP_SIZE;
+       parisc_vmerge_max_size = BITS_PER_LONG * IOVP_SIZE;
         ioc_count++;
         return 0;
  }
==================================================================================================

And the test (find + tar) works again.

I presume that wrong stuff come from the ccio_fill_pdir() or ccio_coalesce_chunks() merge with lba one?
But I don't have yet more accurate idea on what went wrong here (difference between functions are important).

(would it help to rebuild this same kernel tree with gcc-3.0 32bit would help? right now is was build with latest gcc-3.3.3.)

Grant, James any idea?

Thanks again for your understanding,
	Joel

Joel Soete wrote:
> Hi all,
> 
> To summarise I do following test with different kernel to locate this pb:
> launch severall find into local big tree (different release of kernel 
> tree) in the same time of a tar of one of those tree.
> 
> with kernel 2.6.3-pa2 no pb
> with 2.6.4-rc1-pa3 no pb (apparently)
> with 2.6.4-rc3-pa6 system crash (as well as with 2.6.4-rc3-pa1)
> 
> with the last one (2.6.4-rc3-pa1) I also log:
> attempt to access beyond end of device
> sdb9: rw=0, want=2307486096, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=2842788104, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=1904280008, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=2298589592, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=26325376, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=1371126224, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=3277938880, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=122917000, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=1151862976, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=3236466824, limit=3075696
> attempt to access beyond end of device
> sdb9: rw=0, want=3253102776, limit=3075696
> 
> during the first find alone?
> arq->state 2
> Badness in as_requeue_request at drivers/block/as-iosched.c:1479
> Kernel addresses on the stack:
>  [<10125de8>] printk+0x188/0x1c8
>  [<10105938>] dump_stack+0x18/0x24
>  [<102294fc>] as_requeue_request+0x64/0x10c
>  [<10220468>] elv_requeue_request+0x2c/0x38
>  [<1022313c>] blk_insert_request+0xfc/0x104
>  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
>  [<1024915c>] scsi_finish_command+0x9c/0xc0
>  [<10249068>] scsi_softirq+0xfc/0x11c
>  [<10262fb4>] ncr53c8xx_intr+0x74/0xbc
>  [<101299cc>] do_softirq+0xf4/0xf8
>  [<10220468>] elv_requeue_request+0x2c/0x38
>  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
>  [<10220468>] elv_requeue_request+0x2c/0x38
>  [<1010b068>] intr_return+0x0/0x14
>  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
>  [<1010b070>] intr_return+0x8/0x14
>  [<1016ba8c>] may_open+0x58/0x1c8
>  [<1015a850>] dentry_open+0x138/0x1c4
>  [<1016e784>] locate_fd+0x158/0x194
>  [<1010b068>] intr_return+0x0/0x14
> 
> kernel BUG at include/linux/blkdev.h:543!
> Kernel addresses on the stack:
>  [<10125de8>] printk+0x188/0x1c8
>  [<10105938>] dump_stack+0x18/0x24
>  [<1024ddc8>] scsi_request_fn+0x2a0/0x2c4
>  [<10220468>] elv_requeue_request+0x2c/0x38
>  [<10223120>] blk_insert_request+0xe0/0x104
>  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
>  [<1024915c>] scsi_finish_command+0x9c/0xc0
>  [<10249068>] scsi_softirq+0xfc/0x11c
>  [<10262fb4>] ncr53c8xx_intr+0x74/0xbc
>  [<101299cc>] do_softirq+0xf4/0xf8
>  [<10220468>] elv_requeue_request+0x2c/0x38
>  [<10107270>] do_cpu_irq_mask+0xfc/0x10c
>  [<10220468>] elv_requeue_request+0x2c/0x38
>  [<1010b068>] intr_return+0x0/0x14
>  [<1024cbb0>] scsi_queue_insert+0x68/0x9c
>  [<1010b070>] intr_return+0x8/0x14
>  [<1016ba8c>] may_open+0x58/0x1c8
>  [<1015a850>] dentry_open+0x138/0x1c4
>  [<1016e784>] locate_fd+0x158/0x194
>  [<1010b068>] intr_return+0x0/0x14
> [...]
> and so on severall time.
> 
> I also drive the same test over a nfs (as it seems that lan and scsi 
> ctrl on this c110 share the same U2 bridge?):
> no pb.
> 
> May I so reasonably thought that pb is loacted into ncr53c720 scsi driver?
> 
> Thanks in advance for additional help,
>     Joel
> 
> 
> 
> Joel Soete wrote:
> 
>>
>>
>> Andy Walker wrote:
>>
>>>> Hello Andy,
>>>>
>>>> Sorry for delay but I was a bit busy by a production server.
>>>
>>>
>>>
>>>
>>> No problem.
>>>
>>>
>>>>> 2.6.6-rc1-pa0 shows the same behaviour,
>>>>
>>>>
>>>>
>>>> Thanks.
>>>> but not a surprise regarding previous test.
>>>>
>>>>
>>>>> although it does seem to make it
>>>>> through the Gentoo boot process most times.
>>>>
>>>>
>>>>
>>>> I would not be surprise if it occures during some fsck. Do you also use
>>>> ext3 on your Gentoo?
>>>> btw Gentoo always install pkg by a local rebuild from src (that's a 
>>>> long
>>>> time that I visit the site)?
>>>
>>>
>>>
>>>
>>> That's the Gentoo way - so every package on my system is compiled
>>> -march=2.0 -mschedule=8000. The downside is that install and upgrade
>>> takes a long time on slow machines.
>>
>>
>>
>> Yes that why I do not investegate more: I don't have a lot of budget 
>> for my system which are generaly systems a bit outdated machine 
>> recover from trash still just enough for my investigation but a bit 
>> too slow to build all the tools I would like to maintained uptodate 
>> frequently. The very great stuff would have to have the choice: update 
>> from pre-compiled binaries or a local compile. The debian packaging 
>> system is very robust (some month ago, on a i386, I do an update from 
>> a old woody (r0 iirc) directly to unstable aka sid without any pb) but 
>> I do not yet find a clear doc explaining me how to personalize pkg 
>> from dpkg src (I would like for instance change the prefix in general 
>> /usr into /opt/app/app_rev a la hp)?
>>
>>> The upside is that you get total
>>> control over package selection and compilation options. I've played
>>> with Debian before but I find apt a pain compared to Gentoo's portage.
>>> Also all this sid/woody/stable/unstable etc.... stuff confuses me.
>>>
>> That is the simple aspect: in short
>>     the current stable release was named (the 2.x was potato, the 
>> current one woody)
>>     the very last packages otc are put in unstable (aka sid) for large 
>> testing and debuging
>>     when pkg become enough stable it is pushed in testing the futur 
>> debian release (recently named sarge)
>>
>> there are also security update for stable release only because there 
>> are in general in unstable and testing before!
>>
>> For my part I only have ineterest in very last available packages (so 
>> sid or unstable) to test new features but some times (rarely in fact) 
>> the system is a bit 'unstable' :) (that's my choice).
>>
>>>
>>>>> I've compiled 2.6.3-pa2 in the hope of getting the C180 up and stable.
>>>>
>>>>
>>>>
>>>> This seems to be the last one enough stable for me and my c110: I just
>>>> updated my distro (that used a lot tar iirc) and all works
>>>> fine with this kernel.
>>>
>>>
>>>
>>>
>>> 2.6.3-pa2 is rock solid. I've been running updates, kernel compilation -
>>> pretty heavy stuff, and no problems.
>>> I'm just about to 'emerge' X11 - that should keep it downloading,
>>> untarring and compiling for 24 hours.
>>>
>> Ok
>>
>>> Any suggestions for things I might test to narrow our problem down.
>>>
>> Not realy for the moment, as explain previously, the problem seems to 
>> apear between 2.6.4-rc1-pa3 and 2.6.4-rc3-pa6.
>> I will try to figure out now if it comes from upstream or from or 
>> tree: I am on going to rebuild 2.6.4-rc3-pa1 and see how will it behave.
>>
>> Thanks a lot,
>>     Joel
>>
> 
