From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 16:14:12 -0500 (EST)
Message-ID: <20090102211413.72A044EF0@hiauly1.hia.nrc.ca>
References: <20090102210115.GB17486@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gmsoft@tuxicoman.be, grundler@parisc-linux.org, kyle@infradead.org,
	linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102210115.GB17486@bombadil.infradead.org> from "Kyle McMartin" at Jan 2, 2009 04:01:15 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jan 02, 2009 at 09:46:44PM +0100, Guy Martin wrote:
> > OS HPMC handler length needs to be in bytes, not in words.
> > Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>
> > 
> > -	length = os_hpmc_end - os_hpmc;
> > +	length = (os_hpmc_end - os_hpmc) * sizeof(u32);
> >  	ivap[7] = length;
> 
> Ick. I wonder if I screwed that up when I fixed the function descriptor
> breakage...

The fix doesn't seem right.  Probably, os_hpmc and os_hpmc_end are
pointing to function descriptors.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
