Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA12355
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 16:42:13 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37C32372.2D1BD34B@thepuffingroup.com>
Date: Tue, 24 Aug 1999 18:57:54 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting 715/100
References: <199908242121.OAA09713@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> 
> I finally managed to build a kernel from the 08/07/99 tar file.
> Now I can't boot it!

No problem.  We've been through this a lot.

You should really grab the latest kernel, a lot has changed since either
the July 8th or August 7th release.  CVS is really the better way to
handle this, but you can ftp down the latest (fixed!) source tree from
ftp://puffin.external.hp.com/pub/parisc/cvs .

I know there's some problems with our LIF header not being complete, but
there's not a lot we can do about this until we have docs on LIF.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
