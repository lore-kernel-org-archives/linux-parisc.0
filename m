Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA11926
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 23:30:07 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <3A38683A.A2FCB51B@subcarrier.org>
Date: Thu, 14 Dec 2000 01:27:06 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: Alan Modra <alan@linuxcare.com.au>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] phase 2 gcc build fails
References: <Pine.LNX.4.21.0012141355570.2565-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Yeah, that's exactly what you wanted to do.  After you ran the "admin
-b" command, the vendor branch was de-vendorised, so I'm guessing that
the next time you pulled you got the trunk, not the branch.  With vendor
branches, you never really know if you're pulling from a branch or the
trunk, hence our desire to avoid them.

	- Mike.

Alan Modra wrote:
> 
> On Thu, 14 Dec 2000, Alan Modra wrote:
> 
> > What I've got to do, I guess, is to commit my tree back to the main truck.
> > eg. in the case of config.if, we want a version 1.2 which will be identcal
> > to version 1.1.1.2
> 
> Seemed to work OK.  A "cvs update -d" in your gcc directory should now
> fix your tree for you.
