Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA17198
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 15:21:45 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 18 Jan 2001 22:25:20 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id EF01CB005; Thu, 18 Jan 2001 22:15:58 +0000 (GMT)
Date: Thu, 18 Jan 2001 22:15:58 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@tylerdrive.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting a 710 (bushmaster)
Message-ID: <20010118221558.D28638@linuxcare.com>
References: <200101182104.f0IL4lb20828@openbsd1.buttafuoco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101182104.f0IL4lb20828@openbsd1.buttafuoco.net>; from jim@tylerdrive.org on Thu, Jan 18, 2001 at 04:04:47PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 04:04:47PM -0500, Jim Buttafuoco wrote:
> attach is the boot log.

OK, that tells me that the network chip is working fine - the chip is
receiving frames and buffering them.  The problem is that interrupts
the chip generates are not getting to the driver - so the driver never
looks for completed commands.

Anyone know if interrupt handling is different for a 710?

Richard
