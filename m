Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA12600
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 21:43:56 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 03:44:11 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: Cary Coutant <cary@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0009131125280.23150-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Sep 2000 23:17:18 -0400
In-Reply-To: Alan Modra's message of "Wed, 13 Sep 2000 11:30:18 +1100 (EST)"
Message-ID: <87og1tkmkh.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> That's not too bad a hack.  I took a different approach and generate
> import stubs when PIC code is detected during a static link.  David, is
> there some problem with this (or was this a very old email that Cary was
> replying to)?

Very old email, I think.  I don't see a problem with the way we do it
either, though.  Half dozen of one, six of the other...

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
