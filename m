Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA31818
	for <parisc-linux@puffin.external.hp.com>; Sun, 27 Aug 2000 15:52:37 -0600
Received: (from epaulson@localhost)
	by data.upl.cs.wisc.edu (8.10.2/8.10.2) id e7RLqTg20646
	for parisc-linux@thepuffingroup.com; Sun, 27 Aug 2000 16:52:29 -0500
Date: Sun, 27 Aug 2000 16:52:29 -0500
From: Erik Paulson <epaulson@upl.cs.wisc.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000827165229.A18560@data.upl.cs.wisc.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] FW Scsi support?
List-ID: <linux-parisc.vger.kernel.org>

Hi
	I'm trying to get my C100 and C160 to boot with the CD image. Everything
seems fine, except they don't see the SCSI disk I've got - only the CDROM.

My guess is that they're angry about it being on the FWSCSI, (my CDROM is
on SESCSI)

Is Fastwide SCSI supported? If not, what needs to be done? I didn't see how
to turn it on with 'make config'. Are there docs availble for this hardware?

Thanks!

-Erik
