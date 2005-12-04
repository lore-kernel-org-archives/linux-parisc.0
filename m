From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] kernel panic when reading from a NBD device
Date: Sun, 4 Dec 2005 20:27:10 +0100
Message-ID: <20051204202710.6615ca1e.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Sun__4_Dec_2005_20_27_10_+0100_MYIXanv0JyK92nNu"
To: parisc-linux@parisc-linux.org
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

This is a multi-part message in MIME format.

--Multipart=_Sun__4_Dec_2005_20_27_10_+0100_MYIXanv0JyK92nNu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi all,

If you read from a nbd device (b 43 0) you got a kernel panic (attached).

This bug is very similar to the one that Kyle fixed on 2.6.12 with the ide-cdrom kernel panicing when reading from it.

Even if I don't fully understand the problem, I was able to fix the problem using a similar fix.

Please have a look at the attached diff which is certainly not perfect but which is a good start :)

For reference, the Gentoo bug is here :
http://bugs.gentoo.org/show_bug.cgi?id=105414


Regards,
  Guy


--Multipart=_Sun__4_Dec_2005_20_27_10_+0100_MYIXanv0JyK92nNu
Content-Type: text/x-log;
 name="nbd-kernel-panic.log"
Content-Disposition: attachment;
 filename="nbd-kernel-panic.log"
Content-Transfer-Encoding: 7bit


Backtrace:
 [<101587d4>] blk_queue_bounce+0xf0/0x320
 [<1029efd4>] __make_request+0x70/0x548
 [<1029f880>] generic_make_request+0x150/0x2e8
 [<1029fa88>] submit_bio+0x70/0x120
 [<1016fc34>] submit_bh+0x124/0x194
 [<10172388>] block_read_full_page+0x324/0x370
 [<101512f0>] __do_page_cache_readahead+0x18c/0x2e0
 [<101515f8>] blockable_page_cache_readahead+0x70/0xec
 [<10151838>] page_cache_readahead+0x110/0x238
 [<1014995c>] do_generic_mapping_read+0x5e0/0x718
 [<1014c76c>] __generic_file_aio_read+0x154/0x1d4
 [<1014c920>] generic_file_read+0x90/0xc4
 [<1016c604>] vfs_read+0x84/0x17c
 [<1016ca28>] sys_read+0x54/0xa4
 [<1010d114>] syscall_exit+0x0/0x14


Kernel Fault: Code=26 regs=4e3ac980 (Addr=0000000c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111000001111 Not tainted
r00-03  00000000 00000420 101587d4 00011210
r04-07  00011200 00000000 00000000 4fc05770
r08-11  4fc03580 4e67cae8 4e3ac7d8 00000000
r12-15  00000000 10505010 10505010 10000000
r16-19  10175b58 00000000 10fd8ce0 ffffffaf
r20-23  10172848 4fc03580 4fc0577c 00000000
r24-27  00000000 00000010 00011200 103fc010
r28-31  4fc03580 00000420 4e3ac980 10152380
sr0-3   00000000 00000000 00000000 00000272
sr4-7   00000000 00000000 00000000 00000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  0000000100000001 0000000000000124 000000003a94d4f7 00000000431bde83
fr08-11  a7d72bedc38f6495 00071341955e038a 000000000019660d 4141e8b900000000
fr12-15  00000000104b3000 104b30001017c100 1046400000000228 4fc2014000000000
fr16-19  fffffff424850e06 0000001f00000000 0000001f00000000 0000001f00000000
fr20-23  0000000000000000 555555551016b810 00000ef80000077c 000016740000000a
fr24-27  000000030efb0956 3fe58edc3bd59924 4008000000000000 413e848000000000
fr28-31  3ff0000000000000 3fe0000000000000 41248f3200000000 412e848000000000

IASQ: 00000000 00000000 IAOQ: 1014ce6c 1014ce70
 IIR: 0cb81099    ISR: 00000000  IOR: 0000000c
 CPU:        0   CR30: 4e3ac000 CR31: 1045c000
 ORIG_R28: 00000000
 IAOQ[0]: mempool_alloc+0x38/0x100
 IAOQ[1]: mempool_alloc+0x3c/0x100
 RP(r2): blk_queue_bounce+0xf0/0x320
Kernel panic - not syncing: Kernel Fault
 
--Multipart=_Sun__4_Dec_2005_20_27_10_+0100_MYIXanv0JyK92nNu
Content-Type: text/x-patch;
 name="nbd-blk_queue_bounce_limit.patch"
Content-Disposition: attachment;
 filename="nbd-blk_queue_bounce_limit.patch"
Content-Transfer-Encoding: 7bit

--- ../linux.orig/drivers/block/nbd.c	2005-09-05 20:05:01.000000000 +0200
+++ drivers/block/nbd.c	2005-12-04 18:56:51.000000000 +0100
@@ -665,6 +665,7 @@
 		 * These structs are big so we dynamically allocate them.
 		 */
 		disk->queue = blk_init_queue(do_nbd_request, &nbd_lock);
+		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_ANY);
 		if (!disk->queue) {
 			put_disk(disk);
 			goto out;

--Multipart=_Sun__4_Dec_2005_20_27_10_+0100_MYIXanv0JyK92nNu
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Sun__4_Dec_2005_20_27_10_+0100_MYIXanv0JyK92nNu--
