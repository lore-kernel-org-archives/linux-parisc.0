Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id PAA14032
	for <parisc-linux@sod.res.cmu.edu>; Wed, 7 Apr 1999 15:49:29 -0400
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.13.185.124])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id PAA04090
	for <parisc-linux@thepuffingroup.com>; Wed, 7 Apr 1999 15:48:59 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id MAA02778 for <parisc-linux@thepuffingroup.com>; Wed, 7 Apr 1999 12:47:26 -0700 (PDT)
Message-Id: <199904071947.MAA02778@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Qn on Linux/PA-RISC future Console driver 
In-reply-to: Your message of "Wed, 07 Apr 1999 11:05:39 PDT."
             <199904071805.LAA22267@gatekeeper.equator.com>
Date: Wed, 07 Apr 1999 12:47:20 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

>
> Hi,
> 	Has anyone done some work on Linux/PA-RISC Console driver.
> 	Are we planning to use PDC for console or is it possible
> 	to directly access Console device. 

The GSC and PCI RS-232 consoles are managed by asio0 (tty) driver.
Not clear on HP-PB (SIO driver environment - not WSIO) or graphics consoles.

grant

Grant Grundler
Enterprise Systems Technology Lab
+1.408.447.7253
