Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA15511
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 13:39:53 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 18 Jan 2001 20:43:39 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5A8CAB005; Thu, 18 Jan 2001 20:34:20 +0000 (GMT)
Date: Thu, 18 Jan 2001 20:34:20 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@tylerdrive.org>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trouble booting a 710 (bushmaster)
Message-ID: <20010118203419.A28638@linuxcare.com>
References: <200101181812.f0IICoF19246@openbsd1.buttafuoco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101181812.f0IICoF19246@openbsd1.buttafuoco.net>; from jim@tylerdrive.org on Thu, Jan 18, 2001 at 01:12:50PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 01:12:50PM -0500, Jim Buttafuoco wrote:
> Ok,
> 
> I tried the uncompressed ramdisk, same results.  I am going to try to 
> debug this issue first by putting some debug code in rd.c.  I will keep 
> you posted...
> 
> ANY more suggestions????

Sounds more likely a network driver problem.  Can you boot with
i596_debug=0xffff and send me the output.  If that doesn't generate
lots of extra output, change the value of i596_debug in
drivers/net/lasi_82596.c and try again.

Richard
