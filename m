From: Adrian Bunk <bunk@kernel.org>
Subject: parisc compile error
Date: Fri, 8 Feb 2008 01:12:32 +0200
Message-ID: <20080207231232.GF7198@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Christoph Lameter <clameter@sgi.com>, kyle@parisc-linux.org,
	matthew@wil.cx, grundler@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit 9e2779fa281cfda13ac060753d674bbcaa23367e broke parisc:

<--  snip  -->

...
  CC      arch/parisc/kernel/asm-offsets.s
In file included from include/asm/pgtable.h:13,
                 from arch/parisc/kernel/asm-offsets.c:36:
include/linux/mm.h: In function 'is_vmalloc_addr':
include/linux/mm.h:243: error: 'VMALLOC_START' undeclared (first use in this function)
include/linux/mm.h:243: error: (Each undeclared identifier is reported only once
include/linux/mm.h:243: error: for each function it appears in.)
include/linux/mm.h:243: error: 'VMALLOC_END' undeclared (first use in this function)
make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1

<--  snip  -->

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
