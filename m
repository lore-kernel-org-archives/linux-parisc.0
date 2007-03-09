From: "James K. Love" <jlove@scires.com>
Subject: Re: [parisc-linux] [PATCH] sd: Adds flexible disk (TEAC FC-1,
	scsi-floppy) support to scsi disk driver
Date: Fri, 09 Mar 2007 10:51:01 -0500
Message-ID: <45F18265.3040809__9719.07934076644$1416624323$gmane$org@scires.com>
References: <45B67554.6010208@scires.com>
	<20070124162810.GA31075@colo.lackof.org>
	<45CB5C9D.1070601@scires.com>
	<20070208173808.GL13101@parisc-linux.org>
	<45EC9702.9080107@scires.com>
	<20070308065323.GB26641@colo.lackof.org>
	<45F0260A.7080306@scires.com>
	<20070308182601.GA18689@colo.lackof.org>
Reply-To: jlove@scires.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070308182601.GA18689@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 3/8/2007 1:26 PM, Grant Grundler wrote:
> welcome :)
> kudos for chasing this.

No Problem.  I can't think of anything more exciting than finally getting an
obscure, antiquated, low-capacity, franken-drive like the TEAC FC-1 working.
But seriously, I hope someone else finds this patch useful.

> It sounds good but it's totally not obvious this was the intent.
> If you are "hard coding" the geometry, then can't you just use #define?

Yes or consts, whichever is preferable.  The drive geometry is always initially
incorrect, so I must set it to the correct values.  These values should always
be the same for THIS drive... which leads me to...

> I expect there are other "device->removable && !TYPE_MOD" devices.

You would know this better than I, so I'll defer to you.  I was always a bit
uncomfortable making this assumption, which I documented in a comment in the
code.  When the scsi driver attaches to my devices, they are all of TYPE_DISK
and removable.  I was hoping someone else could test this out with a different
scsi-floppy drive, but there may not be any others.  Would it be a better idea
to use model and vendor information to exactly identify the drive as a TEAC FC-1?

Regards,
James Love

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
