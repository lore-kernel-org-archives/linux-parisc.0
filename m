Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F2D4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Jun 2001 05:51:52 -0600 (MDT)
Date: Wed, 6 Jun 2001 06:53:33 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages 
In-Reply-To: <200106052059.OAA20922@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.21.0106060652360.24277-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Jun 2001, Grant Grundler wrote:
> djweis@sjdjweis.com wrote:
> > 
> > Can any of the HP people comment on where the second serial port on a D310
> > lives?
> 
> 	http://216.208.98.4/view.php3?type=machine&name=D310
> 
> Says one is on WAX and the other on LASI.
> I can't say for sure which is first or second.
> Based on console output, one should be able to determine
> which is which by comparing the upper bits of the MMIO address
> to the address of LASI and WAX.

I was looking through the documentation section of the site and couldn't
find anything on wax. What other name would it be listed as? I did find
the lasi docs.

dave

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
