Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA17426
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 10:10:40 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 12 Dec 2000 17:12:49 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 12 Dec 2000 17:12:17 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A365CFB.E03FEB72@linuxcare.com>
Date: Tue, 12 Dec 2000 12:14:35 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Marko.T.Niskanen@nokia.com
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 712/60 booting problem
References: <13F0486DB51CD311A0AE0008C7C561380453D432@eseis11nok>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Marko.T.Niskanen@nokia.com wrote:
> kernel BUG at pci-dma.c:400!
> kernel BUG at pci-dma.c:391!
> kernel BUG at pci-dma.c:400!
> kernel BUG at pci-dma.c:391!
> kernel BUG at pci-dma.c:400!
> ISO 9660 Extensions: RRIP_1991A
> VFS: Mounted root (iso9660 filesystem) readonly.

Those are actually messages that are perfectly normal.

I wonder if Marko's problems are specific to the 712/60, does anyone
else with a 712/60 have such kernel panics?  I don't on my 712/80.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
