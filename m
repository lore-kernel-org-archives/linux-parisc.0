Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA29196
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Sep 2000 13:01:47 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 30 Sep 2000 19:02:24 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13fRtq-0007DC-00
	for parisc-linux@thepuffingroup.com; Sat, 30 Sep 2000 20:02:18 +0100
Date: Sat, 30 Sep 2000 20:02:18 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000930200218.A25304@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] I am not your mother!
List-ID: <linux-parisc.vger.kernel.org>


I'd really appreciate it if people would update the website when they
make changes to how something works that will be user visible.  It's not
hard; just cvs co website, make your corrections, and cvs ci.

My thanks to the people who _do_ do this already, including grant,
dhd and paul (keeping the status page up to date is rather important!).

Is there anything which can be done to make updating the website easier?
I've done my best to make it logical and easy; including getting rid
of the unusual build tool we were using and reducing the dependencies
involved in getting the page datestamp correct.  There's nothing _hard_
to do, if you know enough to write code and check it in, you can handle
the website.  So what's stopping you?

-- 
Revolutions do not require corporate support.
