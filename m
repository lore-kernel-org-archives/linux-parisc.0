Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA10367
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 13:32:00 -0600
Date: Tue, 1 Jun 1999 21:31:57 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: cjbeard@istar.ca, parisc-linux@thepuffingroup.com
Subject: Re: Building the Bootloader
Message-ID: <19990601213157.A12837@suse.de>
References: <19990601191800.C25364@suse.de> <199906011805.OAA25752@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199906011805.OAA25752@hiauly1.hia.nrc.ca>; from John David Anglin on Tue, Jun 01, 1999 at 02:05:08PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> I think that I may have been able to successfully cross compile ipl to an
> elf binary with text starting at offset 0.  Note that this requires that

offset 0 sounds bad as we may not corrupt page 0 (the PDC puts some data we
need there).
