Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id OAA25799
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 14:19:59 -0500
Received: from cllmail.cup.hp.com (cllmail.cup.hp.com [15.28.98.139])
	by palrel1.hp.com (8.8.6/8.8.5tis) with ESMTP id LAA27629
	for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 11:19:51 -0800 (PST)
Received: from [15.0.97.82] (cc757591.cup.hp.com [15.0.97.82]) by cllmail.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id LAA01701 for <hppa-linux@thepuffingroup.com>; Thu, 25 Mar 1999 11:19:50 -0800 (PST)
Message-Id: <199903251919.LAA01701@cllmail.cup.hp.com>
Subject: Re: [hppa-linux] syscall work
Date: Thu, 25 Mar 1999 11:23:20 -0800
From: Cary Coutant <cary@cup.hp.com>
To: <hppa-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

I'd suggest *not* using the same gateway page address as HP-UX. If you 
do, you won't be able to develop a later kernel extension to support 
HP-UX binaries, unless you allocate syscall numbers carefully.


Cary Coutant
Hewlett-Packard Co.
Application Delivery Lab
