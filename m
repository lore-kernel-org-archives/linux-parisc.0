From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] cache_grow panic on 715/100
Date: Mon, 4 Apr 2005 15:56:19 +0100
Message-ID: <20050404145619.GA11924@ntlworld.com>
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

Hi,

I just got the cache_grow panic on my 715/100:

Unpacking libgtk2.0-0 (from ../libgtk2.0-0_2.6.2-4_hppa.deb) ...
Selecting previously deselected package libidl0.
Unpacking libidl0 (from ../libidl0_0.8.5-1_hppa.deb) ...
Selecting previously deselected package mozilla-firefox.
Unpacking mozilla-firefox (from .../mozilla-firefox_1.0.2-1_hppa.deb) ...
Backtrace:
 [<1014f854>] cache_grow+0xd4/0x1a8
 [<1014fac8>] cache_alloc_refill+0x1a0/0x260
 [<1014fdc0>] kmem_cache_alloc+0x30/0x4c
 [<101c1680>] journal_alloc_journal_head+0x28/0xac
 [<101c17f0>] journal_add_journal_head+0xc8/0x13c
 [<101bae74>] journal_dirty_data+0x64/0x1b0
 [<101aa494>] ext3_journal_dirty_data+0x1c/0x60
 [<101aa25c>] walk_page_buffers+0xe0/0xf0
 [<101aab68>] ext3_ordered_writepages+0x168/0x1fc
 [<1019112c>] mpage_writepages+0x28c/0x3b0
 [<1018f48c>] __sync_single_inonde+0x5c/0x278
 [<1018f710>] __writebacak_single_inode+0x68/0x168
 [<1018f9dc>] sync_sb_inodes+0x1cc/0x310
 [<1018fb90>] writeback_inodes+0x70/0xd4
 [<1014cc50>] background_writeout+0xb4/0x10c
 [<1014d93c>] __pdflush+0x138/0x204


Kernel Fault: Code=15 regs=106a4a40 (Addr=26e3688c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001110011100001111 Not tainted
r00-03  00000000 10362620 1014d854 1035a9b4
r04-07  16adc000 100ad460 00000010 00000050
r08-11  00000001 00000000 00001000 136543e8
r12-15  101aa9d0 1073458c 00002000 00000000
r16-19  101aaa00 106a4508 00000000 26e369b4
r20-23  0000000f 00000000 102df4f4 00000050
r24-27  1035a87c 00000050 100ad460 102cd010
r28-31  26e3687c 00000000 106a4a40 10152084
sr0-3   00000000 000001dc 00000000 000001dc
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1014f5c8 1014f5cc
 IIR: 6b800020    ISR: 00000000  IOR: 26e3688c
 CPU:        0   CR30: 106a4000 CR31: 10314000
 ORIG_R28: 24e0bb4c
 IAOQ[0]: alloc_slabmgmt+0x30/0x6c
 IAOQ[1]: alloc_slabmgmt+0x34/0x6c
 RP(r2): cache_grow+0xd4/0x1a8
Kernel panic - not syncing: Kernel Fault

-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
