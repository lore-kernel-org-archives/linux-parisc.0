Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA10453
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 07:42:53 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 13:42:33 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 18 Aug 2000 13:42:04 -0000
Date: Fri, 18 Aug 2000 08:37:33 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000818083733.U7757@vodka.thepuffingroup.com>
References: <20000815160510.C7757@vodka.thepuffingroup.com> <20000818124944.A13870@linuxcare.com> <20000818130835.B13870@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000818130835.B13870@linuxcare.com>; from Richard Hirst on Fri, Aug 18, 2000 at 01:08:35PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 18, 2000 at 01:08:35PM +0100, Richard Hirst wrote:
> In fact, it gets as far as reading the first block of init,
> doesn't like it, then goes and tries to read /bin/sh, finds it is
> a link to busybox, reads in the first block of that, and doesn't
> like it either:
> I guess it doesn't recognise the file format for some reason..

Sounds plausible; this is one of the things which got overhauled between
2.3.99pre8 and 2.4.0-test6.  i'll investigate.  is your init SOM or ELF?

-- 
Revolutions do not require corporate support.
