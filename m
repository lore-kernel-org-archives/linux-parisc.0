From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 12:33:10 -0500
Message-ID: <20081219173310.GC8945@bombadil.infradead.org>
References: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com> <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca> <119aab440812190823g326868a8p4953cc4a92751a32@mail.gmail.com> <20081219162843.GA8945@bombadil.infradead.org> <119aab440812190835h7da2192biaa3cb3b44be08038@mail.gmail.com> <119aab440812190836m2b81b974vbb270d5a5f531baa@mail.gmail.com> <20081219164458.GB8945@bombadil.infradead.org> <119aab440812190928n5c3d7956y4e168ae35dcae1b4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812190928n5c3d7956y4e168ae35dcae1b4@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 19, 2008 at 12:28:40PM -0500, Carlos O'Donell wrote:
> On Fri, Dec 19, 2008 at 11:44 AM, Kyle McMartin <kyle@infradead.org> wrote:
> > SPACEID_SHIFT is the number of spaceid bits, which is 32 on 64-bit.
> 
> On 64-bit SPACEID_SHIFT is 11 bits. Verified by hand and by gcc -E/-dM
> and test program.
> 
> On 32-bit SPACEID_SHIFT is 0 bits. Verified by hand.
> 

I just assumed MAX_ADDRBITS was 64. Anyway the point is moot.
