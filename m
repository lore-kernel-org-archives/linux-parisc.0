From: Roland McGrath <roland@redhat.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Sun, 29 Nov 2009 20:41:37 -0800 (PST)
Message-ID: <20091130044137.59265D6D2@magilla.sf.frob.com>
References: <4A89CC4D.5040801@gmx.de>
	<20090818050637.4C3E74730F@magilla.sf.frob.com>
	<1250640565.15079.3.camel@mulgrave.site>
	<200908251707.01610.rusty@rustcorp.com.au>
	<20091127221156.GA5334@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rusty Russell <rusty@rustcorp.com.au>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	dave@hiauly1.hia.nrc.ca
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: Helge Deller's message of  Friday, 27 November 2009 23:11:57 +0100 <20091127221156.GA5334@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Since the sections are empty anyway, I don't see any reason
> why those section names need to be exported via sysfs.
> 
> Let's just drop them, which works for parisc (and should for any
> other architecture too).

That seems fine to me.


Thanks,
Roland
