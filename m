Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA08490
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 10:19:52 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: Thomas Marteau <marteaut@esiee.fr>,
        Puffin Group <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Mouse driver for PS/2
Date: Tue, 28 Nov 2000 18:21:34 +0100
References: <3A22C48D.F5F85405@esiee.fr> <3A23CA18.1171E884@esiee.fr>
In-Reply-To: <3A23CA18.1171E884@esiee.fr>
MIME-Version: 1.0
Message-Id: <00112818213403.13860@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Tuesday 28 November 2000 16:07, Thomas Marteau wrote:
> Hi all,

Hi Thomas,

>
> 	We appreciate if someone can explain where we can find request_irq

#include <linux/sched.h> and /arch/parisc/kernel/irq.c
request_irq() binds the given interrupt-number to a function (if possible).

> and
> request_region 

#include <linux/ioport.h>
request_region only marks (and tests) an I/O-region as used by a driver and 
makes this information visible via /proc/iomem and /proc/ioports.

> in hp_psaux.c and also,
> what are they doing?
>
> Thanks,
> ESIEE Team
