Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA12612
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 12:11:33 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp
	id <m14JKVR-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Thu, 18 Jan 2001 12:13:57 -0700 (MST)
Message-Id: <m14JKVR-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: "Phillip D. Beal" <pdbeal@louisville.edu>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] NFS Root / System
In-reply-to: Your message of "Thu, 18 Jan 2001 13:53:21 EST."
             <20010118135321.A113814@athena.louisville.edu>
Date: Thu, 18 Jan 2001 12:13:57 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= Hey,
= 
= Is there a new version of the NFS root system?  The latest I've found
= was by stealing the filesystem from the palo-0.5 cd image, and before
= that was from 20000915, I think....   Also, does anyone know where I can
= find apt-get for binary-hppa?  Or the source to attempt to compile it?

There's no newer NFS root right now, though a new one is probably
coming.  I've mostly been updating using the .debs at
ftp://puffin.external.hp.com/pub/ including the apt-get one.

Please be aware that we will likely totally break binary compatibility
someday, and may not have a user-friendly upgrade path :-)

	-P
