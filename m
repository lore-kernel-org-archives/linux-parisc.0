Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA29036
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 13:57:22 -0700
Message-Id: <200011202059.MAA18987@milano.cup.hp.com>
To: herrold <herrold@owlriver.com>
Cc: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>,
        parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: Serial vs. STI console selector was: Re: [parisc-linux] Beta CD 
In-reply-to: Your message of "Mon, 20 Nov 2000 15:40:24 PST."
             <Pine.LNX.4.30.0011201531170.6744-100000@pokey.513erich.iwaynet.net>
Date: Mon, 20 Nov 2000 12:59:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Russ" herrold wrote:

> Is this possible, to allow support of both, with a single kernel?

Yes. I think the issues are code not stomping on each other.
And it's easy than you might think - PDC can tell us what the
primary console is.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
