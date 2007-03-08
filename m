From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] sd: Adds flexible disk (TEAC FC-1,
	scsi-floppy) support to scsi disk driver
Date: Wed, 7 Mar 2007 23:53:23 -0700
Message-ID: <20070308065323.GB26641__27247.4781064831$1416624323$gmane$org@colo.lackof.org>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
	<45EC9702.9080107@scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "James K. Love" <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45EC9702.9080107@scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 05, 2007 at 05:17:38PM -0500, James K. Love wrote:
> All:
> 
> I've just merged my flexible disk changes (see thread link below) into the
> latest scsi disk driver source.  These changes add scsi-floppy disk support
> (particularly HP's revs of the TEAC FC-1 drive) to the scsi disk driver.  Per
> Matthew's suggestion, I'm cowardly posting here first to get some feedback,
> rather than posting straight to linux-scsi.

That's fine. In general, very nice work!
I only have some some coding style issues and one question.

> --- ./drivers/scsi/sd.orig	2007-02-25 22:46:56.000000000 -0500
> +++ ./drivers/scsi/sd.c	2007-03-04 21:26:00.000000000 -0500
...
> +#ifdef __BIG_ENDIAN_BITFIELD
> +	unsigned char   true_rdy            : 1;
> +	unsigned char   start_sector_number : 1;
> +	unsigned char   motor_on            : 1;
> +	unsigned char   reserved2           : 5;
> +	unsigned char   reserved3           : 4;
> +	unsigned char   step_pulse_per_cyl  : 4;
> +#else
> +	unsigned char   reserved2           : 5;
> +	unsigned char   motor_on            : 1;
> +	unsigned char   start_sector_number : 1;
> +	unsigned char   true_rdy            : 1;
> +	unsigned char   step_pulse_per_cyl  : 4;
> +	unsigned char   reserved3           : 4;
> +#endif

I prefer bit masks over bit fields for two reasons:
1) don't have the endian mess
2) assignment to bit fields are NOT atomic - they are read/modify/write ops.
   Use of bit fields hides this behavior.

But if you prefer them, I don't think their use is prohibited in general.

...
> @@ -1535,6 +1626,11 @@ static int sd_revalidate_disk(struct gen
>  	struct scsi_device *sdp = sdkp->device;
>  	unsigned char *buffer;
>  	unsigned ordered;
> +	char mode_buf[0xFF];
> +	scsi_mode_sense_page5_t* page5 = NULL;
> +	struct scsi_mode_data data;
> +	int length = 0;
> +	int res = 0;

Could these new local vars be moved into the code block inside
the "if ()" statement where they are used?

Just makes it easier to understand variable usage when reviewing
the code in the future.

>  	SCSI_LOG_HLQUEUE(3, printk("sd_revalidate_disk: disk=%s\n", disk->disk_name));
> 
> @@ -1563,6 +1659,66 @@ static int sd_revalidate_disk(struct gen
>  	sd_spinup_disk(sdkp, disk->disk_name);
> 
>  	/*
> +	 * Assuming here that this check will suffice for ID'ing a scsi floppy.
> +	 * Note that sd_spinup_disk sets media_present above.
> +	 */
> +	if (sdp->removable && (sdp->type != TYPE_MOD)
> +	                   && sdkp->media_present) {
> +		memset(&data, 0, sizeof(data));
> +		memset(&mode_buf, 0, sizeof(mode_buf));
...

This code chunk is long enough that it should be it's own subroutine.
Would that be difficult?

...
> +		/* store the drive's geometry info we just read */
> +		sf_heads = page5->number_of_heads;
> +		sf_sectors = page5->sectors_per_track;
> +		sf_cylinders = page5->number_of_cylinders_msb << 8
> +		               | page5->number_of_cylinders_lsb;

I'm kinda nervous about the use of static globals to "return" the
result of the previous code. In case some whacko decided to
have two scsi floppies with different media types, would this break?

Can't we directly park this info into the per disk data struct?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
