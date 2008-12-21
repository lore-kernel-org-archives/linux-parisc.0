From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 17:58:36 -0500 (EST)
Message-ID: <20081221225837.1D1404F19@hiauly1.hia.nrc.ca>
References: <494EC89A.9000802@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <494EC89A.9000802@gmx.de> from "Helge Deller" at Dec 21, 2008 11:52:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > -	mtsp(space, 3);
> > +	load_context(space);
> 
> I came to the similar conclusion and tried exactly this patch earlier
> today. It didn't fixed the problem (although I had the feeling that the
> bug didn't appeared as often then).

Ok, then maybe load_context needs to be atomic.  This is a bit tricky
because we may have to ensure that no tlb misses are triggered (relied
upon translation) during the update.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
