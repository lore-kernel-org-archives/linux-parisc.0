Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA24609
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Jun 1999 09:43:21 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id LAA01777
	for <parisc-linux@thepuffingroup.com>; Fri, 18 Jun 1999 11:51:30 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <376A6B00.C1507372@thepuffingroup.com>
Date: Fri, 18 Jun 1999 11:51:28 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] A quick update
References: <3769F3AD.DF068942@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> Next:
> 
> - we need an HPUX ld linker script to resolve the vmlinux building,
> what's the format for this?

Thomas Bogendorfer solved this for us.

> 
> - we need to figure out why the bootloader gives an error when loading
> the kernel into memory

It looks like an IPL problem...

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
