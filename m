From: "James K. Love" <jlove@scires.com>
Subject: [parisc-linux] [PATCH] sd: Adds flexible disk (TEAC FC-1,
 scsi-floppy) support to scsi disk driver
Date: Mon, 05 Mar 2007 17:17:38 -0500
Message-ID: <45EC9702.9080107__5039.50958741388$1416624321$gmane$org@scires.com>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070208173808.GL13101@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

All:

I've just merged my flexible disk changes (see thread link below) into the
latest scsi disk driver source.  These changes add scsi-floppy disk support
(particularly HP's revs of the TEAC FC-1 drive) to the scsi disk driver.  Per
Matthew's suggestion, I'm cowardly posting here first to get some feedback,
rather than posting straight to linux-scsi.  BTW, I will also provide a patch
for Debian Sarge, if anyone out there is interested in that too.  My patch
submittal email is appended below.

James

http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031188.html

---

This patch adds flexible disk support for the TEAC FC-1 scsi-floppy drive to the
scsi disk driver (sd.c).  OEM versions (FD-235HS715, etc.) of the FC-1 are
prevalent in older HP parisc workstations.  This patch may also allow similar
scsi-floppy drives to work on other platforms, but I have not tested this on
anything other than HP OEM TEAC FC-1 drives.

Signed-off-by: James K. Love <jlove@scires.com>

---

This patch is essentially a port of the MACH scsi driver's flexible disk bits to
the latest 2.6 linux kernel, which provides rudimentary scsi-floppy support for
drives in older HP parisc workstations.  The changes have been tested with the
TEAC FC-1 on several older HP parisc boxes (models 715 & 755).  Some userspace
floppy apps may also need to be made scsi-floppy aware.  For instance, fdformat
is broken.  I'm using udev to create a sym-link between the scsi device and fd0.
 With the link in place, the mtools functions work well and mformat can be used
to msdos format scsi floppies.  This diff was created against the latest in the
parisc-2.6 git tree (2.6.20) and was also tested against Linus' latest linux-2.6
git tree (2.6.21-rc2).

---

--- ./drivers/scsi/sd.orig	2007-02-25 22:46:56.000000000 -0500
+++ ./drivers/scsi/sd.c	2007-03-04 21:26:00.000000000 -0500
@@ -49,6 +49,7 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <asm/uaccess.h>
+#include <asm/byteorder.h>

 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -275,6 +276,79 @@ static struct scsi_driver sd_template =
 	.issue_flush		= sd_issue_flush,
 };

+/* store the scsi-floppy geometry info */
+static unsigned int sf_heads=0, sf_sectors=0, sf_cylinders=0;
+
+/*
+ * This struct was taken directly from the MACH micro-kernel scsi
+ * driver source with only minor modification.
+ * Page 5 - flexible disk drive geometry page structure.
+ */
+typedef struct {
+#ifdef __BIG_ENDIAN_BITFIELD
+	unsigned char   ps        : 1;
+	unsigned char   reserved1 : 1;
+	unsigned char   page_code : 6;
+#else
+	unsigned char   page_code : 6;
+	unsigned char   reserved1 : 1;
+	unsigned char   ps        : 1;
+#endif
+	unsigned char   page_length;
+	unsigned char   transfer_rate_msb;
+	unsigned char   transfer_rate_lsb;
+	unsigned char   number_of_heads;
+	unsigned char   sectors_per_track;
+	unsigned char   bytes_per_sector_msb;
+	unsigned char   bytes_per_sector_lsb;
+	unsigned char   number_of_cylinders_msb;
+	unsigned char   number_of_cylinders_lsb;
+	unsigned char   starting_cyl_wpc_msb;
+	unsigned char   starting_cyl_wpc_lsb;
+	unsigned char   starting_cyl_rwc_msb;
+	unsigned char   starting_cyl_rwc_lsb;
+	unsigned char   drive_step_rate_msb;
+	unsigned char   drive_step_rate_lsb;
+	unsigned char   drive_step_pule_width;
+	unsigned char   head_settle_delay_msb;
+	unsigned char   head_settle_delay_lsb;
+	unsigned char   motor_on_delay;
+	unsigned char   motor_off_delay;
+#ifdef __BIG_ENDIAN_BITFIELD
+	unsigned char   true_rdy            : 1;
+	unsigned char   start_sector_number : 1;
+	unsigned char   motor_on            : 1;
+	unsigned char   reserved2           : 5;
+	unsigned char   reserved3           : 4;
+	unsigned char   step_pulse_per_cyl  : 4;
+#else
+	unsigned char   reserved2           : 5;
+	unsigned char   motor_on            : 1;
+	unsigned char   start_sector_number : 1;
+	unsigned char   true_rdy            : 1;
+	unsigned char   step_pulse_per_cyl  : 4;
+	unsigned char   reserved3           : 4;
+#endif
+	unsigned char   write_precomp_value;
+	unsigned char   head_load_delay;
+	unsigned char   head_unload_delay;
+#ifdef __BIG_ENDIAN_BITFIELD
+	unsigned char   pin_34              : 4;
+	unsigned char   pin_2               : 4;
+	unsigned char   pin_4               : 4;
+	unsigned char   pin_1               : 4;
+#else
+	unsigned char   pin_2               : 4;
+	unsigned char   pin_34              : 4;
+	unsigned char   pin_1               : 4;
+	unsigned char   pin_4               : 4;
+#endif
+	unsigned char   reserved4;
+	unsigned char   reserved5;
+	unsigned char   reserved6;
+	unsigned char   reserved7;
+} scsi_mode_sense_page5_t  __attribute__ ((packed));
+
 /*
  * Device no to disk mapping:
  *
@@ -642,6 +716,14 @@ static int sd_getgeo(struct block_device
 	struct Scsi_Host *host = sdp->host;
 	int diskinfo[4];

+	/* If this is a scsi floppy */
+	if (sdp->removable && (sdp->type != TYPE_MOD)) {
+		geo->heads = sf_heads;
+		geo->sectors = sf_sectors;
+		geo->cylinders = sf_cylinders;
+		return 0;
+	}
+
 	/* default to most commonly used values */
         diskinfo[0] = 0x40;	/* 1 << 6 */
        	diskinfo[1] = 0x20;	/* 1 << 5 */
@@ -1011,12 +1093,21 @@ static int media_not_present(struct scsi

 	if (!scsi_sense_valid(sshdr))
 		return 0;
-	/* not invoked for commands that could return deferred errors */
-	if (sshdr->sense_key != NOT_READY &&
-	    sshdr->sense_key != UNIT_ATTENTION)
-		return 0;
-	if (sshdr->asc != 0x3A) /* medium not present */
-		return 0;
+
+	/* If this is a scsi floppy */
+	if (sdkp->device->removable && (sdkp->device->type != TYPE_MOD)) {
+		if ((sshdr->sense_key != NOT_READY)
+		    && (sshdr->asc != 0x4)) {	/* no scsi-floppy media */
+			return 0;
+		}
+	} else {
+		/* not invoked for commands that could return deferred errors */
+		if (sshdr->sense_key != NOT_READY &&
+		    sshdr->sense_key != UNIT_ATTENTION)
+			return 0;
+		if (sshdr->asc != 0x3A) /* medium not present */
+			return 0;
+	}

 	set_media_not_present(sdkp);
 	return 1;
@@ -1535,6 +1626,11 @@ static int sd_revalidate_disk(struct gen
 	struct scsi_device *sdp = sdkp->device;
 	unsigned char *buffer;
 	unsigned ordered;
+	char mode_buf[0xFF];
+	scsi_mode_sense_page5_t* page5 = NULL;
+	struct scsi_mode_data data;
+	int length = 0;
+	int res = 0;

 	SCSI_LOG_HLQUEUE(3, printk("sd_revalidate_disk: disk=%s\n", disk->disk_name));

@@ -1563,6 +1659,66 @@ static int sd_revalidate_disk(struct gen
 	sd_spinup_disk(sdkp, disk->disk_name);

 	/*
+	 * Assuming here that this check will suffice for ID'ing a scsi floppy.
+	 * Note that sd_spinup_disk sets media_present above.
+	 */
+	if (sdp->removable && (sdp->type != TYPE_MOD)
+	                   && sdkp->media_present) {
+		memset(&data, 0, sizeof(data));
+		memset(&mode_buf, 0, sizeof(mode_buf));
+
+		/* request the page 5 'flexible' sense data */
+		res = sd_do_mode_sense(sdp, 0, 5, mode_buf, 0xFF, &data, NULL);
+
+		if (!scsi_status_is_good(res)) {
+			printk(KERN_WARNING "(sd_revalidate_disk:) Flexible disk mode"
+			       " sense failure.\n");
+			goto out;
+		}
+
+		length = data.length - data.header_length - data.block_descriptor_length;
+		page5 = (scsi_mode_sense_page5_t *)(mode_buf + data.header_length
+		                                             + data.block_descriptor_length);
+
+		/* set sector size to 512 bytes, double-density media */
+		data.medium_type = 2;
+		data.device_specific &= ~0x90;
+		data.block_descriptor_length = 0;
+
+		page5->ps = 0;
+		page5->page_code &= ~0x80;
+		page5->sectors_per_track = page5->sectors_per_track *
+		                           (page5->bytes_per_sector_msb << 8 |
+		                           page5->bytes_per_sector_lsb) / 512;
+
+		page5->bytes_per_sector_msb = 2;
+		page5->bytes_per_sector_lsb = 0;
+
+		/* mode select to set geometry */
+                if (scsi_mode_select(sdp, 1, 0, 5, (char *)page5, length,
+		                     SD_TIMEOUT, SD_MAX_RETRIES, &data, NULL)) {
+			printk(KERN_WARNING "(sd_revalidate_disk:) Flexible disk mode"
+			       " select failure.\n");
+			goto out;
+		}
+
+		/* read newly selected Page 5 sense data */
+		res = sd_do_mode_sense(sdp, 0, 5, mode_buf, 0xFF, &data, NULL);
+
+		if (!scsi_status_is_good(res)) {
+			printk(KERN_WARNING "(sd_revalidate_disk:) Flexible disk mode"
+			       " sense failure.\n");
+			goto out;
+		}
+
+		/* store the drive's geometry info we just read */
+		sf_heads = page5->number_of_heads;
+		sf_sectors = page5->sectors_per_track;
+		sf_cylinders = page5->number_of_cylinders_msb << 8
+		               | page5->number_of_cylinders_lsb;
+	}
+
+	/*
 	 * Without media there is no reason to ask; moreover, some devices
 	 * react badly if we do.
 	 */


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
