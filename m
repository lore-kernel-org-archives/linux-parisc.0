Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA02892
	for <parisc-linux@puffin.external.hp.com>; Wed, 21 Jul 1999 04:42:28 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com
Date: Wed, 21 Jul 1999 12:36:02 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <99072112434900.05889@P100>
Subject: [parisc-linux] OSF-clean source-code..
List-ID: <linux-parisc.vger.kernel.org>

Hello List !

I committed some changes in varios files, so that we now are not very far from
OSF-clean code in the tree...

My intention is, to remove pdc.h completely in short time, and rewrite
all used #defines and structures (GPL´d) in pdc-linux.h (thanks to Paul Lahaie).
When the transition is done, pdc.h will be removed, and pdc-linux will replace
pdc.h completely.

Please continue to #inlclude pdc.h in the sources only. This way the transition
could work clean to the tree...

Helge Deller.
