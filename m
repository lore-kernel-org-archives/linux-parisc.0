Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA09996
	for <parisc-linux@puffin.external.hp.com>; Sat, 25 Mar 2000 14:30:34 -0700
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Success story on 715/33 and a question 
In-reply-to: Your message of "Fri, 24 Mar 2000 04:15:39 PST."
             <20000324121539.21840.qmail@web502.mail.yahoo.com>
Date: Sat, 25 Mar 2000 13:29:26 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12YxBW-0001ge-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= So now I am trying to do something useful :) with that
= booted kernel. I would like to mount the proc
= filesystem. I am using a very old ramdisk image
= (19991108) because I had trouble with the newer images
= on the 715/33 (no network driver).

You might want to remove bootp, nfs root, and the network
drivers from your .config.

	-Paul Bame
