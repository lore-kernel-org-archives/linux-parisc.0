Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA31236
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 10:18:50 -0600
Date: Wed, 30 Aug 2000 12:18:43 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Paul Bame <bame@noam.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot.
In-Reply-To: <20000830170126.E3463@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.SOL.4.21.0008301217240.26058-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 30 Aug 2000, Matthew Wilcox wrote:

> On Wed, Aug 30, 2000 at 09:58:21AM -0600, Paul Bame wrote:
> > Not enough information to help -- no specific error messages, no
> > specific commands you typed with numbers (LAN IDs or SCSI addresses)
> > in them.  Please send the output of:
> > 
> >     sea scsi
> >     path
> > 
> > And the error when you do 'boot pri isl' and it fails.
> 
> i'm wondering if the problem is that the scsi cdrom he has won't support
> 512-byte sector mode, only 2048-byte sectors.  iirc, HPs won't boot off
> all CD-ROM rives for this reason.

hmm... I should find out.  I do not have the manual to confirm, but
I probably should be able to get a spec from the web.
Thanks for the hint.


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
