Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA17675
	for <parisc-linux@puffin.external.hp.com>; Thu, 29 Apr 1999 21:30:04 -0600
Message-ID: <19990506052437.44410@insula.local>
Date: Thu, 6 May 1999 05:24:37 +0000
From: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
To: parisc-linux@thepuffingroup.com
Reply-To: Philipp Rumpf <prumpf@jcsbs.lanobis.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ld problem workaround
List-ID: <linux-parisc.vger.kernel.org>

There is now an ugly workaround in the CVS tree that allows us to
use 0x8000 as kernel entry point.
