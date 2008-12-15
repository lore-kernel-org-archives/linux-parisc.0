From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the boot-params tree
Date: Tue, 16 Dec 2008 00:20:58 +1100
Message-ID: <20081216002058.76891c3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-next@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
	Kyle McMartin <kyle@mcmartin.ca>,
	<linux-parisc@vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Rusty,

Today's linux-next merge of the boot-params tree got a conflict in
arch/parisc/kernel/setup.c between commit
14e01f8241387e4c236148bfaca77e3e546ad94d ("parisc: remove dead
BIO_VMERGE_BOUNDARY and BIO_VMERGE_MAX_SIZE definitions") from the parisc
tree and commit 0de5c2d9f02d2018fd671ca1015432dffa5eb338 ("param:
arch_get_boot_command_line()") from the boot-params tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/parisc/kernel/setup.c
index 8d8b024,3bdf1e2..0000000
--- a/arch/parisc/kernel/setup.c
+++ b/arch/parisc/kernel/setup.c
@@@ -58,7 -58,12 +58,7 @@@ int parisc_bus_is_phys __read_mostly = 
  EXPORT_SYMBOL(parisc_bus_is_phys);
  #endif
  
- void __init setup_cmdline(char **cmdline_p)
 -/* This sets the vmerge boundary and size, it's here because it has to
 - * be available on all platforms (zero means no-virtual merging) */
 -unsigned long parisc_vmerge_boundary = 0;
 -unsigned long parisc_vmerge_max_size = 0;
 -
+ void __init arch_get_boot_command_line(void)
  {
  	extern unsigned int boot_args[];
  
