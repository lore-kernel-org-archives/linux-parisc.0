Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA24130
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Aug 2000 03:03:19 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 10 Aug 2000 03:03:30 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 10 Aug 2000 03:03:09 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id VAA06297
	for parisc-linux@thepuffingroup.com; Wed, 9 Aug 2000 21:58:33 -0400
Date: Wed, 9 Aug 2000 21:58:33 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000809215833.L993@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] merge with 2.4.0-testN?
List-ID: <linux-parisc.vger.kernel.org>


it's been well over 2 months since we last merged Linus' tree into ours.
i'm thinking about leaving the -test6 patch to mature over the next week
or so, see if there's any cripplingly awful bug reports and, if not,
merge -test6 into our tree.  if there are, -test4 had some good reviews,
i might consider that instead.

i'm going to tentatively set a date as Thursday 16th August for this.
if you've got any big changes outstanding, now would be an excellent
time to commit them before the landscape shifts under our feet.

-- 
Revolutions do not require corporate support.
