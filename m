Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA25439
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 11:01:20 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Jul 2000 17:02:47 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13C3PZ-00046H-00
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Jul 2000 13:01:33 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Jul 2000 13:01:31 -0400
Message-ID: <87ya38a9ec.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GCC troubles over
List-ID: <linux-parisc.vger.kernel.org>

Okay, my brief flirtation with 'long double' support is over, and GCC
appears to compile and work again for 32- and 64-bit targets (i.e. it
compiles, and it builds glibc).

Now would be a good time to update your CVS trees.

Sorry about that folks.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
