Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA28560
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 15:06:36 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 20 Jun 1999 21:05:57 -0000
Subject: Re: [parisc-linux] HPUX binary compatibility
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Sun, 20 Jun 1999 22:05:16 +0100 (BST)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19990620194015.J30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 20, 99 07:40:15 pm
Content-Type: text
Message-Id: <E10vomE-0004vh-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> any negative effect on anything.  Where it gets a little more thorny is
> in signal.h -- HPUX uses more than 32 signals.  Is it going to negatively
> impact Linux at all to use more than 32?  I see there is space reserved
> for them, but I'd like someone to reassure me.

How many non RT signals has HP/UX got. If its more than 32 we should allow
for it, otherwise whoever does HP/UX compatibility will hate you 
