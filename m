Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA02545
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Aug 1999 18:00:57 -0600
Received: from Galois.suse.de (Galois.suse.de [194.112.123.130])
	by Cantor.suse.de (Postfix) with ESMTP id 0D07132CD3
	for <parisc-linux@thepuffingroup.com>; Thu, 12 Aug 1999 02:02:03 +0200 (MEST)
Received: from Wotan.suse.de (Wotan.suse.de [10.10.0.1])
	by Galois.suse.de (Postfix) with ESMTP id D84AA67A9
	for <parisc-linux@thepuffingroup.com>; Thu, 12 Aug 1999 02:02:02 +0200 (MEST)
Date: Thu, 12 Aug 1999 02:01:40 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990812020139.J11312@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GSC cards
List-ID: <linux-parisc.vger.kernel.org>

Hi,
even if there was not much list traffic in the last weeks, development is
going on and even making real progress.  We expect to run our first user
space program RSN.

One of the areas we now have code for is GSC bus walking.  This code is
basically engineered from some hints in the Dino documentation and not
tested with any other device (Lasi, Artist, and the CPU, though on the
GSC bus, do not use the HPA pages and are not auto-detectable in the
same way as Dino.

Therefore, if any of you have access to other machines than 712's or 
A180[c]s (this includes 715s), or machines with GSC cards other than
Dino-on-a-card based ones in them, please try to boot them with the Image
at ftp://sunsite.auc.dk/pub/os/linux/parisc/testing/image-2.2.1-gsctest
and send the lines between "GSC init" and "mem_init bla bla bla" here
(it might be a good idea to keep the subject line "Re: GSC cards" instead
to avoid annoying anybody).

TIA,

	Philipp Rumpf
