Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA26732
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 May 2000 14:27:49 -0600
Received: from dyn181-ras4.screaming.net (HELO rhirst.linuxcare.com) (postfix@212.49.227.181)
  by mailserv2.iuinc.com with SMTP; 10 May 2000 14:20:34 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C45DEB006; Wed, 10 May 2000 15:20:10 +0100 (BST)
Date: Wed, 10 May 2000 15:20:10 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000510152010.R1090@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New driver for NCR 53c700 SCSI chips
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I have added a driver for the 53c700.  It is only lightly tested on my 715/75,
but does detect a disk and a tape, and can mount a root file system and load the
standalone shell from it.  The changs are all in cvs.

I recommend disconnecting any disks with valuable data on them before trying it.

For those that don't know me, I have a lot of experience with the 53c710 on m68k
VME boards and Compaq machines.  I created 53c7xx.c from 53c7,8xx.c and also wrote
sim710.c.

The new driver is sim700.c and my intention is to make it support 53c710 also, so
sim710.c can be removed.

At present selecting CONFIG_SCSI_LASI builds in sim700.c, sim710.c, and 53c7xx.c.
I think we should concentrate on sim700.c and forget about 53c7xx.c.  53c7xx.c is
more powerful, but is limited to 53c710 chips and makes demands on the hardware
that not all systems support.  I don't know how practical it is to make 53c7xx.c
work on a range of HP machines, and favour adding extra functionality to sim700.c
as we need it.

Please give this a try and report back,

Thanks,
  Richard
