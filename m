From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Thu, 30 Dec 2004 11:04:00 -0600
Message-ID: <1104426241.5268.30.camel@mulgrave>
References: <200412260504.40205.vapier@gentoo.org>
	<200412291649.29411.vapier@gentoo.org>
	<1104359873.5298.25.camel@mulgrave>
	<200412291816.19157.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412291816.19157.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2004-12-29 at 18:16 -0500, Mike Frysinger wrote:
> added verbose scsi debugging and the patch

OK, this definitely shows that the WD drive is lying about having a
writable echo buffer.

Could you reverse all the previous patches in scsi_transport_spi.c and
apply the attached.  I hope it will detect the write buffer problem and
fall back to doing DV configuration using the read only tests, so your
drive should configure at the maximum rate for the 875.

Thanks,

James

===== drivers/scsi/scsi_transport_spi.c 1.21 vs edited =====
--- 1.21/drivers/scsi/scsi_transport_spi.c	2004-12-06 14:51:40 -06:00
+++ edited/drivers/scsi/scsi_transport_spi.c	2004-12-30 10:07:02 -06:00
@@ -31,6 +31,7 @@
 #include <scsi/scsi_device.h>
 #include <scsi/scsi_host.h>
 #include <scsi/scsi_request.h>
+#include <scsi/scsi_eh.h>
 #include <scsi/scsi_transport.h>
 #include <scsi/scsi_transport_spi.h>
 
@@ -378,10 +379,16 @@
 #define DV_RETRIES	3	/* should only need at most 
 				 * two cc/ua clears */
 
+enum spi_compare_returns {
+	SPI_COMPARE_SUCCESS,
+	SPI_COMPARE_FAILURE,
+	SPI_COMPARE_SKIP_TEST,
+};
+
 
 /* This is for read/write Domain Validation:  If the device supports
  * an echo buffer, we do read/write tests to it */
-static int
+static enum spi_compare_returns
 spi_dv_device_echo_buffer(struct scsi_request *sreq, u8 *buffer,
 			  u8 *ptr, const int retries)
 {
@@ -438,9 +445,23 @@
 		scsi_wait_req(sreq, spi_write_buffer, buffer, len,
 			      DV_TIMEOUT, DV_RETRIES);
 		if(sreq->sr_result || !scsi_device_online(sdev)) {
+			struct scsi_sense_hdr sshdr;
+
 			scsi_device_set_state(sdev, SDEV_QUIESCE);
+			if (scsi_request_normalize_sense(sreq, &sshdr)
+			    && sshdr.sense_key == ILLEGAL_REQUEST
+			    /* INVALID FIELD IN CDB */
+			    && sshdr.asc == 0x24 && sshdr.ascq == 0x00)
+				/* This would mean that the drive lied
+				 * to us about supporting an echo
+				 * buffer (unfortunately some Western
+				 * Digital drives do precisely this)
+				 */
+				return SPI_COMPARE_SKIP_TEST;
+
+
 			SPI_PRINTK(sdev->sdev_target, KERN_ERR, "Write Buffer failure %x\n", sreq->sr_result);
-			return 0;
+			return SPI_COMPARE_FAILURE;
 		}
 
 		memset(ptr, 0, len);
@@ -453,12 +474,12 @@
 		if (memcmp(buffer, ptr, len) != 0)
 			return 0;
 	}
-	return 1;
+	return SPI_COMPARE_SUCCESS;
 }
 
 /* This is for the simplest form of Domain Validation: a read test
  * on the inquiry data from the device */
-static int
+static enum spi_compare_returns
 spi_dv_device_compare_inquiry(struct scsi_request *sreq, u8 *buffer,
 			      u8 *ptr, const int retries)
 {
@@ -493,24 +514,28 @@
 
 		if (memcmp(buffer, ptr, len) != 0)
 			/* failure */
-			return 0;
+			return SPI_COMPARE_FAILURE;
 	}
-	return 1;
+	return SPI_COMPARE_SUCCESS;
 }
 
-static int
+static enum spi_compare_returns
 spi_dv_retrain(struct scsi_request *sreq, u8 *buffer, u8 *ptr,
-	       int (*compare_fn)(struct scsi_request *, u8 *, u8 *, int))
+	       enum spi_compare_returns 
+	       (*compare_fn)(struct scsi_request *, u8 *, u8 *, int))
 {
 	struct spi_internal *i = to_spi_internal(sreq->sr_host->transportt);
 	struct scsi_device *sdev = sreq->sr_device;
 	int period = 0, prevperiod = 0; 
+	enum spi_compare_returns retval;
 
 
 	for (;;) {
 		int newperiod;
-		if (compare_fn(sreq, buffer, ptr, DV_LOOPS))
-			/* Successful DV */
+		retval = compare_fn(sreq, buffer, ptr, DV_LOOPS);
+
+		if (retval == SPI_COMPARE_SUCCESS
+		    || retval == SPI_COMPARE_SKIP_TEST)
 			break;
 
 		/* OK, retrain, fallback */
@@ -527,13 +552,13 @@
 			/* Total failure; set to async and return */
 			SPI_PRINTK(sdev->sdev_target, KERN_ERR, "Domain Validation Failure, dropping back to Asynchronous\n");
 			DV_SET(offset, 0);
-			return 0;
+			return SPI_COMPARE_FAILURE;
 		}
 		SPI_PRINTK(sdev->sdev_target, KERN_ERR, "Domain Validation detected failure, dropping back\n");
 		DV_SET(period, period);
 		prevperiod = period;
 	}
-	return 1;
+	return retval;
 }
 
 static int
@@ -599,7 +624,8 @@
 	DV_SET(offset, 0);
 	DV_SET(width, 0);
 	
-	if (!spi_dv_device_compare_inquiry(sreq, buffer, buffer, DV_LOOPS)) {
+	if (spi_dv_device_compare_inquiry(sreq, buffer, buffer, DV_LOOPS)
+	    != SPI_COMPARE_SUCCESS) {
 		SPI_PRINTK(sdev->sdev_target, KERN_ERR, "Domain Validation Initial Inquiry Failed\n");
 		/* FIXME: should probably offline the device here? */
 		return;
@@ -609,9 +635,10 @@
 	if (i->f->set_width && sdev->wdtr) {
 		i->f->set_width(sdev->sdev_target, 1);
 
-		if (!spi_dv_device_compare_inquiry(sreq, buffer,
+		if (spi_dv_device_compare_inquiry(sreq, buffer,
 						   buffer + len,
-						   DV_LOOPS)) {
+						   DV_LOOPS)
+		    != SPI_COMPARE_SUCCESS) {
 			SPI_PRINTK(sdev->sdev_target, KERN_ERR, "Wide Transfers Fail\n");
 			i->f->set_width(sdev->sdev_target, 0);
 		}
@@ -624,31 +651,39 @@
 	if(!sdev->ppr && !sdev->sdtr)
 		return;
 
-	/* now set up to the maximum */
-	DV_SET(offset, 255);
-	DV_SET(period, 1);
-	if (!spi_dv_retrain(sreq, buffer, buffer + len,
-			    spi_dv_device_compare_inquiry))
-		return;
-
-	/* OK, now we have our initial speed set by the read only inquiry
-	 * test, now try an echo buffer test (if the device allows it) */
+	/* see if the device has an echo buffer.  If it does we can
+	 * do the SPI pattern write tests */
 
 	len = 0;
 	if (sdev->ppr)
 		len = spi_dv_device_get_echo_buffer(sreq, buffer);
 
+ retry:
+
+	/* now set up to the maximum */
+	DV_SET(offset, 255);
+	DV_SET(period, 1);
+
 	if (len == 0) {
 		SPI_PRINTK(sdev->sdev_target, KERN_INFO, "Domain Validation skipping write tests\n");
+		spi_dv_retrain(sreq, buffer, buffer + len,
+			       spi_dv_device_compare_inquiry);
 		return;
 	}
+
 	if (len > SPI_MAX_ECHO_BUFFER_SIZE) {
 		SPI_PRINTK(sdev->sdev_target, KERN_WARNING, "Echo buffer size %d is too big, trimming to %d\n", len, SPI_MAX_ECHO_BUFFER_SIZE);
 		len = SPI_MAX_ECHO_BUFFER_SIZE;
 	}
 
-	spi_dv_retrain(sreq, buffer, buffer + len,
-		       spi_dv_device_echo_buffer);
+	if (spi_dv_retrain(sreq, buffer, buffer + len,
+			   spi_dv_device_echo_buffer)
+	    == SPI_COMPARE_SKIP_TEST) {
+		/* OK, the stupid drive can't do a write echo buffer
+		 * test after all, fall back to the read tests */
+		len = 0;
+		goto retry;
+	}
 }
 
 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
