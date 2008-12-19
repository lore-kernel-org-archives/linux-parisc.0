From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 12:28:40 -0500
Message-ID: <119aab440812190928n5c3d7956y4e168ae35dcae1b4@mail.gmail.com>
References: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com>
	 <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca>
	 <119aab440812190823g326868a8p4953cc4a92751a32@mail.gmail.com>
	 <20081219162843.GA8945@bombadil.infradead.org>
	 <119aab440812190835h7da2192biaa3cb3b44be08038@mail.gmail.com>
	 <119aab440812190836m2b81b974vbb270d5a5f531baa@mail.gmail.com>
	 <20081219164458.GB8945@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "Kyle McMartin" <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081219164458.GB8945@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 19, 2008 at 11:44 AM, Kyle McMartin <kyle@infradead.org> wrote:
> SPACEID_SHIFT is the number of spaceid bits, which is 32 on 64-bit.

On 64-bit SPACEID_SHIFT is 11 bits. Verified by hand and by gcc -E/-dM
and test program.

On 32-bit SPACEID_SHIFT is 0 bits. Verified by hand.

> I suspect what this is trying to do, is put it in the rightmost half of
> the register, so as long as context is shifted left already, (which it
> is.)
>
> When you cancel out the SPACEID_SHIFT in alloc_sid, and here in
> load_context, you end up with the same mtctl(context << 1, 8) as on
> 32-bit.

Yes, and that keeps the WD bit clear.

Cheers,
Carlos.
