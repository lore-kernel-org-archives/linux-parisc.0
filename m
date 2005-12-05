From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] kernel panic when reading from a NBD device
Date: Sun, 4 Dec 2005 22:25:15 -0700
Message-ID: <20051205052515.GA25789@colo.lackof.org>
References: <20051204202710.6615ca1e.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051204202710.6615ca1e.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 04, 2005 at 08:27:10PM +0100, Guy Martin wrote:
> If you read from a nbd device (b 43 0) you got a kernel panic (attached).
...
> Please have a look at the attached diff which is certainly not perfect
> but which is a good start :)

Yeah, seems like each "block driver" needs to call blk_queue_bounce_limit().
IDE and SCSI lib support do it on behalf of their subsystems.

> --- ../linux.orig/drivers/block/nbd.c	2005-09-05 20:05:01.000000000 +0200
> +++ drivers/block/nbd.c	2005-12-04 18:56:51.000000000 +0100
> @@ -665,6 +665,7 @@
>  		 * These structs are big so we dynamically allocate them.
>  		 */
>  		disk->queue = blk_init_queue(do_nbd_request, &nbd_lock);
> +		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_ANY);
>  		if (!disk->queue) {

blk_queue_bounce_limit() wants to be called *after* checking
the disk->queue ptr is valid. :)

Calling blk_queue_bounce_limit() sugests max_low_pn needs to be set.
Would the following patch properly set max_low_pfn?
I've stared at various bits of code for the past hour or two and
still aren't sure how this is really supposed to be used.

grant


Index: arch/parisc/mm/init.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/init.c,v
retrieving revision 1.22
diff -u -p -r1.22 init.c
--- arch/parisc/mm/init.c	12 Nov 2005 04:06:42 -0000	1.22
+++ arch/parisc/mm/init.c	5 Dec 2005 05:12:57 -0000
@@ -300,6 +300,13 @@ static void __init setup_bootmem(void)
 			max_pfn = start_pfn + npages;
 	}
 
+	/* IOMMU is always used to access "high mem" on those boxes
+	 * that can support enough mem that a PCI device couldn't
+	 * directly DMA to any physical addresses.
+	 * ISA DMA support will need to revisit this.
+	 */
+	max_low_pfn = max_pfn;
+
 	if ((bootmap_pfn - bootmap_start_pfn) != bootmap_pages) {
 		printk(KERN_WARNING "WARNING! bootmap sizing is messed up!\n");
 		BUG();
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
