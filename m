Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04305
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 18:33:40 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 01:36:15 -0000
Subject: Re: [parisc-linux] Recent CVS kernel: boot failure on 715/50 & inb() undefined
To: matthew@wil.cx (Matthew Wilcox)
Date: Wed, 6 Dec 2000 01:19:48 +0000 (GMT)
Cc: danne@telia.com (Daniel Engstrom), parisc-linux@thepuffingroup.com,
        5116@telia.com
In-Reply-To: <20001205223256.F12682@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Dec 05, 2000 10:32:56 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E143TFN-00009u-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> OK, this is Alan Cox's fault :-)  He insists that inb et al should not
> have dummy defines, but the drivers should be fixed instead.  please send
> your .config.

Oh wait ignore my other comment. I realised the context this one was meant.
You want it to fail to build drivers for things you cannot have, not 
mysteriously fail in some driver thats mostly mmio but has an inb/inw you
didnt notice..

> 
> 
