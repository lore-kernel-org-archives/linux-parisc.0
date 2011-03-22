From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PARISC] fix pacache .size with new binutils
Date: Mon, 21 Mar 2011 21:21:05 -0400 (EDT)
Message-ID: <20110322012106.273DD4FC9@hiauly1.hia.nrc.ca>
References: <1300739513.10634.39.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: mroos@linux.ee, linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1300739513.10634.39.camel@mulgrave.site> from "James Bottomley" at Mar 21, 2011 03:31:53 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This won't apply because of upstream changes to the file
> (flush_alias_page got removed) ... does the problem even still exist
> upstream?

The problem still exists on various longterm branches and I guess
the 2.6.38 stable branch.  Is it worth fixing these?

I have to say that 2.6.38 without the tmpalias patch is seriously
broken on PA8800.  I tried two GCC builds and they both died with
segvs very early in the build.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
