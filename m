Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01778
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 15:17:32 -0700
Received: (from prumpf@localhost)
	by inwestnet.de (8.9.3/8.9.3) id WAA00605
	for parisc-linux@thepuffingroup.com; Wed, 15 Mar 2000 22:17:58 +0100
Date: Wed, 15 Mar 2000 22:16:47 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Assembly Language Changes
Message-ID: <20000315221647.G673@abacus.local>
References: <20000312152353.E5281@abacus.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000312152353.E5281@abacus.local>; from prumpf@inwestnet.de on Sun, Mar 12, 2000 at 03:23:53PM +0100
List-ID: <linux-parisc.vger.kernel.org>

I haven't received any negative comments about the proposed changes yet,
and think the following changes should become effective soon:

>  - Labels should always use ':'
>  - mnemonics in the first column should be interpreted normally.
>  - register names should always start with '%', not be specified by an
>    integer
>  - ';' should be used rather than '!' to separate multiple statements
>    on the same line
- '!' replaces ';' as the line comment character

I don't think a line comment character should be necessary for new code -
C comments (thats /* comment */, not // comment\n) work fine.

So, still no objections ?

	Philipp Rumpf
