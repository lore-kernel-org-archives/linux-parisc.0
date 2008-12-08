From: Kyle McMartin <kyle@infradead.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 10:34:13 -0500
Message-ID: <20081208153413.GJ9092@bombadil.infradead.org>
References: <20081208051521.GI9092@bombadil.infradead.org> <20081208152328.E8C514EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, T-Bone@parisc-linux.org,
	deller@gmx.de, gmsoft@tuxicoman.be, carlos@systemhalted.org,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208152328.E8C514EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 08, 2008 at 10:23:28AM -0500, John David Anglin wrote:
> > The prettiest way to do it would be to add a %p handler for
> > resource_size_t args, cheat on the pointing bit, and clean up the
> > in-tree users of %llx/ull-casts.
> 
> I went through the warnings that I saw yesterday implementing Helge's
> %p suggestion.  It's not beautiful but it works.   I'll post tonight.
> 
> I only fixed the occurences that popped up in my build.  I'm sure that
> more are lurking.
> 
> Feel free to implement %p handler.
> 
> I also fixed some other warnings and will post for comment when I separate
> the diffs.
> 

sadly %p can't work, since void * doesn't hold resource_size_t with
CONFIG_RESOURCES_64BIT on 32-bit, since resource_size_t would be ULL,
which is why the %p handler would work (although you'd either have to
pass &(resource_size_t) or do a bit of ick around the va_args to snatch
the correct width instead of just void *).

but yeah, that's a global kernel issue, not limited to our little niche.

i'll apply your patch, and another one to make CONFIG_RESOURCES_64BIT
depend on !PARISC, since it really only applies to PAE on x86 and some
niche crap embeddeded powerpc.

cheers, kyle
