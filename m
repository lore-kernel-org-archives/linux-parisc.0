Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA13742
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 05:02:55 -0700
Date: Thu, 30 Nov 2000 13:04:49 +0100 (MET)
To: "Steve Moret" <smoret@uci.edu>
Cc: parisc-linux@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] HP 9000/735-125
From: Helge Deller <deller@gmx.de>
References: <FKEGLIIBOIACJOCCAFIMCEFBCCAA.smoret@uci.edu>
Message-ID: <6166.975585889@www24.gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

Hi Steve,

> My mistake! I did a full build with todays CVS and parport didn't die.
> So
> somewhere between the 17th and now parport must have been fixed.

I checked in yesterday a modified version of
/drivers/parport/parport_gsc.c with an "#if 0 ... #endif" in the code. 
Could you try to boot again with "#if 1" (search for the text which says
something like "enable bidirectional PS/2 mode") and try again ?
If this hangs your machine I will implement a better work-around.

> 
> Now, maybe you can help me identify my SCSI problem. I don't know if it
> is
> because of driver issues or a bad disk (completly likely). 

I think Richard Hirst can help you much more with your SCSI-problems than
me.  

NB: Does your chassis LEDs work with the new kernel, and if not, could you
send me your bootlog (or "dmesg | grep led") ?

Greetings,

	Helge

-- 
Sent through GMX FreeMail - http://www.gmx.net
