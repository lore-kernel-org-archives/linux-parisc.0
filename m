Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA04149
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 22:51:54 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 6 Sep 2000 04:52:06 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA30883;
	Wed, 6 Sep 2000 15:48:54 +1100
Date: Wed, 6 Sep 2000 15:48:54 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] entry.S Invalid operands 
In-Reply-To: <200009060424.VAA24432@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0009061542070.22521-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Sep 2000, Grant Grundler wrote:

> Setting CROSS_COMPILE didn't help. So I went to binutils-2.10
> and ran cvs update manually. To my surprise a bunch of files
> were updated.

Well, some should have updated as I did another merge a few hours
ago.  The previous merge was at a bad time, with some configure files
broken.

The other likely possibility is that objects aren't being rebuilt even
when source files are newer.  Dependency information in binutils might be
wrong, or your version of make broken.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
