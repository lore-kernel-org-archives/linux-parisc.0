Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA32357
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Mar 2000 15:38:33 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel1.hp.com (Postfix) with ESMTP id 0B29C39D
	for <parisc-linux@thepuffingroup.com>; Tue, 21 Mar 2000 13:40:03 -0800 (PST)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PALO and ramdisk micro-howto 
In-reply-to: Your message of "Tue, 21 Mar 2000 10:44:58 MST."
             <E12XSiA-00022u-00@endor.fc.hp.com>
Date: Tue, 21 Mar 2000 14:40:02 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12XWNe-0002YK-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


= I tried both the old ramdisk, and I turned willy's nfsroot into a
                                             ^^^^^ mkp's
= ramdisk, and both booted and loaded but died with that
= 'Kernel panic: Attempted to kill init!' message.  Looks like sash is
= being started with some args it doesn't like and exiting with a usage
= message.

Fixed by new palo/ipl.c
