Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA22243
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 15:39:50 -0700
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] make Image currently fails here too. 
In-reply-to: Your message of "Wed, 01 Mar 2000 13:39:16 EST."
             <Pine.BSO.4.21.0003011338010.23746-100000@mojo.calyx.net>
Date: Wed, 01 Mar 2000 12:17:41 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12QEcv-0001s3-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= My unsatisfied symbols are different, though:
= 
= ld: Unsatisfied symbols:
=    fcacheline (code)
=    pcacheline (code)

That code doesn't get much maintenance these days.  The usual cause of
failures is that code using headers from the palinux tree which define
macros which call functions which aren't part of that boot loader.

	-P
