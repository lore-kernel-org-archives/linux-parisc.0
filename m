Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA20990
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Sep 2000 12:45:10 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 03FCDEA0
	for <parisc-linux@thepuffingroup.com>; Wed,  6 Sep 2000 11:45:17 -0700 (PDT)
Date: Wed, 6 Sep 2000 11:48:26 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200009061848.LAA26001@milano.cup.hp.com>
To: jsm@fc.hp.com
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] save_specials performance
List-ID: <linux-parisc.vger.kernel.org>

Hi john, paul,
if save_specials and rest_specials macros in include/asm-parisc/assembly.h
could trash both %r1 and %r2, would it double the speed of the
macros since the serial mfctl/mtctl could interleave register usage?

I understand %r2 would need to be saved some place first and that
might have it's own set of issues...but I suspect save/rest specials
is getting called alot.

thanks,
grant
