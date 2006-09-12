From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] [RFC]: rename ncr53c8xx to 53c720? [Was: D380 and
 ext[23] fs grave pb]
Date: Tue, 12 Sep 2006 11:09:09 +0000
Message-ID: <45069555.60807@scarlet.be>
References: <45018CEC.4040104@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Matthew Wilcox <matthew@wil.cx>
To: Parisc List <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45018CEC.4040104@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Matthew,

May be now that parisc-linux tree is managed with git and that driver is 
in fact only for ncr 53c720 hba, isn't it time to rename those stuff 
like ncr53c8xx to 53c720?

Awaitng a better fix, may I also suggest this small change:
--- drivers/scsi/ncr53c8xx.c.Orig       2006-09-11 11:26:36.000000000 +0200
+++ drivers/scsi/ncr53c8xx.c    2006-09-12 12:40:01.000000000 +0200
@@ -8362,7 +8362,12 @@
         tpnt->this_id           = 7;
         tpnt->sg_tablesize      = SCSI_NCR_SG_TABLESIZE;
         tpnt->cmd_per_lun       = SCSI_NCR_CMD_PER_LUN;
+#if defined(__hppa__)
+       /* FIXME: ENABLE_CLUSTERING cause ext fs corruptions */
+       tpnt->use_clustering    = DISABLE_CLUSTERING;
+#else
         tpnt->use_clustering    = ENABLE_CLUSTERING;
+#endif

         if (device->differential)
                 driver_setup.diff_support = device->differential;
=== <> ===

TIA for help,
	Joel


Joel Soete wrote:
> Hello James, Matthrew,
> 
> I come back to you with this pb because as explained in a previous mail: 
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030152.html> 
> 
> 
> , it seems to be related to ncr53c720 driver.
> 
> As I encountered same kind of pb on my c110:
> a few time after the reboot, I just did a tar/untar and already get:
> EXT3-fs error (device md2): ext3_readdir: bad entry in 
> directory4Remounting filesystem read-only
> 
> That said, it seems that I find a work around: I just reverted this
> <http://cvs.parisc-linux.org/linux-2.6/drivers/scsi/ncr53c8xx.c?r1=1.18&r2=1.19&makepatch=1&diff_format=h> 
> 
> ===================================================================
> RCS file: /var/lib/cvs/linux-2.6/drivers/scsi/ncr53c8xx.c,v
> retrieving revision 1.18
> retrieving revision 1.19
> diff -u -r1.18 -r1.19
> --- linux-2.6/drivers/scsi/ncr53c8xx.c    2004/07/20 22:06:43    1.18
> +++ linux-2.6/drivers/scsi/ncr53c8xx.c    2004/07/27 21:19:51    1.19
> @@ -8633,7 +8633,7 @@
>       tpnt->this_id        = 7;
>       tpnt->sg_tablesize    = SCSI_NCR_SG_TABLESIZE;
>       tpnt->cmd_per_lun    = SCSI_NCR_CMD_PER_LUN;
> -    tpnt->use_clustering    = DISABLE_CLUSTERING;
> +    tpnt->use_clustering    = ENABLE_CLUSTERING;
> 
>       if (device->differential)
>           driver_setup.diff_support = device->differential;
> === <> ===
> 
> And a loop like:
> # while true; do nice -n -5 tar -xslpf linux-2.6.12-rc1-pa1.tar ; nice 
> -n -5 rm -rf linux-2.6.12-rc1-pa 1-050319; date; done
> 
> was already running at least 85 time without any pb on this same c110 
> (same kernel 2.6.18-rc6-pa1 + jejb's patch + your
> timer_interrupt patch).
> 
> As you're scsi driver expert and also symbios/ncr one, may be have you 
> an idea where ncr stuff could be broken by enabling 'clustering'?
> 
> TIA,
>     Joel
> 
> Joel Soete wrote:
>  > Hello *pa,
>  >
>  > Making some stress test to atempt to identify some smp pb on my d380, 
> I figure
>  > out this ext[23] relatively grave pb. Effectively during this test loop:
>  > # while true ; do nice -n -3 tar -xspf linux-2.6.11-rc3-pa3.tar ; 
> nice -n -3 rm
>  > -rf linux-2.6.11-rc3-pa3 ; date ; done
>  >
>  > after about 30 iteration, I got a fs' corruption:
>  > EXT3-fs error (device sda10): ext3_readdir: bad entry in directory 
> #84801:
>  > rec_len % 4 != 0 - offset=0, inode=175234
>  > Aborting journal on device sda10.
>  >
>  > ext3_abort called.
>  >
>  > EXT3-fs error (device sda10): ext3_journal_start_sb: Detected aborted 
> journal
>  >
>  > Remounting filesystem read-only
>  >
>  > EXT3-fs error (device sda10): ext3_readdir: bad entry in directory 
> #84801:
>  > rec_len % 4 != 0 - offset=0, inode=1752397164, rec_len=24
>  > EXT3-fs error (device sda10): ext3_readdir: bad entry in directory 
> #84801:
>  > rec_len % 4 != 0 - offset=0, inode=1752397164, rec_len=24
>  > [snip]
>  >
>  > and during fsck I noticed:
>  > __journal_remove_journal_head: freeing b_committed_data
>  >
>  > Pass 2: Checking directory structure
>  > Directory inode 84801, block 0, offset 0: directory corrupted
>  > Salvage? yes
>  >
>  > Missing '.' in directory inode 84801.
>  > Fix? yes
>  >
>  > Setting filetype for entry '.' in ??? (84801) to 2.
>  > Missing '..' in directory inode 84801.
>  > Fix? yes
>  >
>  > [snip]
>  >
>  > As the first time it was with a smp kernel, I re-test with up kernels 
> only.
>  >
>  > This pb occured with different (up) kernels (2.6.17-rc6, 2.6.14, 
> 2.6.17 and
>  > even with 2.6.8.1) on different fs located on different disk and 
> different
>  > hba, and finaly on the 2 different cpu?
>  >
>  > That said I also get a fs corruption during a simple apt-get 
> dist-upgrade:
>  > (sdb6 being /var)
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 745764206, count = 1
>  > Aborting journal on device sdb6.
>  > ext3_abort called.
>  > EXT3-fs error (device sdb6): ext3_journal_start_sb: Detected aborted 
> journal
>  > Remounting filesystem read-only
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1869488138, count = 1
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1953459744, count = 1
>  > [snip]
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 2003788910, count = 1
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1851878701, count = 1
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1919248225, count = 1<3>BUG: soft lockup det
>  > ected on CPU#0!
>  > Backtrace:
>  >  [<1013222c>] update_process_times+0x34/0x80
>  >  [<1010748c>] timer_interrupt+0x9c/0x134
>  >  [<10145f44>] handle_IRQ_event+0x5c/0xa4
>  >  [<10146004>] __do_IRQ+0x78/0x18c
>  >  [<10107bc4>] do_cpu_irq_mask+0x6c/0xc8
>  >  [<1010a068>] intr_return+0x0/0xc
>  >
>  >
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1632635402, count = 1
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1734437731, count = 1
>  > [snip]
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 1313423904, count = 1
>  > EXT3-fs error (device sdb6): ext3_free_blocks: Freeing blocks not in 
> datazone -
>  > block = 171515972, count = 1
>  > EXT3-fs error (device sdb6) in ext3_reserve_inode_write: Journal has 
> aborted
>  > EXT3-fs error (device sdb6) in ext3_truncate: Journal has aborted
>  > EXT3-fs error (device sdb6) in ext3_reserve_inode_write: Journal has 
> aborted
>  > EXT3-fs error (device sdb6) in ext3_orphan_del: Journal has aborted
>  > EXT3-fs error (device sdb6) in ext3_reserve_inode_write: Journal has 
> aborted
>  > __journal_remove_journal_head: freeing b_committed_data
>  >
>  > It's the only system of this model on which I can reproduce but also 
> I can
>  > test (and as I am not hp, I don't have passwd diagnostic cd to test 
> hw ;-( ),
>  > so it's very hard to me if it's a driver pb (e.g. ncr hba) or a hw pb?
>  >
>  > Any idea, advises are welcome.
>  >
>  > Thanks in advance,
>  >     Joel
>  >
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
