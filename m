Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA23844
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 13:46:45 -0700
Date: Thu, 30 Dec 1999 15:49:25 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: Jeffrey A Law <law@cygnus.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble building CVS binutils
Message-ID: <19991230154925.A12629@thepuffingroup.com>
References: <19991230141847.W12629@thepuffingroup.com> <14902.946582128@upchuck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <14902.946582128@upchuck>; from Jeffrey A Law on Thu, Dec 30, 1999 at 12:28:48PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 30, 1999 at 12:28:48PM -0700, Jeffrey A Law wrote:
> According to the SOM spec the subspace alignment must be greater than zero.
> Thus, this seems like a bug in the HP linker.

OK, it seems we were tripping it with the 2.3 kernel.  We had:

	.SPACE $CODE$
	.SUBSPA $TEXT$
(a function)
	.SUBSPA $DATA$
(some more functions)

Changing this to:
	.SPACE $CODE$
	.SUBSPA $DATA$
(a function)
(some more functions)

seems to work OK.

Thanks to prumpf for his help tracking this down.
