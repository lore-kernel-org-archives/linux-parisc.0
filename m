From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: [parisc-linux] SLAB bug SMP 64bit / XFS mess
Date: Sun, 3 Apr 2005 03:34:56 +0200
Message-ID: <20050403033456.71a9cafa@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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

Hi pa-ckers

tried 2.6.12-rc1-pa9 64bit SMP (gcc 3.3.5) with DEBUG_SLAB enabled, got
the following BUG:
LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
kernel BUG at mm/slab.c:1495!
Backtrace:
 [<0000000010114480>] show_stack+0x60/0xf0
 [<0000000010301f7c>] $$divoI+0x30c/0x460
 [<0000000010107074>] intr_return+0x0/0x24
 [<00000000101df19c>] page_put_link+0x14c/0x258
 [<000000001011daac>] cpu_idle+0x34/0x40
 [<000000001013f548>] activate_task+0x98/0x108
 [<0000000010164ffc>] do_sigaction+0x1e4/0x2b8
 [<00000000101720ec>] kthread+0x144/0x150
 [<000000001010647c>] ret_from_kernel_thread+0x24/0x40
Kernel panic - not syncing: BUG!

Trying one more time was significantly the same (except the second line in
the backtrace):

LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
kernel BUG at mm/slab.c:1495!
Backtrace:
 [<0000000010114480>] show_stack+0x60/0xf0
 [<000000001010ab04>] $$remoI+0x278/0x1414
 [<0000000010107074>] intr_return+0x0/0x24
 [<000000001011daac>] cpu_idle+0x34/0x40
 [<000000001013f548>] activate_task+0x98/0x108
 [<0000000010164ffc>] do_sigaction+0x1e4/0x2b8
 [<00000000101720ec>] kthread+0x144/0x150
 [<000000001010647c>] ret_from_kernel_thread+0x24/0x40

Now the exact same kernel with DEBUG_SLAB disabled:

LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
SCSI subsystem initialized
unwind_init: start = 0x104bfec0, end = 0x104e7e90, entries = 10237
Performance monitoring counters enabled for Duet W+
SGI XFS with large block/inode numbers, no debug enabled
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 20)

Unfortunately things weren't meant to last long:

Checking root file system...
fsck 1.35 (28-Feb-2004)
Backtrace:
 [<000000001027e400>] xfs_alloc_fix_freelist+0x450/0x470
 [<000000001027f060>] xfs_free_extent+0xb8/0x120
 [<000000001028ff6c>] xfs_bmap_finish+0x17c/0x210
 [<00000000102b75e0>] xfs_itruncate_finish+0x188/0x388
 [<00000000102d5b40>] xfs_setattr+0x8d8/0x1068
 [<00000000102e80f4>] linvfs_setattr+0x174/0x228
 [<00000000101eb64c>] notify_change+0x204/0x2b0
 [<00000000101b8e50>] do_truncate+0x80/0x110
 [<00000000101d92a0>] may_open+0x270/0x2d8
 [<00000000101d9424>] open_namei+0x11c/0xc10
 [<00000000101ba1f8>] filp_open+0x48/0x88
 [<00000000101baae0>] sys_open+0x98/0xf0
 [<0000000010107fb4>] syscall_exit+0x0/0x14


Kernel Fault: Code=15 regs=00000000ff71ce90 (Addr=0000000566adeb00)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 0000000466c87700 000000001027e884
0000000566adeb00
r04-07  000000001060d840 000000001027e400 00000000ff0a5738
00000000ff71cce0
r08-11  0000000000000001 0000000000000000 0000000010488a80
0000000000000002
r12-15  00000000ff71c960 0000000000000000 0000000000000001
00000000ff71c950
r16-19  0008000000000001 0000000000000000 0000000000000001
00000000ffe57400
r20-23  0000000000000000 00000000ff1b3b40 0000000000000080
00000000ff2fd200
r24-27  00000000ffe7a000 000000000007e434 00000000ff0a5738
000000001060d840
r28-31  0000000000000000 00000000ff71cf20 00000000ff71ce90
00000000ffd459a8
sr0-3   000000000002a800 0000000000000000 0000000000000000
000000000002a800
sr4-7   0000000000000000 0000000000000000 0000000000000000
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001027e99c
000000001027e9a0
 IIR: 0c601014    ISR: 0000000000000000  IOR: 0000000566adeb00
 CPU:        1   CR30: 00000000ff71c000 CR31: 000000005001c08c
 ORIG_R28: 000000001060d840
 IAOQ[0]: xfs_alloc_read_agf+0x1bc/0x240
 IAOQ[1]: xfs_alloc_read_agf+0x1c0/0x240
 RP(r2): xfs_alloc_read_agf+0xa4/0x240
Kernel panic - not syncing: Kernel Fault

Truth told, it's 3:30 AM and I had a bunch of important things on that
machine, i'd rather not know how badly broken my FS is right now :(

HTH

T-Bone
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
