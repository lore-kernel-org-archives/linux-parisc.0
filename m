From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Why gas kills the hppa-linux kernel and what you can
	do about it.
Date: Thu, 30 Jun 2005 14:36:03 -0400
Message-ID: <20050630183559.GK5269@systemhalted.org>
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


pa,

Assemble this using a binutils without Alan Modra's pa_block patch:
---        
	.data
foo:
        .block
bar:
        .block 0x3fffffff
com:
---

And I get this:

Backtrace:   
 [<101c10a4>] journal_add_journal_head+0xdc/0x13c
 [<101ba51c>] journal_dirty_data+0x64/0x1dc
 [<101a7634>] ext3_journal_dirty_data+0x1c/0x60
 [<101a73d8>] walk_page_buffers+0xe8/0xf4
 [<101a7d5c>] ext3_ordered_writepage+0x168/0x1fc
 [<1018c1d8>] mpage_writepages+0x2ac/0x3fc
 [<1018a4cc>] __sync_single_inode+0x5c/0x274
 [<1018a77c>] __writeback_single_inode+0x98/0x16c
 [<1018aa2c>] sync_sb_inodes+0x1dc/0x32c
 [<1018ac38>] writeback_inodes+0xbc/0xd8
 [<10147b08>] background_writeout+0xc4/0x11c
 [<1014884c>] __pdflush+0x134/0x204
 [<1014893c>] pdflush+0x20/0x2c
 [<1013abd0>] kthread+0xe8/0xf0
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=15 regs=3249c840 (Addr=73c9d7ba)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 10529010 101c10a4 73c9d7ba
r04-07  2046f930 45a703e8 2046f930 00000000
r08-11  00001000 00000000 00000000 45a703e8
r12-15  101a7bc4 00002000 4fe678dc 101a7bf4
r16-19  00000000 00000000 3249c508 00000002
r20-23  00000000 00000000 73c9d7ba 00000000
r24-27  00000034 00000000 73c9d7ba 1038e010
r28-31  73c9d7ba 00100100 3249c840 112d35d4
sr0-3   00000000 0000016a 00000000 0000016a
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10236f48 10236f4c
 IIR: 0ed91200    ISR: 00000000  IOR: 73c9d7ba
 CPU:        0   CR30: 3249c000 CR31: 10478000
 ORIG_R28: 3249c980
 IAOQ[0]: memset+0x24/0xac
 IAOQ[1]: memset+0x28/0xac
RP(r2): journal_add_journal_head+0xdc/0x13c
---

The story goes that binutils attempts to allocate a monstrous amount of
memory for that block. Newer binutils complain, Alan added some magic
checks.

The question I have is:

a. Why does the box die? Is this OOM looking for memory?
b. Why doesn't the process just die?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
