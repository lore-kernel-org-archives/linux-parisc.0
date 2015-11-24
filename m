From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc huge page support for v4.4
Date: Tue, 24 Nov 2015 18:00:20 +0100
Message-ID: <20151124170020.GA13198@p100.box>
References: <20151122115153.GA28471@p100.box>
 <alpine.LRH.2.02.1511241014280.9586@file01.intranet.prod.int.rdu2.redhat.com>
 <5654892D.1030707@gmx.de>
 <alpine.LRH.2.02.1511241136440.14442@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1511241136440.14442@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Mikulas Patocka <mpatocka@redhat.com>:
> 
> 
> On Tue, 24 Nov 2015, Helge Deller wrote:
> 
> > > Hi
> > > 
> > > Since the kernel 4.4-rc2 I'm getting frequent boot failures on PA-RISC. 
> > > When I revert this patchset, the crashes are gone.
> > 
> > > [    3.296666] CPU(s): 4 out of 4 PA8900 (Shortfin) at 1000.000000 MHz online
> > 
> > Hi Mikulas,
> > 
> > Yes, I've seen this as well.
> > It affects only the PA8900 CPUs, while all PA8500-PA8700 machines seem to work fine.
> > I do have a temporary 3-line patch to avoid the crashes which I'll push to my tree shortly.
> > I'm still investigating why it only affects the PA8900 CPUs, but I assume
> > it's related to the cache aliasing of those CPUs.
> > I'll keep you updated.
> > 
> > Helge
> 
> The PA-RISC specification doesn't allow aliasing on non-equaivalent 
> addresses. Can the kernel map a piece of kernel data to other virtual 
> address? If yes, we can't use big pages to map kernel data.

Can you please try the two patches below?
The first one disables mapping kernel text/data on huge pages on
PA8800/PA8900 CPUs. Patch works for me on my Mako PA8800.

Independend of my huge page patch the second patch disables the tlb
flush optimization we added earlier. It seems calling flush_tlb_all()
doesn't reliably flushes tlbs on all CPUs so it's better to fall back to
the loop implementation.

Helge


diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 1b366c4..958b7f36 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -475,19 +475,22 @@ static void __init map_pages(unsigned long start_vaddr,
 					pte =  __mk_pte(address, pgprot);
 				else if (parisc_text_address(vaddr)) {
 					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
-					if (address >= ro_start && address < kernel_end)
+					if (address >= ro_start && address < kernel_end
+					    && !parisc_requires_coherency())
 						pte = pte_mkhuge(pte);
 				}
 				else
 #if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
 				if (address >= ro_start && address < ro_end) {
 					pte = __mk_pte(address, PAGE_KERNEL_EXEC);
-					pte = pte_mkhuge(pte);
+					if (!parisc_requires_coherency())
+						pte = pte_mkhuge(pte);
 				} else
 #endif
 				{
 					pte = __mk_pte(address, pgprot);
-					if (address >= ro_start && address < kernel_end)
+					if (address >= ro_start && address < kernel_end
+					    && !parisc_requires_coherency())
 						pte = pte_mkhuge(pte);
 				}
 
diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index cda6dbb..80ced95 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -445,7 +445,7 @@ int __flush_tlb_range(unsigned long sid, unsigned long start,
 	unsigned long flags, size;
 
 	size = (end - start);
-	if (size >= parisc_tlb_flush_threshold) {
+	if (0 && size >= parisc_tlb_flush_threshold) {
 		flush_tlb_all();
 		return 1;
 	}
