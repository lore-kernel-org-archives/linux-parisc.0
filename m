Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA23296
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 01:59:26 -0600
Sender: andi@mailserv2.iuinc.com
Message-ID: <39920DFD.1708DC4B@fischlustig.de>
Date: Thu, 10 Aug 2000 04:05:49 +0200
From: Andreas <andi@fischlustig.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cd image does boot but console dies during kernel
 boot
References: <399207FB.3A6EBEFA@fischlustig.de> <20000810015037.226F9381A0@carmen.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>
> 2. Switch to a kernel that uses STI instead of serial.  Then you will get all
> output on the graphics console. To do this use a kernel built with
> CONFIG_STI_CONSOLE enabled.

well... it would be a good idea to put a kernel that uses STI on the ftp
server...


bye
  Andreas
