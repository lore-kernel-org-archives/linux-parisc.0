From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 10:23:28 -0500 (EST)
Message-ID: <20081208152328.E8C514EDA@hiauly1.hia.nrc.ca>
References: <20081208051521.GI9092@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: T-Bone@parisc-linux.org, deller@gmx.de, gmsoft@tuxicoman.be,
	carlos@systemhalted.org, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208051521.GI9092@bombadil.infradead.org> from "Kyle McMartin" at Dec 8, 2008 00:15:21 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The prettiest way to do it would be to add a %p handler for
> resource_size_t args, cheat on the pointing bit, and clean up the
> in-tree users of %llx/ull-casts.

I went through the warnings that I saw yesterday implementing Helge's
%p suggestion.  It's not beautiful but it works.   I'll post tonight.

I only fixed the occurences that popped up in my build.  I'm sure that
more are lurking.

Feel free to implement %p handler.

I also fixed some other warnings and will post for comment when I separate
the diffs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
