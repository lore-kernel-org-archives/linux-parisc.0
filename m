From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [bug] gcc-4.[23] miscompiling causing networking to bugger up
Date: Wed, 28 May 2008 20:02:19 -0400
Message-ID: <20080529000219.GE30501@phobos.i.cabal.ca>
References: <20080528234110.GD30501@phobos.i.cabal.ca> <20080529000059.9C6434E77@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080529000059.9C6434E77@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 28, 2008 at 08:00:58PM -0400, John David Anglin wrote:
> > Ah well, anyway, it works built at -O0, and buggers up at -O1.
> > 
> > Want a copy of each of the .S?
> 
> I think it would be useful to know if this is still present in 4.3 branch
> head.  Unless we know which routine the problem is in, comparing .s files
> is tough.
> 
> I'm busy until just before the summit.
> 

I tried 4.4 from svn a few days (more like 2 weeks maybe) ago. Is that
recent enough or should I try 4.3-head as well (no problem to do.)

r, Kyle
