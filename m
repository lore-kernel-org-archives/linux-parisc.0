Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA12547
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 23:53:20 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Dec 2000 06:56:08 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA16776;
	Thu, 14 Dec 2000 17:55:54 +1100
Date: Thu, 14 Dec 2000 17:55:54 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Michael Ang <mang@subcarrier.org>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] phase 2 gcc build fails
In-Reply-To: <3A38683A.A2FCB51B@subcarrier.org>
Message-ID: <Pine.LNX.4.21.0012141742060.2565-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 14 Dec 2000, Michael Ang wrote:

> Yeah, that's exactly what you wanted to do.  After you ran the "admin
> -b" command, the vendor branch was de-vendorised, so I'm guessing that
> the next time you pulled you got the trunk, not the branch.  With vendor
> branches, you never really know if you're pulling from a branch or the
> trunk, hence our desire to avoid them.

For answering, you're the lucky recipient of another question :-)

Is it possible to import a vendor branch that contains new files, without
them magically appearing when checking out the HEAD version?  I've just
done an import from sourceware, then had to rm all the new files, cvs rm,
cvs commit.  Which is a pain.  Also, unless people use "checkout -P", they
get empty directories.

Regards, Alan
-- 
Linuxcare.  Support for the Revolution.
