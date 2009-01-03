From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] export length of os_hpmc vector
Date: Sat, 3 Jan 2009 11:31:42 -0500 (EST)
Message-ID: <20090103163142.F3FDF4EDA@hiauly1.hia.nrc.ca>
References: <20090103155642.GH5181@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@infradead.org, linux-parisc@vger.kernel.org,
	gmsoft@tuxicoman.be
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090103155642.GH5181@bombadil.infradead.org> from "Kyle McMartin" at Jan 3, 2009 10:56:42 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > change this to 
> > 	.word .os_hpmc_end-os_hpmc
> > and drop the local label ".os_hpmc"
> > 
> 
> In his previous mail JDA said to use local labels for safety...

The important thing is to ensure that the diff is an absolute value,
and that there's no relocation for the diff.

Diffs are tricky.  There may be a stub associated with os_hpmc.  I know
gdb sometimes gets confused between the stub and real entry point of
a function, and GCC always uses local labels in the exception and debug
tables.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
