From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] parisc: Improve dcache flush on PA8800/PA8900
Date: Tue, 15 Feb 2011 12:09:23 -0500 (EST)
Message-ID: <20110215170923.994FA4E42@hiauly1.hia.nrc.ca>
References: <1297789090.3015.31.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1297789090.3015.31.camel@mulgrave.site> from "James Bottomley" at Feb 15, 2011 10:58:10 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> There was a prink in the inequivalent alias detector that printed
> task->comm (that's the process name) if you add it back it will give
> more information.

Will add and rerun GCC testsuite.

> > >From a kernel perspective, we need to avoid multiple maps of the same
> > memory page with inequivalent virtual addresses (i.e., the maps must
> > start at the same address & 0x3fffff).
> 
> If I understand what you've done: you already patched the kernel to
> force MAP_FIXED onto this boundary.  If that's the case, the actual
> problem must be an offset mapping; meaning something maps a region and
> then maps a subregion of it.  I've got to guess this is the dynamic
> loader.

This only occurs for MAP_FIXED and MAP_SHARED.  MAP_FIXED alone
still maps at the address specified by the application.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
