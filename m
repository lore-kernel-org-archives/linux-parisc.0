From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] a b180 panic with 2.6.11-rc3-pa3
Date: Mon, 14 Feb 2005 11:30:43 +0000
Message-ID: <42075CE800002E4E@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "List Parisc" <parisc-linux@lists.parisc-linux.org>
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

Hi all,

Don't know if somebody else also emcountered such panic:
Backtrace:
 [<101bb588>] journal_add_journal_head+0xdc/0x13c
 [<101b4dd8>] journal_dirty_data+0x64/0x1b0
 [<101a6be4>] ext3_journal_dirty_data+0x1c/0x60
 [<101a69a8>] walk_page_buffers+0xe0/0xf0
 [<101a72b8>] ext3_ordered_writepage+0x168/0x1fc
 [<1018d770>] mpage_writepages+0x28c/0x3a0
 [<1018bae4>] __sync_single_inode+0x5c/0x278
 [<1018bd68>] __writeback_single_inode+0x68/0x168
 [<1018c034>] sync_sb_inodes+0x1cc/0x310
 [<1018c1e8>] writeback_inodes+0x70/0xd4
 [<10149088>] background_writeout+0xb4/0x10c
 [<10149e40>] __pdflush+0x138/0x204
 [<10149f2c>] pdflush+0x20/0x2c
 [<1013c564>] kthread+0xdc/0xe4
 [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=3D15 regs=3D17c84840 (Addr=3D20702352)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 10201800 101bb588 20702352
r04-07  122be660 122be660 122be660 00000000
r08-11  00000000 00000000 00001000 1230c3e8
r12-15  101a7120 17d1a990 00002000 00000000
r16-19  101a7150 17c84508 00000000 00000002
r20-23  00000000 00000000 20702352 00000000
r24-27  00000030 00000000 20702352 10375010
r28-31  20702352 100c74f4 17c84840 100c74fc
sr0-3   00000000 00000000 00000000 0000534b
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10201f1c 10201f20
 IIR: 0ed91222    ISR: 00000000  IOR: 20702352
 CPU:        0   CR30: 17c84000 CR31: 103d0000
 ORIG_R28: 17c84980
 IAOQ[0]: memset+0x24/0xa8
 IAOQ[1]: memset+0x28/0xa8
 RP(r2): journal_add_journal_head+0xdc/0x13c
Kernel panic - not syncing: Kernel Fault

Here on a b180 running 2.6.11-rc3-pa3 (while the system should be idle)

Any idea about known ext3 pb?

Joel



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
