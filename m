Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.fachschaften.tu-muenchen.de (hermes.fachschaften.tu-muenchen.de [129.187.176.19])
	by dsl2.external.hp.com (Postfix) with SMTP id F2501482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Oct 2001 09:42:49 -0600 (MDT)
Date: Sun, 14 Oct 2001 17:42:53 +0200 (CEST)
From: Andreas Deresch <aderesch@fs.tum.de>
Sender: aderesch@pluto.fachschaften.tu-muenchen.de
Reply-To: Andreas Deresch <aderesch@fs.tum.de>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic with -pa48 
In-Reply-To: <200110141428.f9EESss01949@localhost.localdomain>
Message-ID: <Pine.NEB.4.40.0110141741120.530-100000@pluto.fachschaften.tu-muenchen.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> The 712/60 is even stranger: It has one SCSI drive housing and a short ribbon
> cable with no termination.  It looks like the correct configuration for this
> one would be to activate the drive's termination and also put a D50 terminator
> on the external connector?  Unfortunately, the Micropolis drive it came with
> expired in a cloud of smoke when I turned it on.  However, I was able to
> determine that the Micropolis was unterminated, so the internal bus was
> completely unterminated.
I don't know about 715, but 712 is supposed to be terminated onboard =>
internal drive not terminated, external branch only terminated when drive
present. (That's what the docs say, too)

ad
