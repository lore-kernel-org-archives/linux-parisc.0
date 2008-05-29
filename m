From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [bug] gcc-4.[23] miscompiling causing networking to bugger up
Date: Wed, 28 May 2008 20:00:58 -0400 (EDT)
Message-ID: <20080529000059.9C6434E77@hiauly1.hia.nrc.ca>
References: <20080528234110.GD30501@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080528234110.GD30501@phobos.i.cabal.ca> from "Kyle McMartin" at May 28, 2008 07:41:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Ah well, anyway, it works built at -O0, and buggers up at -O1.
> 
> Want a copy of each of the .S?

I think it would be useful to know if this is still present in 4.3 branch
head.  Unless we know which routine the problem is in, comparing .s files
is tough.

I'm busy until just before the summit.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
