From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] sd: Adds flexible disk (TEAC FC-1,
	scsi-floppy) support to scsi disk driver
Date: Thu, 8 Mar 2007 11:26:01 -0700
Message-ID: <20070308182601.GA18689__39193.1021622897$1416624322$gmane$org@colo.lackof.org>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
	<45EC9702.9080107@scires.com>
	<20070308065323.GB26641@colo.lackof.org>
	<45F0260A.7080306@scires.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "James K. Love" <jlove@scires.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <45F0260A.7080306@scires.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 08, 2007 at 10:04:42AM -0500, James K. Love wrote:
> Thanks for the comments, Grant.

welcome :)
kudos for chasing this.

...
> >> +		/* store the drive's geometry info we just read */
> >> +		sf_heads = page5->number_of_heads;
> >> +		sf_sectors = page5->sectors_per_track;
> >> +		sf_cylinders = page5->number_of_cylinders_msb << 8
> >> +		               | page5->number_of_cylinders_lsb;
> > 
> > I'm kinda nervous about the use of static globals to "return" the
> > result of the previous code. In case some whacko decided to
> > have two scsi floppies with different media types, would this break?
> 
> I also agree.  In retrospect, I shouldn't have done this the way I did.  I
> mentioned this to Helge earlier, and I've already changed these to static
> consts in my source, since I'm basically hard-coding the FC-1's geometry
> and consts allow me to sanity check the mode select that sets the geometry.
> Does that sound logical?

It sounds good but it's totally not obvious this was the intent.
If you are "hard coding" the geometry, then can't you just use #define?

I think it's ok to only support one geometry.
Just add a check, something like this:
	if (sf_heads) {
		/* make sure successive floppies have same geometry */
		if (sf_heads != page5->number_of_heads) {
			printk(KERN_ERR "Sorry, only support one geometry"
					" for SCSI floppy.\n");
			return -ENOMEDIA;
		} 
	} else {
		sf_heads =....
	}

And maybe think about a better error message and how to handle it. YKWIM.

>   Technically, it wouldn't have broken the way it is written
> because the geometry should always be the same for these drives,
> but it wasn't the best implementation.

ok. That makes sense. but "these drives" are a specific model of drive
with a specific type of media installed.  I don't see checks for that here.
I expect there are other "device->removable && !TYPE_MOD" devices.

> I'll wait a bit longer to see if I get any more comments, then I'll post an
> updated patch that will include your suggestions.

Sounds good - many thanks!

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
