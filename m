Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA22759
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Sep 1999 11:56:37 -0600
Date: Wed, 8 Sep 1999 11:57:31 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199909081757.LAA01435@fast.cs.utah.edu>
To: Matthew.Wilcox@genedata.com, reedstrm@wallace.ece.rice.edu
Subject: Re: THANK YOU for the Linuxdays (fwd)
Cc: frank.benke@student.uni-tuebingen.de, parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Wed, 8 Sep 1999 18:49:32 +0200
> From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
> To: "Ross J. Reedstrom" <reedstrm@wallace.ece.rice.edu>
> Subject: Re: THANK YOU for the Linuxdays (fwd)
> 
> On Wed, Sep 08, 1999 at 10:03:31AM -0500, Ross J. Reedstrom wrote:
> > Ob.PA-RISC: Sorry my first post here is off topic. Perhaps I can
> > salvage that.  I've just aquired what I believe to be a HP9000 730/66
> > a.k.a. 'King Cobra' workstation. I haven't much time to play with it
> > right now, but I _will_ be following this list, and trying to get your
> > work up and running on it. Hopefully, this isn't too different from other
> > 7XX machines. Anyone know of any 'gotcha's ? (Oh, and I have zero HP/UX
> > experience (all Irix and Linux background).
> 
> Maybe this will be OK.  It's PA-RISC 1.1a, a PA7000 processor like the
> 705/710/720/750 rather than the PA7100LC as the 712/715/etc machines have.
> We have docs on the 7100 and 7300 CPUs on the website, but no docs on
> the 7000.  I suspect that getting documentation on this CPU will be
> low-priority; even lower priority than the HIL keyboard driver :-)
> So it may work, but don't be surprised if it doesn't.
> 

Those original snakes have the ASP bus, which is quite similar to the LASI.
You can look at the Mach code for differences.  A couple of other differences
that might bite you: the snakes don't have HW TLB miss handling support,
the block TLBs have some funky restrictions, and they have the NCR53C700
SCSI controller which is a little quirky compared to the 53C710 in the later
machines.  But none of these are show-stoppers.
