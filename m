Received: from smtp.linuxcare.com ([216.88.157.131])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA26153
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 08:39:59 -0700
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 15 Nov 2000 15:42:05 -0000
Sender: adevries@puffin.external.hp.com
Message-ID: <3A12BED3.B4F42ED2@linuxcare.com>
Date: Wed, 15 Nov 2000 11:50:27 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
CC: Grant Grundler <grundler@cup.hp.com>, Helge Deller <deller@gmx.de>,
        parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] dino maintainer?
References: <20001114101704.Y32715@linuxcare.com> <200011141610.IAA11646@milano.cup.hp.com> <20001115095835.I32715@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> On Tue, Nov 14, 2000 at 08:10:42AM -0800, Grant Grundler wrote:
> > FYI - card-mode dino was used for several different networking
> > interfaces but not SCSI interfaces.
> 
> But Helge has problems with the sym53c8xx driver on a B160L.  Is
> that a PCI card driven via Dino?  And if so, are you saying he needs
> to build his kernel with CONFIG_SCSI_NCR53C8XX_IOMAPPED=y so it
> doesn't try to use MMIO?

Hang on a sec... what Grant's saying is that *card-mode* dino is never
used for SCSI controllers, but on the B160L it would probably be
*chip-mode* dino.

Does this mean that all GSC SCSI expansion cards are Zalon based?

So what Helge has isn't a PCI card specifically, Dino and the 53c8xx are
all on the motherboard.

Does Dino handle IO memory mapping differently for chip or card mode?

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
