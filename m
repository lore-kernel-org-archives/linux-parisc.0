Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA17580
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Feb 2000 12:13:25 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (Postfix) with ESMTP id F0EEB22D7
	for <parisc-linux@thepuffingroup.com>; Tue,  1 Feb 2000 10:14:24 -0800 (PST)
Message-Id: <200002011814.KAA04656@milano.cup.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Lan configuration failures 
In-reply-to: Your message of "Tue, 01 Feb 2000 01:03:45 PST."
             <200002010803.BAA10229@udlkern.fc.hp.com>
Date: Tue, 01 Feb 2000 10:14:50 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
> Today some people have seen a couple of failures using the new ram disk
> that willy generated. This new ram disk contains a program that tries
> to configure a network card.  I have tracked down the problems, and
> found them to both be configuration related:
> 
>     1) First, you must have CONFIG_INET set. If you don't, the socket
>     call will fail, and you will get a "Bad file number" failure,
>     due to the code trying to do an ioctl call on the -1 returned
>     from the socket call failure.
...

John,
I found out Mathew Wilcox (bless his soul) changed parisc/config.in
on Saturday (1/29/2000) so CONFIG_INET (and everything else needed
for an A180) is enabled by default.
Basically, I needed to cvs update/rm .config/make oldconfig/...

thanks
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
