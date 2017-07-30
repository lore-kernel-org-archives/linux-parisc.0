From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Handle vma's whose context is not current in flush_cache_range
Date: Sun, 30 Jul 2017 16:20:19 -0400
Message-ID: <2F93578B-24A8-46DB-AE61-A05C8E118A4C@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-23--847190403
Cc: Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-23--847190403
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

In testing James' patch to drivers/parisc/pdc_stable.c, I hit the BUG =
statement in flush_cache_range()
during a system shutdown:

kernel BUG at arch/parisc/kernel/cache.c:595!
CPU: 2 PID: 6532 Comm: kworker/2:0 Not tainted 4.13.0-rc2+ #1
Workqueue: events free_ioctx
task: 000000007b32abb0 task.stack: 0000000062180000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111011100001111 Not tainted
r00-03  000000ff0804f70f 000000004072bdc0 000000004016302c =
0000000062180aa0
r04-07  00000000407165c0 000000007b41f590 00000000f37bd000 =
00000000f37c0000
r08-11  000000007b41f590 00000000621806b8 0000000000000001 =
0000000000000064
r12-15  00000000407435c0 00000000407445c0 00000000f37bd000 =
0000000000000000
r16-19  fffffff0f0d00b0c 00000000621806b8 000000007b41f590 =
0000000062180000
r20-23  0000000000000f97 000000000800000f 00000000621806b8 =
00000000f37c0000
r24-27  00000000f37c0000 000000000800000f 0000000040888100 =
00000000407165c0
r28-31  000000000b9ba800 0000000062180ce0 0000000062180b40 =
00000000004ca800
sr00-03  000000000b9ba800 00000000004ca800 0000000000000000 =
000000000b9ba800
sr04-07  0000000000000000 0000000000000000 0000000000000000 =
0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040163084 =
0000000040163088
 IIR: 03ffe01f    ISR: 0000000010240000  IOR: 0000008860180018
 CPU:        2   CR30: 0000000062180000 CR31: ffffffffffffffff
 ORIG_R28: 0000000062180d30
 IAOQ[0]: flush_cache_range+0x144/0x148
 IAOQ[1]: flush_cache_page+0x0/0x1a8
 RP(r2): flush_cache_range+0xec/0x148
Backtrace:
 [<00000000402910ac>] unmap_page_range+0x84/0x880
 [<00000000402918f4>] unmap_single_vma+0x4c/0x60
 [<0000000040291a18>] zap_page_range_single+0x110/0x160
 [<0000000040291c34>] unmap_mapping_range+0x174/0x1a8
 [<000000004026ccd8>] truncate_pagecache+0x50/0xa8
 [<000000004026cd84>] truncate_setsize+0x54/0x70
 [<000000004033d534>] put_aio_ring_file+0x44/0xb0
 [<000000004033d5d8>] aio_free_ring+0x38/0x140
 [<000000004033d714>] free_ioctx+0x34/0xa8
 [<00000000401b0028>] process_one_work+0x1b8/0x4d0
 [<00000000401b04f4>] worker_thread+0x1b4/0x648
 [<00000000401b9128>] kthread+0x1b0/0x208
 [<0000000040150020>] end_fault_vector+0x20/0x28
 [<0000000040639518>] nf_ip_reroute+0x50/0xa8
 [<0000000040638ed0>] nf_ip_route+0x10/0x78
 [<0000000040638c90>] xfrm4_mode_tunnel_input+0x180/0x1f8

CPU: 2 PID: 6532 Comm: kworker/2:0 Not tainted 4.13.0-rc2+ #1
Workqueue: events free_ioctx
Backtrace:
 [<0000000040163bf0>] show_stack+0x20/0x38
 [<0000000040688480>] dump_stack+0xa8/0x120
 [<0000000040163dc4>] die_if_kernel+0x19c/0x2b0
 [<0000000040164d0c>] handle_interruption+0xa24/0xa48

This patch modifies flush_cache_range() to handle non current contexts.  =
In as much as this occurs
infrequently, the simplest approach is to flush the entire cache when =
this happens.

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-23--847190403
Content-Disposition: attachment;
	filename=cache.c.d.txt
Content-Type: text/plain;
	name="cache.c.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index 85a92db70afc..19c0c141bc3f 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -587,13 +587,12 @@ void flush_cache_range(struct vm_area_struct *vma,
 	if (parisc_requires_coherency())
 		flush_tlb_range(vma, start, end);
 
-	if ((end - start) >= parisc_cache_flush_threshold) {
+	if ((end - start) >= parisc_cache_flush_threshold
+	    || vma->vm_mm->context != mfsp(3)) {
 		flush_cache_all();
 		return;
 	}
 
-	BUG_ON(vma->vm_mm->context != mfsp(3));
--Apple-Mail-23--847190403--
