From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 16:18:44 -0500
Message-ID: <20090102211844.GC17486@bombadil.infradead.org>
References: <20090102210115.GB17486@bombadil.infradead.org> <20090102211413.72A044EF0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, gmsoft@tuxicoman.be,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102211413.72A044EF0@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2009 at 04:14:12PM -0500, John David Anglin wrote:
> > On Fri, Jan 02, 2009 at 09:46:44PM +0100, Guy Martin wrote:
> > > OS HPMC handler length needs to be in bytes, not in words.
> > > Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>
> > > 
> > > -	length = os_hpmc_end - os_hpmc;
> > > +	length = (os_hpmc_end - os_hpmc) * sizeof(u32);
> > >  	ivap[7] = length;
> > 
> > Ick. I wonder if I screwed that up when I fixed the function descriptor
> > breakage...
> 
> The fix doesn't seem right.  Probably, os_hpmc and os_hpmc_end are
> pointing to function descriptors.
> 

I think we've been over this before ;-)

commit c3d4ed4e3e5aa8d9e6b4b795f004a7028ce780e9
Author: Kyle McMartin <kyle@parisc-linux.org>
Date:   Mon Jun 4 02:26:52 2007 -0400

    [PARISC] Fix kernel panic in check_ivt
    
    check_ivt had some seriously broken code wrt function pointers on
    parisc64. Instead of referencing the hpmc code via a function
pointer,
    export symbols and reference it as a const array.
    
    Thanks to jda for pointing out the broken 64-bit func ptr handling.
    
    Signed-off-by: Kyle McMartin <kyle@parisc-linux.org>


cheers, Kyle
