Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA10282
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 07:38:23 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 13:38:08 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 18 Aug 2000 13:37:39 -0000
Date: Fri, 18 Aug 2000 08:33:07 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Steffen Lvrch <sloerch@gmx.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot in Graphic-Mode
Message-ID: <20000818083307.T7757@vodka.thepuffingroup.com>
References: <17061.966577129@www28.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <17061.966577129@www28.gmx.net>; from Steffen Lvrch on Fri, Aug 18, 2000 at 07:38:49AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 18, 2000 at 07:38:49AM +0200, Steffen Lvrch wrote:
> Hey, all !!
> Thanks for replies yesterday! Today another question from da newebee.
> I've installed the CD-Image-Version of da MkLinux, but I don't want to

MkLinux?  I presume you're mistaken here; this kernel is not based on Mach.

> boot into console mode. How can I boot into graphic mode ?

Port the X server :-)

-- 
Revolutions do not require corporate support.
