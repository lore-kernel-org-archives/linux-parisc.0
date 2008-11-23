From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 23 Nov 2008 11:54:21 -0500 (EST)
Message-ID: <20081123165422.9AFCC4DF8@hiauly1.hia.nrc.ca>
References: <1227394911.4366.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, grundler@parisc-linux.org,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1227394911.4366.0.camel@localhost.localdomain> from "James Bottomley" at Nov 23, 2008 08:01:51 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Boots if I add initrd=1/initrd.img.  Have to say the error message isn't
> > very helpful.
> 
> Um, I think you're using a configuration where SCSI is modular?  So it
> finds the root disk if you have an initrd (by loading the modules) and
> it can't if you don't.

The loop fails in the first iteration because the mount fails with
ENXIO.  It's not clear whether this is intentional but the code doesn't
check for it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
