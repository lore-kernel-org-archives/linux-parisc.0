Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA00307
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Jan 2001 13:26:00 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id F220F181F
	for <parisc-linux@thepuffingroup.com>; Fri, 19 Jan 2001 12:29:36 -0800 (PST)
Message-Id: <200101192031.MAA16124@milano.cup.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] palo, update to README.INSTALL 
In-reply-to: Your message of "Fri, 19 Jan 2001 11:28:43 PST."
             <E14JgHD-0003Uh-00@noam.fc.hp.com>
Date: Fri, 19 Jan 2001 12:31:29 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame wrote:
> 
> palo's command line has changed since README.INSTALL was written, so
> if you have a newer palo (for example
> ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/palo-20010118.tgz)
> please note this change.
> 
> Where README.INSTALL uses 'palo -I -k ... /dev/sda' please change it
> to 'palo -k ... -I /dev/sda' -- the -I option now requires an argument.

And need to add "console=ttyS0" parameter too!

I'm using CONFIG_SERIAL_CONSOLE on c3k:
    palo -I /dev/sda -k /boot/vmlinux -b /boot/iplboot \
         -c '3/boot/vmlinux console=ttyS0 TERM=linux HOME=/ root=/dev/sda3'

grant
