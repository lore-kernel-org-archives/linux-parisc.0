From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Sat, 18 Dec 2010 15:13:21 -0500
Message-ID: <20101218201320.GA11202@hiauly1.hia.nrc.ca>
References: <20101024020337.725094D30@hiauly1.hia.nrc.ca> <alpine.DEB.1.10.1010240432390.30241@artax.karlin.mff.cuni.cz> <20101024034314.GQ8332@bombadil.infradead.org> <alpine.DEB.1.10.1010260404260.6982@artax.karlin.mff.cuni.cz>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010260404260.6982@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 26 Oct 2010, Mikulas Patocka wrote:

> > our cache flushing is a bit... suboptimal right now (doing whole cache
> > flushes on fork and such.)
> 
> What is exactly the problem there? Could you describe it or refer to some 
> document that describes it? Why do you need to flush on fork?

Discussed here:
http://lkml.org/lkml/2003/12/15/244

Flush should not be needed according to Lamont.

However COW handling is broken.  See minifail bug on wiki:
http://wiki.parisc-linux.org/TestCases

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
