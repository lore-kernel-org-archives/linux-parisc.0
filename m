Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA10595
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 14:03:30 -0600
Message-Id: <199906012003.QAA26250@hiauly1.hia.nrc.ca>
Subject: Re: Building the Bootloader
To: prumpf@suse.de (Philipp Rumpf)
Date: Tue, 1 Jun 1999 16:03:20 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: cjbeard@istar.ca, parisc-linux@thepuffingroup.com
In-Reply-To: <19990601213157.A12837@suse.de> from "Philipp Rumpf" at Jun 1, 99 09:31:57 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > I think that I may have been able to successfully cross compile ipl to an
> > elf binary with text starting at offset 0.  Note that this requires that
> 
> offset 0 sounds bad as we may not corrupt page 0 (the PDC puts some data we
> need there).

This is easily changed but seems consistent with the "-R 0" option to
the hp linker used in Jason Eckhardt's Makefile.  It would appear that
mkipl builds the actual image.  On the otherhand, no care was taken
to compile using pic so there may be a relocation problem.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
