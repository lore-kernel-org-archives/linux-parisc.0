Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19764
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 11:56:38 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 1 Jan 2001 18:59:56 -0000
Subject: Re: [parisc-linux] ZONE_DMA
To: matthew@wil.cx (Matthew Wilcox)
Date: Mon, 1 Jan 2001 19:01:19 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox), matthew@wil.cx (Matthew Wilcox),
        parisc-linux@thepuffingroup.com
In-Reply-To: <20010101185557.A25603@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jan 01, 2001 06:55:57 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14DACv-0001Bg-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> But if we have none, then all GFP_DMA allocations will fail.  Which
> includes the scsi midlayers.  Ooh, I just noticed that scsi_scan.c
> is broken...  expect a patch RSN.

SCSI may need fixing, but do you want to do it right 8)
