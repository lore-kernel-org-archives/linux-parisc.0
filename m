From: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Date: 27 Sep 2003 10:45:50 -0500
Message-ID: <1064677551.2002.20.camel__38340.6258923516$1416622817$gmane$org@mulgrave>
References: <1064634188.641.27.camel@laptop.bradetich.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1064634188.641.27.camel@laptop.bradetich.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, 2003-09-26 at 22:43, Ryan Bradetich wrote:
> The zalon/ncr53c720 combination is fatal during booting on my K460
> parisc box.  I believe the scsi termination is correct since I performed
> a fresh debian install on the scsi disks and I can boot from then every
> time I use a 2.4 kernel :)  This problem appeared with with the latest
> cvs kernel from parisc-linux.org.
> 
> This system does boot and function when I do not compile zalon support
> into the kernel and use a nfsroot.
> 
> I can provide addtional information and test patches (or give access to
> this system) if requested.
> 
> Any thoughts or feedback appreciated!  

This should fix the panic, but it simply detaches correctly.

James

===== drivers/scsi/ncr53c8xx.c 1.37 vs edited =====
--- 1.37/drivers/scsi/ncr53c8xx.c	Thu Sep 25 20:08:49 2003
+++ edited/drivers/scsi/ncr53c8xx.c	Sat Sep 27 09:44:21 2003
@@ -8585,12 +8585,17 @@
 
 int ncr53c8xx_release(struct Scsi_Host *host)
 {
+	ncb_p np;
+	struct host_data *host_data;
+
 #ifdef DEBUG_NCR53C8XX
-printk("ncr53c8xx : release\n");
+	printk("ncr53c8xx : release\n");
 #endif
-     ncr_detach(((struct host_data *) host->hostdata)->ncb);
+	if((host_data = (struct host_data *)host->hostdata) &&
+	   host_data->ncb)
+		ncr_detach(host_data->ncb);
 
-     return 1;
+	return 1;
 }
 

===== drivers/scsi/zalon.c 1.11 vs edited =====
--- 1.11/drivers/scsi/zalon.c	Thu Sep 25 20:08:51 2003
+++ edited/drivers/scsi/zalon.c	Sat Sep 27 10:31:52 2003
@@ -146,7 +146,7 @@
 
 	host = ncr_attach(&zalon7xx_template, unit, &device);
 	if (!host)
-		goto fail;
+		goto out;
 
 	if (request_irq(irq, ncr53c8xx_intr, SA_SHIRQ, dev->dev.bus_id, host)) {
 		printk(KERN_ERR "%s: irq problem with %d, detaching\n ",
@@ -169,6 +169,7 @@
 	free_irq(irq, host);
  fail:
 	ncr53c8xx_release(host);
+ out:
 	return error;
 }
 
