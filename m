From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: kernel BUG in drivers/scsi/53c700.c:1129
Date: Fri, 10 Jun 2016 14:43:52 -0700
Message-ID: <1465595032.2224.59.camel@HansenPartnership.com>
References: <5759C524.2030009@gmx.de>
	 <1465511002.2259.19.camel@HansenPartnership.com>  <575B2239.4020403@gmx.de>
	 <1465592285.20724.173.camel@localhost.localdomain>
	 <1465592473.2224.52.camel@HansenPartnership.com>
	 <1465594421.2224.58.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	linux-scsi <linux-scsi@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>
To: emilne@redhat.com, Helge Deller <deller@gmx.de>
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <1465594421.2224.58.camel@HansenPartnership.com>
List-ID: <linux-scsi.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2016-06-10 at 14:33 -0700, James Bottomley wrote:
> On Fri, 2016-06-10 at 14:01 -0700, James Bottomley wrote:
> > On Fri, 2016-06-10 at 16:58 -0400, Ewan D. Milne wrote:
> > > I'm not sure if this is the problem, but the tagging changes to
> > > scsi_tcq.h may have altered the 53c700 driver's assumptions.
> > > In one case it sets sdev->current_cmnd and then some of the
> > > tagging calls would return it if the tag was SCSI_NO_TAG.
> > > 
> > > NCR_700_queuecommand_lck() does:
> > > 
> > >         if ((hostdata->tag_negotiated & (1<<scmd_id(SCp))) &&
> > >             SCp->device->simple_tags) {
> > >                 slot->tag = SCp->request->tag;
> > >                 CDEBUG(KERN_DEBUG, SCp, "sending out tag %d, slot
> > > %p\n",
> > >                        slot->tag, slot);
> > >         } else {
> > >                 slot->tag = SCSI_NO_TAG;
> > >                 /* must populate current_cmnd for
> > > scsi_host_find_tag
> > > to
> > > work */
> > >                 SCp->device->current_cmnd = SCp;
> > >         }
> > 
> > Thanks ... I was just about to look for something this.  I'd got to
> > interpreting the script as reselected with tag information present 
> > and then trying to look the command up with no tag present, hence
> > the
> > BUG().
> 
> Yes, you're right, it's
> 
> commit 64d513ac31bd02a3c9b69ef04444f36c196f9a9d
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Oct 8 09:28:04 2015 +0100
> 
>     scsi: use host wide tags by default
> 
> Again.  This time because it's transformation of the handling of
> SCSI_NO_TAG is wrong.  You can't replace the return sdev
> ->current_cmnd
> original in scsi_find_tag with the NULL return in scsi_find_host_tag.
> 
> I think this changesets wins the prize for the greatest number of
> generated faults.
> 
> Does this fix 53c700.c?
> 
> I suppose we'd better look for other places where no tag fell through
> ...

OK, I checked: snic and fnic use SCSI_NO_TAG but they don't save
anything in current_cmnd, so they can't rely on the original behaviour.
 I think we'll be safe with a local change in 53c700.c

James


