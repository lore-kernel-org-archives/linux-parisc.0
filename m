From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Build failure?
Date: Fri, 2 Oct 2009 13:04:12 -0400
Message-ID: <20091002170412.GT11961@bombadil.infradead.org>
References: <119aab440910011836o4b61e52j3294c3e16b80c00c@mail.gmail.com> <20091002014346.D73A14E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>, deller@gmx.de,
	kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091002014346.D73A14E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 01, 2009 at 09:43:46PM -0400, John David Anglin wrote:
> > drivers/char/agp/parisc-agp.c:220: error:
> > 'parisc_agp_page_mask_memory' undeclared here (not in a function)
> > make[3]: *** [drivers/char/agp/parisc-agp.o] Error 1
> > make[2]: *** [drivers/char/agp] Error 2
> > make[1]: *** [drivers/char] Error 2
> > make: *** [drivers] Error 2
> > 
> > I haven't looked into this yet.
> 
> I seem to recall there is a patch in Kyle's tree that may fix this.
> 

Yes, Helge submitted a fix, but it's not in my tree, since it should go
in via the agp tree. Hopefully Airlied will pick it up. You can just
turn off the driver though, since I think I'm the only person on earth
running linux on a box with a Quicksilver ASIC and also using
graphics...

r, Kyle
