Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA30972
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Nov 1999 11:19:45 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 30 Nov 1999 18:21:42 -0000
Subject: Re: [parisc-linux] Progress - Update
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 30 Nov 1999 18:21:20 +0000 (GMT)
Cc: dave@hiauly1.hia.nrc.ca, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        alan@lxorguk.ukuu.org.uk, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199911301817.NAA02676@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 30, 99 01:17:05 pm
Content-Type: text
Message-Id: <E11srty-00075i-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> The macro xchg is used in quite a few places in what is nominally
> machine independent code.  Should we add __attribute__ ((aligned (16))
> to the definitions of all variables which exchange with 0?  Or, should
> we look for another solution?

xchg() is defined to work for a range of types and sizes. It is up to the 
arch code to implement it. That may mean you need to use a spinlock to implementsome cases.

Alan
