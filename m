From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the parisc-hd tree
Date: Tue, 14 Nov 2017 15:39:48 +1100
Message-ID: <20171114153948.62467591@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
        Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  arch/parisc/include/uapi/asm/mman.h

between commit:

  48cd4dc8f57f ("parisc: Convert MAP_TYPE to cover 4 bits on parisc")

from the parisc-hd tree and commit:

  1c9725974074 ("mm: introduce MAP_SHARED_VALIDATE, a mechanism to safely define new mmap flag")

from the nvdimm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/parisc/include/uapi/asm/mman.h
index 9a39035986cc,bca652aa1677..000000000000
--- a/arch/parisc/include/uapi/asm/mman.h
+++ b/arch/parisc/include/uapi/asm/mman.h
@@@ -12,11 -11,10 +12,12 @@@
  
  #define MAP_SHARED	0x01		/* Share changes */
  #define MAP_PRIVATE	0x02		/* Changes are private */
+ #define MAP_SHARED_VALIDATE 0x03	/* share + validate extension flags */
 -#define MAP_TYPE	0x03		/* Mask for type of mapping */
 +#define MAP_TYPE	(MAP_SHARED|MAP_PRIVATE|MAP_RESRVD1|MAP_RESRVD2) /* Mask for type of mapping */
  #define MAP_FIXED	0x04		/* Interpret addr exactly */
 +#define MAP_RESRVD1	0x08		/* reserved for 3rd bit of MAP_TYPE */
  #define MAP_ANONYMOUS	0x10		/* don't use a file */
 +#define MAP_RESRVD2	0x20		/* reserved for 4th bit of MAP_TYPE */
  
  #define MAP_DENYWRITE	0x0800		/* ETXTBSY */
  #define MAP_EXECUTABLE	0x1000		/* mark it as an executable */
