Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA25229
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Nov 2000 05:27:47 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 22 Nov 2000 12:29:53 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA06116
	for <parisc-linux@thepuffingroup.com>; Wed, 22 Nov 2000 23:28:45 +1100
Date: Wed, 22 Nov 2000 23:28:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0011222319230.16860-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] binutils update
List-ID: <linux-parisc.vger.kernel.org>

I've just committed a change to binutils that cures an ELF spec violation.
We now no longer create plabels for DT_INIT and DT_FINI and instead rely
on the dynamic linker to create them for us.  This means you need an
updated glibc, that I committed a little earlier today, to create the
plabel function pointers if you update your binutils.

You have been warned...

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
