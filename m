From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Mon, 27 Nov 2006 11:58:32 +0100
Message-ID: <20061127115832.b413fd7b.gmsoft@tuxicoman.be>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
	<20061112191436.GY16952@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061112191436.GY16952@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hi Matthew,

Some more detail on this issue.
This burner still works at commit 6391a11375de5e2bb1eb8481e54619761dc65d9f but breaks at commit 0f13fc09db68de92585558984bff1c51b87db72f.

There are one or two commits in between those two but the scsi driver doesn't work at all.

For reference, this is the log for those changes :

commit 0f13fc09db68de92585558984bff1c51b87db72f
Author: James Bottomley <James.Bottomley@steeleye.com>
Date:   Thu Jun 29 13:02:11 2006 -0400

    [SCSI] 53c700: fix breakage caused by the autosense update
    
    A bit of a brown paper bag issue.  The previous patch to remove the soon
    to be ripped out fields that were used in autosense actually broke the
    driver.  This patch fixes it and has been tested (honestly).
    
    Signed-off-by: James Bottomley <James.Bottomley@SteelEye.com>

commit 4311fa60b0d1cb5a2f62f646978294bca7b46cbb
Author: Dave Jones <davej@redhat.com>
Date:   Thu Jun 22 15:46:15 2006 -0400

    [SCSI] kmalloc argument switcheroo in recent 53c700 change.
    
    On Wed, Jun 21, 2006 at 07:00:34PM +0000, Linux Kernel wrote:
     > commit 67d59dfdeb21df2c16dcd478b66177e91178ecd0
     > tree ae85703651d81740f4a6cd398f9dd4d6aabe6a2f
     > parent 6db874fbdbedba5e15e76cc03b42f52ea70338c0
     > author James Bottomley <James.Bottomley@steeleye.com> Wed, 14 Jun 2006 07:31:19 -0500
     > committer James Bottomley <jejb@mulgrave.il.steeleye.com> Tue, 20 Jun 2006 05:34:01 -0500
     >
     > [SCSI] 53c700: remove reliance on deprecated cmnd fields
     >  ...
     >
     > +        SDp->hostdata = kmalloc(GFP_KERNEL, sizeof(struct NCR_700_sense));
     > +
     > +        if (!SDp->hostdata)
     > +                return -ENOMEM;
    
    "I'll take reversed arguments for $100 please Alex".
    
    Signed-off-by: Dave Jones <davej@redhat.com>
    Signed-off-by: James Bottomley <James.Bottomley@SteelEye.com>

commit 67d59dfdeb21df2c16dcd478b66177e91178ecd0
Author: James Bottomley <James.Bottomley@steeleye.com>
Date:   Tue Jun 13 21:31:19 2006 -0500

    [SCSI] 53c700: remove reliance on deprecated cmnd fields
    
    This one's quite tricky.  The 53c700 uses the now deprecated fields of
    the command structure for saving the prior command when it does
    autosense.  To fix this, we have to add extra fields to the LUN to
    accommodate a copy of the real command.
    
    Signed-off-by: James Bottomley <James.Bottomley@SteelEye.com>

commit 6391a11375de5e2bb1eb8481e54619761dc65d9f



Regards,
  Guy

On Sun, 12 Nov 2006 12:14:37 -0700
Matthew Wilcox <matthew@wil.cx> wrote:

> On Sun, Nov 12, 2006 at 04:03:50PM +0100, Guy Martin wrote:
> > This is how 2.4 detects it :
> > scsi3: (4:0) Synchronous at offset 8, period 100ns
> >   Vendor: PLEXTOR   Model: CD-R   PX-R820T   Rev: 1.08
> >   Type:   CD-ROM                             ANSI SCSI revision: 02
> > 
> > And this is how 2.6 detects it :
> > [42949430.090000]   Vendor: PLEXTOR   Model: CD-R   PX-R820T   Rev: 1.08
> > [42949430.150000]   Type:   CD-ROM                             ANSI SCSI revision: 02
> > [42949430.170000]  target2:0:4: Beginning Domain Validation
> > [42949430.180000]  target2:0:4: asynchronous
> > [42949430.190000]  target2:0:4: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
> > [42949430.200000]  target2:0:4: Domain Validation skipping write tests
> > [42949430.210000]  target2:0:4: Ending Domain Validation
> > 
> > 
> > The main difference seems that 2.4 detects and syncronous drive while 2.6 detects an async one.
> 
> Um, you're just confused by the debug output from the DV code.  First it
> negotiates async, then it negotiates FAST-10.
> 
> > Full 2.4 dmesg : https://www.tuxicoman.be/temp/dmesg-2.4-53c700
> > Full 2.6 dmesg : https://www.tuxicoman.be/temp/dmesg-2.6-53c700
> > 2.6 kernel config : https://www.tuxicoman.be/temp/k410-2.6.18.2-pa0.config
> > 
> > On my 2.6 kernel, when you try to mount it, you get the those error messages in loop.
> > 
> > Please have a look at it and let me know if you need any other info.
> 
> Presumably at some point in 2.6, this device worked fine.  Any chance
> you could bisect and figure out when it started failing?  I'd start with
> looking at something in the 2.6.8 sort of timeframe.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
