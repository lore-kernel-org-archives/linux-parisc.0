Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA12659
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 18:16:26 -0700
From: willy@thepuffingroup.com
Date: Tue, 29 Feb 2000 19:17:12 -0500
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Value of an old K-class server?
Message-ID: <20000229191712.L9944@thepuffingroup.com>
References: <20000301010645.Y30912@neep.com.au> <20000229122439.F9944@thepuffingroup.com> <20000301074847.A13653@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000301074847.A13653@neep.com.au>; from Andrew Shugg on Wed, Mar 01, 2000 at 07:48:49AM +0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 01, 2000 at 07:48:49AM +0800, Andrew Shugg wrote:
> I'm a bit confused by this.  I thought the HP 375 was a PA-RISC thingy.
> Certainly there have been numerous people on this list talking about getting
> their 315's or whatever to boot the parisc-linux kernel.

Do you perhaps mean the 735 and 715?

> Had me a look at the HW database, and it says the 375 carries a 'PA7000'
> processor.  (As a side note, the link for this in the database,
> "http://216.208.98.4/view.php3?type=cpu&name=PA7000 (PCX-S)", made my proxy
> server unhappy.  Dropping the " (PCX-S)" off the end of it helped.)

This is a bug which we fixed earlier this afternoon (that should have
been `%20' instead of the space character).  There are still pending
changes to the hw database that will make it closer to being correct.
At least the PA8000/8200/8500 chips should be correct (there may be
omissions, but there should not be incorrect chips in those categories).

> Is a PA7000 not a PA-RISC chip?

Yes, it is.  To complicate matters, there are PA7000 CPUs which implement
the PA1.0 architecture (PCX) and PA7000 CPUs which implement the PA1.1
architecture (PCX-S).  The intention is to support the latter and not
the former.

> Showing my ignorance,

Less than a year ago, I didn't know the difference between a PA1.0 and
PA1.1 machine :-)
