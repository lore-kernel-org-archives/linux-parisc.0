From: Kyle McMartin <kyle@infradead.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 11:00:21 -0500
Message-ID: <20081208160021.GA30783@bombadil.infradead.org>
References: <20081208153413.GJ9092@bombadil.infradead.org> <20081208155754.DD5184E7A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, T-Bone@parisc-linux.org,
	deller@gmx.de, gmsoft@tuxicoman.be, carlos@systemhalted.org,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208155754.DD5184E7A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 08, 2008 at 10:57:54AM -0500, John David Anglin wrote:
> > sadly %p can't work, since void * doesn't hold resource_size_t with
> > CONFIG_RESOURCES_64BIT on 32-bit, since resource_size_t would be ULL,
> > which is why the %p handler would work (although you'd either have to
> > pass &(resource_size_t) or do a bit of ick around the va_args to snatch
> > the correct width instead of just void *).
> 
> Sigh, you are right.  However, all the warnings apply to addresses,
> so I think the type for these addresses is wrong.  I can't really
> imagine a 32-bit kernel running with a 64-bit address space would
> be useful.
> 

Exactly, the config option (in the 64-bit on 32-bit sense) is limited in
utility to PAE on x86, where the physical address space is really
36-bit, (and they cheat by using double-sized ptes to cram in a 64-bit
address.) Last time I tried to submit a patch to make it automatic in
Kconfig it was met with resounding bikeshedding.
