Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA09466
	for <parisc-linux@puffin.external.hp.com>; Tue, 13 Jul 1999 20:38:42 -0600
Received: from Galois.suse.de (Galois.suse.de [194.112.123.130])
	by Cantor.suse.de (Postfix) with ESMTP id B3FB532CE2
	for <parisc-linux@thepuffingroup.com>; Wed, 14 Jul 1999 04:39:15 +0200 (MEST)
Received: from Wotan.suse.de (Wotan.suse.de [10.10.0.1])
	by Galois.suse.de (Postfix) with ESMTP id 923279410
	for <parisc-linux@thepuffingroup.com>; Wed, 14 Jul 1999 04:39:15 +0200 (MEST)
Date: Wed, 14 Jul 1999 04:39:14 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990714043914.H10285@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Status
List-ID: <linux-parisc.vger.kernel.org>

Hello everybody,
I thought it was about time I gave you all a quick update about what I am
doing.

First, interruptions are being well.  We can do the return thing now too,
and I'm pretty sure the number of bugs hiding there is close to zero. We
will need some changes here before userspace will really work and at the
time we'll virtually map most of the kernel.

Interrupts are about working.  We don't free them yet and the code isn't
really tested, but the timer interrupt works very much like it is supposed
to.

I currently try to get some MMU code working so we can get a first impres-
sion of what userspace will look like.

	Philipp
