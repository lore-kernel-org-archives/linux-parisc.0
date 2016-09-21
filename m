From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 parisc-hd tree
Date: Wed, 21 Sep 2016 15:20:06 +1000
Message-ID: <20160921152006.58c2c81c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/parisc/Kconfig

between commit:

  b5d5cf2b8a68 ("parisc: Drop BROKEN_RODATA config option")

from the parisc-hd tree and commit:

  7b4d24d8c01d ("atomic64: no need for CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/parisc/Kconfig
index f8dc10dcf292,8a96bdcc3807..000000000000
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@@ -14,7 -14,7 +14,6 @@@ config PARIS
  	select BUILDTIME_EXTABLE_SORT
  	select HAVE_PERF_EVENTS
  	select GENERIC_ATOMIC64 if !64BIT
- 	select ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE
 -	select BROKEN_RODATA
  	select GENERIC_IRQ_PROBE
  	select GENERIC_PCI_IOMAP
  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
