Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA01888
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 13:42:20 -0700
Content-Type: text/plain;
  charset="iso8859-1"
From: Helge Deller <deller@gmx.de>
To: Grant Grundler <grundler@cup.hp.com>,
        "CLAPPER,MIKE \(HP-USA,ex1\)" <mike_clapper@hp.com>
Subject: Re: [parisc-linux] B132L boot hang
Date: Wed, 22 Nov 2000 21:43:40 +0100
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
References: <200011221727.JAA21644@milano.cup.hp.com>
In-Reply-To: <200011221727.JAA21644@milano.cup.hp.com>
MIME-Version: 1.0
Message-Id: <00112221434002.00303@P100>
List-ID: <linux-parisc.vger.kernel.org>

> I think I need more output. Based on ioscan output, the B132L
> has two serial ports:
> 8/16/4 - off of LASI
> 8/20/2 - of WAX (EISA Bus Adapter)
> 
> (GSCtoPCI is at 8/0)
> 
> I don't think the one off of WAX is supported right now.

It should be detected & supported (at least it is on my B160L).
But it is not used as initial console since it normally gets assigned as 
ttyS1 while LASI-serial gets ttyS0.

Greetings,

	Helge.
