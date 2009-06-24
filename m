From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Wed, 24 Jun 2009 09:47:23 -0400 (EDT)
Message-ID: <20090624134724.3874F4FC5@hiauly1.hia.nrc.ca>
References: <20090624053146.GA29485@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, grundler@parisc-linux.org,
	James.Bottomley@hansenpartnership.com, kyle@mcmartin.ca,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090624053146.GA29485@lackof.org> from "Grant Grundler" at Jun 23, 2009 11:31:46 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, Jun 23, 2009 at 07:39:37AM -0400, Carlos O'Donell wrote:
> > On Tue, Jun 23, 2009 at 2:31 AM, Grant
> ...
> > > allows me to build. Is no one else building with NFSROOT enabled?
> > 
> > I boot directly from disk on both my test machines (a500, c3k).
> 
> Me too in general...but I still have that enabled since the
> Cupertino test ring have multiple machines and it's quite easy
> to test with NFS root.

I'm using this for embedded development (no hard drive).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
