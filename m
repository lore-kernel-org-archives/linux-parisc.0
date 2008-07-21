From: Joel Soete <soete.joel@scarlet.be>
Subject: ccio-dma q about io pdir: is there a kernel mem space never paged?
Date: Mon, 21 Jul 2008 12:28:56 +0000
Message-ID: <48848108.5000805@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello all,

Re-reading: <http://www.hpl.hp.com/hpjournal/96feb/feb96a6.pdf>

I noticed another detail:
sic "Recall that the I/O page directory contains all active address translations and must be memory-resident."

Those key words "must be memory-resident" would mean to me never paged (in/out)?

Even thought I read ./include/linux/gfp.h, it's not clear to me which could be the gfp_mask I can use in:
	ioc->pdir_base = (u64 *)__get_free_pages(GFP_KERNEL,
                                                  get_order(ioc->pdir_size));

to advise kernel to never paging this I/O page directory?

Any idea?

Tia,
	J.
