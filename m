Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA09846
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Jan 2001 19:43:11 -0700
Message-Id: <200101150247.SAA09667@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration 
In-reply-to: Your message of "Mon, 15 Jan 2001 01:00:29 PST."
             <20010115010029.A8375@parcelfarce.linux.theplanet.co.uk>
Date: Sun, 14 Jan 2001 18:47:57 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> is there a good reason that we duplicate large chunks of (for
> example) the SCSI configuration menu (from drivers/scsi/Config.in)
> in the arch/parisc/config.in file?

Perhaps to set flags to defaults friendly to parisc?
Just guessing...

grant
