Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA19585
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Aug 2000 12:54:56 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 28 Aug 2000 18:54:47 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 28 Aug 2000 18:54:43 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id NAA17928
	for parisc-linux@thepuffingroup.com; Mon, 28 Aug 2000 13:49:46 -0400
Date: Mon, 28 Aug 2000 13:49:46 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000828134946.A17888@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] glibc configuration problem
List-ID: <linux-parisc.vger.kernel.org>


anyone trying to configure glibc on a debian potato box is probably
going to get:

checking for make... make
checking version of make... 3.78.1, bad
...
configure: error:
*** Some critical program is missing or too old.

this is an upstream change to glibc.  to fix this, get make 3.79.1 from
woody.  It doesn't have any dependencies which require you to upgrade
any other package.

-- 
Revolutions do not require corporate support.
