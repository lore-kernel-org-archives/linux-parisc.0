Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA23693
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 09:53:37 -0700
Received: from lightning.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 27 Nov 2000 16:55:51 -0000
Subject: Re: [parisc-linux] RPM and hppa
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 27 Nov 2000 16:55:36 +0000 (GMT)
Cc: alan@linuxcare.com.au (Alan Modra), alan@lxorguk.ukuu.org.uk,
        parisc-linux@thepuffingroup.com
In-Reply-To: <200011261645.LAA13960@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 26, 2000 11:45:08 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E140RZ5-0003I4-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> I think the above is a different problem.  The explosion is most likely
> a problem with exception edges in the gcse pass.  Try `-fno-gcse'.  This
> also appears in the tFile.cc libio test.

I've not yet had a chance to try this. I see the same behaviour building Qt
so I may try it on that
