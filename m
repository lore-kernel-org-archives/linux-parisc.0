Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA03202
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 17:17:43 -0700
Date: Sat, 26 Feb 2000 00:17:29 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: willy@thepuffingroup.com
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap
Message-ID: <20000226001729.F812@abacus.local>
References: <200002250259.SAA04374@milano.cup.hp.com> <20000224224934.N9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000224224934.N9944@thepuffingroup.com>; from willy@thepuffingroup.com on Thu, Feb 24, 2000 at 10:49:34PM -0500
List-ID: <linux-parisc.vger.kernel.org>

> http://boudicca.tux.org/hypermail/linux-kernel/2000week06/0092.html
> 
> There was a bug in 2.3.41, looks like it didn't get fixed in .42, that

Apparently it did get fixed in .42, so it might be worth finding out what
exactly causes Grant's unaligned trap.
