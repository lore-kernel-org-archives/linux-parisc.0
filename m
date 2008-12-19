From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 13:43:52 -0500
Message-ID: <119aab440812191043l2b1ad771o75da7e85018c6eb8@mail.gmail.com>
References: <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca>
	 <20081219162843.GA8945@bombadil.infradead.org>
	 <119aab440812190835h7da2192biaa3cb3b44be08038@mail.gmail.com>
	 <119aab440812190836m2b81b974vbb270d5a5f531baa@mail.gmail.com>
	 <20081219164458.GB8945@bombadil.infradead.org>
	 <119aab440812190928n5c3d7956y4e168ae35dcae1b4@mail.gmail.com>
	 <20081219173310.GC8945@bombadil.infradead.org>
	 <119aab440812190936k1d18f174t6681075543d92efe@mail.gmail.com>
	 <20081219173931.GE8945@bombadil.infradead.org>
	 <20081219174233.GF8945@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081219174233.GF8945@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 19, 2008 at 12:42 PM, Kyle McMartin <kyle@infradead.org> wrote:
> Or rather not, my thinking being that context << 1 might end up being
> 33-bits, but I forgot we clip spaceids to the width of the protection
> registers, so this can't happen.

Yes, that is correct, we only use 17-bit space ids on PA 2.0 (18-bits
implemented) and 14-bit space ids on PA 1.1 (15-bits implemented on
average). I assume we reserve the last bit for the rightmost WD-bit.
Therefore context << 1 yields at most 18-bits.

c.
