From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Wed, 29 Dec 2004 15:28:29 -0600
Message-ID: <1104355710.5298.16.camel@mulgrave>
References: <200412260504.40205.vapier@gentoo.org>
	<200412272301.03299.vapier@gentoo.org>
	<20041229034331.GS11543@parcelfarce.linux.theplanet.co.uk>
	<200412291419.36568.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412291419.36568.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2004-12-29 at 14:19 -0500, Mike Frysinger wrote:
>  target0:0:9: Write Buffer failure 8000002
>  target0:0:9: Domain Validation detected failure, dropping back

So now I'd like to see what this is ... it causes your nice ultra3 drive
only to work at async speeds (about 4MB/s).  Can you apply the patch and
send back the output?

Thanks,

James

===== drivers/scsi/scsi_transport_spi.c 1.21 vs edited =====
--- 1.21/drivers/scsi/scsi_transport_spi.c	2004-12-06 14:51:40 -06:00
+++ edited/drivers/scsi/scsi_transport_spi.c	2004-12-29 15:18:12 -06:00
@@ -33,6 +33,7 @@
 #include <scsi/scsi_request.h>
 #include <scsi/scsi_transport.h>
 #include <scsi/scsi_transport_spi.h>
+#include <scsi/scsi_dbg.h>
 
 #define SPI_PRINTK(x, l, f, a...)	dev_printk(l, &(x)->dev, f , ##a)
 
@@ -440,6 +441,7 @@
 		if(sreq->sr_result || !scsi_device_online(sdev)) {
 			scsi_device_set_state(sdev, SDEV_QUIESCE);
 			SPI_PRINTK(sdev->sdev_target, KERN_ERR, "Write Buffer failure %x\n", sreq->sr_result);
+			scsi_print_req_sense("DV", sreq);
 			return 0;
 		}
 
@@ -642,6 +644,7 @@
 		SPI_PRINTK(sdev->sdev_target, KERN_INFO, "Domain Validation skipping write tests\n");
 		return;
 	}
+	SPI_PRINTK(sdev->sdev_target, KERN_INFO, "Domain Validation write buffer length %d\n", len);
 	if (len > SPI_MAX_ECHO_BUFFER_SIZE) {
 		SPI_PRINTK(sdev->sdev_target, KERN_WARNING, "Echo buffer size %d is too big, trimming to %d\n", len, SPI_MAX_ECHO_BUFFER_SIZE);
 		len = SPI_MAX_ECHO_BUFFER_SIZE;


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
