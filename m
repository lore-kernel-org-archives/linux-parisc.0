Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA17707
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 15:58:02 -0700
Date: Thu, 25 Nov 1999 00:01:07 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Stan Sieler <sieler@allegro.com>
Cc: Frank Rowand <frowand@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: itmr rollover in delay loop
Message-Id: <19991125000107.O1009@mathe.stud.uni-erlangen.de>
References: <199911241936.LAA19634@xsvr4.cup.hp.com> <199911242246.OAA31733@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911242246.OAA31733@opus.allegro.com>
List-ID: <linux-parisc.vger.kernel.org>

> Actually, unsigned integers cause the problem, as seen below.

That's why no one, ever, used unsigned integers.  The assembly source
was clear in using ">" (signed) and the C pseudo-code used "> 0" which
pretty much implies the value compared is signed.

<removed 120 line "there's only one unsigned integer > 0" proof>

	Philipp Rumpf
