Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id QAA15364
	for <parisc-linux@sod.res.cmu.edu>; Wed, 7 Apr 1999 16:18:40 -0400
Received: from gplmail.fc.hp.com (nsmail@gplmail.fc.hp.com [15.1.92.20])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id QAA14718
	for <parisc-linux@thepuffingroup.com>; Wed, 7 Apr 1999 16:18:11 -0400 (EDT)
Sender: don@atlrel1.hp.com
Message-ID: <370BBD87.B30E259@fc.hp.com>
Date: Wed, 07 Apr 1999 14:18:15 -0600
From: Don Dyer <don@fc.hp.com>
MIME-Version: 1.0
To: Jason Eckhardt <jason@equator.com>
CC: kumar@ix.netcom.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Qn on Linux/PA-RISC future Console driver
References: <199904071805.LAA22267@gatekeeper.equator.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



Jason Eckhardt wrote:
> 
> >
> > Hi,
> >       Has anyone done some work on Linux/PA-RISC Console driver.
> >       Are we planning to use PDC for console or is it possible
> >       to directly access Console device.
> >
> 
>   I believe HP-UX uses the STI ROM interface rather than going
>   through the IODC interface (i.e. like the bootstrap), although an HP person
>   can tell us positively.

  IODC uses STI to access the graphics device.  This removes graphics
device dependencies in IODC and allows any graphics device (including
unknown or new devices) to be used as the text only boot device.

Don Dyer
Workstation Systems Lab
+1 970/898-4277
