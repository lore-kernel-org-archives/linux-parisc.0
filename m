From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix race in pci-dma.c
Date: Thu, 24 Nov 2016 20:06:32 -0500
Message-ID: <7E25B218-9BFA-487A-951B-8520E76B2A2C@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-12--782380578
Cc: Helge Deller <helge.deller@steuerkanzlei-deller.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: "linux-parisc@vger.kernel.org List" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-12--782380578
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

We are still troubled by occasional random segmentation faults and =
memory memory corruption on
SMP machines.  The causes quite a few package builds to fail on the =
Debian buildd machines for parisc.
When gcc-6 failed to build three times in a row, I looked again at the =
TLB related code again.  I found a
couple of issues.  This is the first.

In general, we need to ensure page table updates and corresponding TBL =
purges are atomic.  The
attached patch fixes an instance in pci-dma.c where the page table =
update was not guarded by the TLB
lock.

Tested on rp3440 and c8000.  So far, no further random segmentation =
faults have been observed.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>


--Apple-Mail-12--782380578
Content-Disposition: attachment;
	filename=pci-dma.c.d.txt
Content-Type: text/plain;
	name="pci-dma.c.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 02d9ed0..494ff6e 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -95,8 +95,8 @@ static inline int map_pte_uncached(pte_t * pte,
 
 		if (!pte_none(*pte))
 			printk(KERN_ERR "map_pte_uncached: page already exists\n");
-		set_pte(pte, __mk_pte(*paddr_ptr, PAGE_KERNEL_UNC));
 		purge_tlb_start(flags);
+		set_pte(pte, __mk_pte(*paddr_ptr, PAGE_KERNEL_UNC));
 		pdtlb_kernel(orig_vaddr);
 		purge_tlb_end(flags);
 		vaddr += PAGE_SIZE;

--Apple-Mail-12--782380578
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-12--782380578--
