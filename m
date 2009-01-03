From: Kyle McMartin <kyle@infradead.org>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 20:27:30 -0500
Message-ID: <20090103012730.GF5181@bombadil.infradead.org>
References: <20090103004454.GC5181@bombadil.infradead.org> <20090103012450.C6B5B4E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, gmsoft@tuxicoman.be,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090103012450.C6B5B4E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2009 at 08:24:50PM -0500, John David Anglin wrote:
> > Something like this? Sorry, I've almost completely forgotten gas syntax
> > and all that jazz...
> 
> Yes.  The gas syntax looks correct except you probably should add a
> .align 4.  I would use local labels (that's what's what is done for
> debug and exception info).  Just place the local labels adjacent to
> os_hpmc and os_hpmc_end.  This ensures the diff is absolute.
> 

Ahh, excellent. Thanks.

> > -ENTRY(os_hpmc_end)	/* this label used to compute os_hpmc checksum */
> > +ENTRY(os_hpmc_end)
> 
> Probably, you don't need to export os_hpmc_end.
> 

Indeed.

> > -	length = os_hpmc_end - os_hpmc;
> > +	length = os_hpmc_size * sizeof(u32);
> 
> I believe the size will be correct without multiplying by sizeof(u32).
> 

Ah, indeed. Good point.

cheers, Kyle
