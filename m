From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Sun, 1 May 2005 01:49:01 -0600
Message-ID: <20050501074901.GA13801@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Trying to get "tvflash" running on pa8800. tvflash is a userspace
firmware flash tool for mellanox infiniband boards.
Works fine on x86, x86-64, ia64, ppc, and sparc64.
"tvflash -i" is supposed to go off and identify all
installed mellanox boards and which firmware rev they
currently have.

The panic is in pfn_to_nid():
        r = pfnnid_map[i];
        BUG_ON(r == 0xff);	<---- panic

Any clue what's broken?


[ sorry - feels like I'm reporting alot more problems than I'm
fixing lately *sigh* ]

thanks,
grant

grundler@ion:/usr/src/openib_gen2/src/userspace/tvflash$ sudo src/tvflash -i
open_hca(0)
kernel BUG at include/asm/mmzone.h:85!
Backtrace:
 [<0000000010113060>] dump_stack+0x18/0x28
 [<000000001018125c>] remap_pfn_range+0x37c/0x4b8
 [<00000000102413e4>] mmap_mem+0x2c/0x40
 [<0000000010187120>] do_mmap_pgoff+0x478/0x850
 [<0000000010114f84>] do_mmap2+0xa4/0x108
 [<0000000010115030>] sys_mmap+0x28/0x38
 [<0000000010107f80>] syscall_exit+0x0/0x14

Kernel panic - not syncing: BUG!
 <0>Rebooting in 5 seconds..
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
