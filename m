From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] linux-2.6.10-pa1 panic on C360 in SCSI driver
Date: Wed, 29 Dec 2004 16:37:52 -0600
Message-ID: <1104359873.5298.25.camel@mulgrave>
References: <200412260504.40205.vapier@gentoo.org>
	<200412291419.36568.vapier@gentoo.org>
	<1104355710.5298.16.camel@mulgrave>
	<200412291649.29411.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412291649.29411.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2004-12-29 at 16:49 -0500, Mike Frysinger wrote:
> Current DV: sense = 70  5
> ASC=24 ASCQ= 0
> Raw sense data:0x70 0x00 0x05 0x00 0x00 0x00 0x00 0x18 0xff 0xff 0xff
> 0xff 0x24 0x00 0x00 0xc0 0x00 0x08 0x00 0xff 0xff 0xff 0xff 0xff 0x00
> 0x00 0x00 0x00 0x00 0x00 0x00 0x00 

This means invalid request, illegal field in cdb and identifies the 8th
field as the illegal one (that's the length of the write buffer
request).  So the thing told us that it supports a write buffer of
length 255 and then tells us our request is too long when we try to
write 255 bytes ... that seems about par for the course for this drive.

Could you try this patch, it halves the write buffer length.  That
should tell us if this drive actually has one and just lies about the
length, or lies about having one altogether.

James

===== drivers/scsi/scsi_transport_spi.c 1.21 vs edited =====
--- 1.21/drivers/scsi/scsi_transport_spi.c	2004-12-06 14:51:40 -06:00
+++ edited/drivers/scsi/scsi_transport_spi.c	2004-12-29 16:36:21 -06:00
@@ -637,6 +639,8 @@
 	len = 0;
 	if (sdev->ppr)
 		len = spi_dv_device_get_echo_buffer(sreq, buffer);
+
+	len = len/2;
 
 	if (len == 0) {
 		SPI_PRINTK(sdev->sdev_target, KERN_INFO, "Domain Validation skipping write tests\n");


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
