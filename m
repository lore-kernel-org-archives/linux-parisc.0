Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA16180
	for <parisc-linux@puffin.external.hp.com>; Thu, 14 Dec 2000 03:59:17 -0700
Received: from mxdk.dk.tellabs.com (mxdk.dk.tellabs.com [172.19.74.16])
	by mx.tellabs.fi (8.8.8/8.8.8) with ESMTP id NAA05496
	for <parisc-linux@thepuffingroup.com>; Thu, 14 Dec 2000 13:01:15 +0200 (EET)
Received: from tellabs.com (pc-rtheande.dk.tellabs.com [172.19.62.43])
	by mxdk.dk.tellabs.com (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id MAA05102
	for <parisc-linux@thepuffingroup.com>; Thu, 14 Dec 2000 12:01:15 +0100 (MET)
Message-ID: <3A38A872.BF943E41@tellabs.com>
Date: Thu, 14 Dec 2000 12:01:06 +0100
From: Robin Theander <Robin.Theander@tellabs.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 712/60 booting problem
References: <3A374648.213EA4AC@de.origin-it.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


Well not really a boot problem but a few related questions.
If I do a
boot scsi.6.0 isl
palo displays the "options" menu and asks for some action (number or
'b').
At this point the box is dead - no response from keyboard or serial.
Is this supposed to work on this HW?

Can I control the console output (serial or STI/PDC) with a console=...
parameter in the boot string. This is the CDROM 0.5 stock kernel+palo
installed on a HD.
Can I change the /dev/console device numbers to do the same?
Before I get too far.. Is the STI mode working at all on a 712/60? The
docs and reports are a bit vague on this.

TIA.

Regards,

Robin.


Matthias.Wientapper@de.origin-it.com wrote:
> (ASIC-Designers love their HPs, eh?)

Well, we are doing all the ASIC work on Suns - and I'm edging PC's with
Linux in where I can. My 712/60 is an old decommissioned dns server.
Getting rid of H-PUX makes it a great toy - thanks guys.

-- 
ASIC Design Engineer
Tellabs Denmark A/S

Direct: +45 4473 2942
robin.theander@tellabs.com
