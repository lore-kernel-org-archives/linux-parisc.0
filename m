From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux]
	kernel crash in cache_alloc_refill (a500, 64-bit, UP)
Date: Sun, 19 Sep 2004 22:45:07 -0400
Message-ID: <20040920024506.GT17238@baldric.uwo.ca>
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

My kernels are being less than stable...
This is recent. Something has recently changed?
Any thoughts?

firin login: Backtrace:
 [<0000000010184e38>] kmem_cache_alloc+0x68/0x70
 [<00000000101b6664>] alloc_buffer_head+0x2c/0x90
 [<000000001022a980>] journal_write_metadata_buffer+0x88/0x8a8
 [<00000000102242f4>] journal_commit_transaction+0x7fc/0x2778
 [<000000001022a460>] kjournald+0x150/0x370
 [<000000001010647c>] ret_from_kernel_thread+0x24/0x38

Bad Address (null pointer deref?): Code=15 regs=000000006d2ec8f0 (Addr=4000000066354008)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001110 Not tainted
r00-03  0000000000000000 0000000010597100 00000000123d8ce8 000000000000000b
r04-07  0000000000000001 00000000123da000 00000000123d8bc0 00000000123d8cc8
r08-11  00000000123db000 00000000123d8d28 0000000000000850 000000006f702a40
r12-15  000000006d2ec508 0000000000330226 0000000000000000 0000000000000000
r16-19  0000000000000000 000000006ddfd06c 0000000000000f94 00000000123d8cc8
r20-23  7364650066354000 000000000000002c 0000000000000031 000000006637e000
r24-27  000000000000000a 000000006637e028 00000000123da010 0000000010516e80
r28-31  0000000000200200 0000000000100100 000000006d2ec8f0 00000000123d8cd8
sr0-3   0000000004c47000 0000000000000000 0000000000000000 0000000004c47000
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010184934 0000000010184938
 IIR: 0e9312d0    ISR: 0000000033646500  IOR: 4000000066354008
 CPU:        0   CR30: 000000006d2ec000 CR31: 00000000104e0000
 ORIG_R28: 000000005b4c1ab8
 IAOQ[0]: cache_alloc_refill+0x164/0x330
 IAOQ[1]: cache_alloc_refill+0x168/0x330
 RP(r2): 0x123d8ce8
Kernel panic - not syncing: Bad Address (null pointer deref?)
 <0>Rebooting in 180 seconds..

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
