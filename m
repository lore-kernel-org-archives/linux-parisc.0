From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Build failure?
Date: Thu, 1 Oct 2009 21:43:46 -0400 (EDT)
Message-ID: <20091002014346.D73A14E38@hiauly1.hia.nrc.ca>
References: <119aab440910011836o4b61e52j3294c3e16b80c00c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440910011836o4b61e52j3294c3e16b80c00c@mail.gmail.com> from "Carlos O'Donell" at Oct 1, 2009 09:36:30 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> drivers/char/agp/parisc-agp.c:220: error:
> 'parisc_agp_page_mask_memory' undeclared here (not in a function)
> make[3]: *** [drivers/char/agp/parisc-agp.o] Error 1
> make[2]: *** [drivers/char/agp] Error 2
> make[1]: *** [drivers/char] Error 2
> make: *** [drivers] Error 2
> 
> I haven't looked into this yet.

I seem to recall there is a patch in Kyle's tree that may fix this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
