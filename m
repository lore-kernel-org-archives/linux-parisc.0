Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dea.linux-mips.net (u-150-20.karlsruhe.ipdial.viaginterkom.de [62.180.20.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B09B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 12:14:37 -0600 (MDT)
Received: (from ralf@localhost)
	by dea.linux-mips.net (8.11.1/8.11.1) id f83DELY05803;
	Mon, 3 Sep 2001 15:14:21 +0200
Date: Mon, 3 Sep 2001 15:14:21 +0200
From: Ralf Baechle <ralf@uni-koblenz.de>
To: Ulrich Weigand <Ulrich.Weigand@de.ibm.com>
Cc: "David S. Miller" <davem@redhat.com>,
	Richard.Zidlicky@stud.informatik.uni-erlangen.de, thunder7@xs4all.nl,
	parisc-linux@lists.parisc-linux.org, linux-kernel@vger.kernel.org
Message-ID: <20010903151421.A3078@dea.linux-mips.net>
References: <OF9A995335.07A81CF5-ONC1256ABC.00422A7B@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OF9A995335.07A81CF5-ONC1256ABC.00422A7B@de.ibm.com>; from Ulrich.Weigand@de.ibm.com on Mon, Sep 03, 2001 at 02:08:43PM +0200
Subject: [parisc-linux] Re: [SOLVED + PATCH]: documented Oops running big-endian reiserfs on parisc architecture
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 02:08:43PM +0200, Ulrich Weigand wrote:

> >From what I recall when we were looking into reiserfs on S/390,
> the core problem was that reiserfs tried to do *atomic* operations
> on non-aligned words.  This isn't supported by the hardware on
> S/390 (normal non-aligned accesses just work).
> 
> I don't really see how this can be fixed in a trap handler; how
> would the handler guarantee atomicity?

Spinlocks.  Now that'd so infinitly ugly that I'd rather fix Reiserfs.
It's another proof that reiserfs design was done without too much
consideration of portability so I speculate we'll continue to see such
bugs.

  Ralf
