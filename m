From: "James K. Love" <jlove@scires.com>
Subject: Re: [parisc-linux] [PATCH] sd: Adds flexible disk (TEAC FC-1,
	scsi-floppy) support to scsi disk driver
Date: Thu, 08 Mar 2007 10:04:42 -0500
Message-ID: <45F0260A.7080306__7133.62426399744$1416624322$gmane$org@scires.com>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
	<45EC9702.9080107@scires.com>
	<20070308065323.GB26641@colo.lackof.org>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070308065323.GB26641@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thanks for the comments, Grant.

On 3/8/2007 1:53 AM, Grant Grundler wrote:
> ...
>> @@ -1535,6 +1626,11 @@ static int sd_revalidate_disk(struct gen
>>  	struct scsi_device *sdp = sdkp->device;
>>  	unsigned char *buffer;
>>  	unsigned ordered;
>> +	char mode_buf[0xFF];
>> +	scsi_mode_sense_page5_t* page5 = NULL;
>> +	struct scsi_mode_data data;
>> +	int length = 0;
>> +	int res = 0;
> 
> Could these new local vars be moved into the code block inside
> the "if ()" statement where they are used?

Yes.  Helge emailed me off-list pointing this out too.

>> @@ -1563,6 +1659,66 @@ static int sd_revalidate_disk(struct gen
>>  	sd_spinup_disk(sdkp, disk->disk_name);
>>
>>  	/*
>> +	 * Assuming here that this check will suffice for ID'ing a scsi floppy.
>> +	 * Note that sd_spinup_disk sets media_present above.
>> +	 */
>> +	if (sdp->removable && (sdp->type != TYPE_MOD)
>> +	                   && sdkp->media_present) {
>> +		memset(&data, 0, sizeof(data));
>> +		memset(&mode_buf, 0, sizeof(mode_buf));
> ...
> 
> This code chunk is long enough that it should be it's own subroutine.
> Would that be difficult?

Not at all.  I didn't do too much beautification before I sent this, and I agree
it should be.

> ...
>> +		/* store the drive's geometry info we just read */
>> +		sf_heads = page5->number_of_heads;
>> +		sf_sectors = page5->sectors_per_track;
>> +		sf_cylinders = page5->number_of_cylinders_msb << 8
>> +		               | page5->number_of_cylinders_lsb;
> 
> I'm kinda nervous about the use of static globals to "return" the
> result of the previous code. In case some whacko decided to
> have two scsi floppies with different media types, would this break?

I also agree.  In retrospect, I shouldn't have done this the way I did.  I
mentioned this to Helge earlier, and I've already changed these to static consts
in my source, since I'm basically hard-coding the FC-1's geometry and consts
allow me to sanity check the mode select that sets the geometry.  Does that
sound logical?  Technically, it wouldn't have broken the way it is written
because the geometry should always be the same for these drives, but it wasn't
the best implementation.

I'll wait a bit longer to see if I get any more comments, then I'll post an
updated patch that will include your suggestions.

Regards,
James

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
