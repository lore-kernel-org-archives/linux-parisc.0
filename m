Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA03357
	for <parisc-linux@puffin.external.hp.com>; Wed, 21 Jul 1999 05:15:11 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: "Paul J.Y.Lahaie" <pjlahaie@ottawa.com>
Subject: Re: [parisc-linux-cvs] pjlahaie, interrupted with code 28....
Date: Wed, 21 Jul 1999 13:01:59 +0200
Content-Type: text/plain
Cc: parisc-linux@thepuffingroup.com, Philipp Rumpf <prumpf@suse.de>
References: <199907210257.UAA00743@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <99072113074701.05889@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Wed, 21 Jul 1999 schrieb Paul Lahaie:
> Update of /home/cvs/parisc/linux/drivers/gecko
> In directory puffin.external.hp.com:/tmp/cvs-serv735
> 
> Modified Files:
> 	dino.c 
> Log Message:
> Fix dino probing code so that systems without Dinos do not crash while trying
> to read the configuration registers.

Hi Paul !

Those changes seem to initialize the interrupt-routine, so that I get the whole
time  "Interrupted with code 28, regs xxxxx"...... (I don´t have a dino in my
hp-machine!)

Could you/someone maybe take a look into it ?
It does not happen, when you don´t include DINO-support into the kernel.
Please correct me, if I´m totally wrong here.....

PS: This also happened here with my machine, before I applied/committed my
latest changes...

Helge.
