Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA28025
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 22:58:49 -0700
Sender: mang@mailserv2.iuinc.com
Message-ID: <3A39B28F.9249D179@subcarrier.org>
Date: Fri, 15 Dec 2000 00:56:31 -0500
From: Michael Ang <mang@subcarrier.org>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] phase 2 gcc build fails
References: <3A38683A.A2FCB51B@subcarrier.org> <Pine.LNX.4.21.0012141742060.2565-100000@front.linuxcare.com.au> <20001214102032.A17802@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

I implied this in my previous message, but you want to put "remove -f"
in you .cvsrc.  Of course, forgetting there's even a long form at all is
a sign of strength, not weakness. :)

	- Mike.

Matthew Wilcox wrote:
> 
> unfortunately, cvs doesn't seem to take the `-f' option from the .cvsrc
> for the rm command.
