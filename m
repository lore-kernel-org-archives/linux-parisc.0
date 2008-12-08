From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 10:57:54 -0500 (EST)
Message-ID: <20081208155754.DD5184E7A@hiauly1.hia.nrc.ca>
References: <20081208153413.GJ9092@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, T-Bone@parisc-linux.org, deller@gmx.de,
	gmsoft@tuxicoman.be, carlos@systemhalted.org,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208153413.GJ9092@bombadil.infradead.org> from "Kyle McMartin" at Dec 8, 2008 10:34:13 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> sadly %p can't work, since void * doesn't hold resource_size_t with
> CONFIG_RESOURCES_64BIT on 32-bit, since resource_size_t would be ULL,
> which is why the %p handler would work (although you'd either have to
> pass &(resource_size_t) or do a bit of ick around the va_args to snatch
> the correct width instead of just void *).

Sigh, you are right.  However, all the warnings apply to addresses,
so I think the type for these addresses is wrong.  I can't really
imagine a 32-bit kernel running with a 64-bit address space would
be useful.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
