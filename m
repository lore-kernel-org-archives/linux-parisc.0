From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC bus timeout on C3600
Date: Fri, 2 Jan 2009 20:24:50 -0500 (EST)
Message-ID: <20090103012450.C6B5B4E99@hiauly1.hia.nrc.ca>
References: <20090103004454.GC5181@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, gmsoft@tuxicoman.be, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090103004454.GC5181@bombadil.infradead.org> from "Kyle McMartin" at Jan 2, 2009 07:44:54 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Something like this? Sorry, I've almost completely forgotten gas syntax
> and all that jazz...

Yes.  The gas syntax looks correct except you probably should add a
.align 4.  I would use local labels (that's what's what is done for
debug and exception info).  Just place the local labels adjacent to
os_hpmc and os_hpmc_end.  This ensures the diff is absolute.

> -ENTRY(os_hpmc_end)	/* this label used to compute os_hpmc checksum */
> +ENTRY(os_hpmc_end)

Probably, you don't need to export os_hpmc_end.

> -	length = os_hpmc_end - os_hpmc;
> +	length = os_hpmc_size * sizeof(u32);

I believe the size will be correct without multiplying by sizeof(u32).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
