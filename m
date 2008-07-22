From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re:ccio_mark_invalid(): would it have to clear a bit or byte?
Date: Tue, 22 Jul 2008 13:56:12 +0100
Message-ID: <K4ERXO$E35D44DFC4755555727B2E485DE272F6@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "linux-parisc" <linux-parisc@vger.kernel.org>
To: "soete\.joel" <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Hello all,
> 
> given this comment:
>   * Given a virtual address (vba, arg2) and space id, (sid, arg1),
>   * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
>   * entry consists of 8 bytes as shown below (MSB == bit 0):
>   *
>   *
>   * WORD 0:
>   * +------+----------------+-----------------------------------------------+
>   * | Phys | Virtual Index  |               Phys                            |
>   * | 0:3  |     0:11       |               4:19                            |
>   * |4 bits|   12 bits      |              16 bits                          |
>   * +------+----------------+-----------------------------------------------+
>   * WORD 1:
>   * +-----------------------+-----------------------------------------------+
>   * |      Phys    |  Rsvd  | Prefetch |Update |Rsvd  |Lock  |Safe  |Valid  |
>   * |     20:39    |        | Enable   |Enable |      |Enable|DMA   |       |
>   * |    20 bits   | 5 bits | 1 bit    |1 bit  |2 bits|1 bit |1 bit |1 bit  |
>   * +-----------------------+-----------------------------------------------+
>   *
> 
> and also this:
>          while (byte_cnt > 0) {
>                  /* clear I/O Pdir entry "valid" bit first */
>                  ((unsigned char *) pdir_ptr)[7] = 0;
> 
> So if I well understand 'Valid' field of a pdir entry is well of 1 bit but
the code cleanup a all byte?
> 
> Is coding something like:
> #define PTE_VALID_BIT_MASK      0xfffffffffffffffeULL	
> 
> 		*pdir_ptr &= PTE_VALID_BIT_MASK;
> 
> wouldn't do better what comment says it does?
> 
may be a more detail patch would better explain the idea:
@@ -674,19 +673,27 @@
 static CCIO_INLINE void
 ccio_mark_invalid(struct ioc *ioc, dma_addr_t iova, size_t byte_cnt)
 {
-       u32 iovp = (u32)CCIO_IOVP(iova);
-       size_t saved_byte_cnt;
+       u32     iovp;
+       u64     *pdir_ptr;
+       size_t  saved_byte_cnt;
 
+       iovp = (u32)CCIO_IOVP(iova);
+       pdir_ptr = &ioc->pdir_base[PDIR_INDEX(iovp)];
        /* round up to nearest page size */
        saved_byte_cnt = byte_cnt = ALIGN(byte_cnt, IOVP_SIZE);
 
        while(byte_cnt > 0) {
                /* invalidate one page at a time */
                unsigned int idx = PDIR_INDEX(iovp);
-               char *pdir_ptr = (char *) &(ioc->pdir_base[idx]);
-
                BUG_ON(idx >= (ioc->pdir_size / sizeof(u64)));
-               pdir_ptr[7] = 0;        /* clear only VALID bit */ 
+
+               /* clear only VALID bit */
+#ifdef __LP64__
+                *pdir_ptr &= ~((u64) IOPDIR_VALID);
+#else
+                ((unsigned long *) pdir_ptr)[1] &= ~IOPDIR_VALID;
+#endif
+
                /*
                ** FIXME: PCX_W platforms don't need FDC/SYNC. (eg C360)
                **   PCX-U/U+ do. (eg C200/C240)
@@ -695,8 +702,9 @@
                ** Hopefully someone figures out how to patch (NOP) the
                ** FDC/SYNC out at boot time.
                */
-               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
+               asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
 
+               pdir_ptr++;
                iovp     += IOVP_SIZE;
                byte_cnt -= IOVP_SIZE;
        }
=== <> ===

But it doesn'r fix any issue, though.

Cheers,
    J.


