Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA30101
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Aug 2000 16:49:00 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 24 Aug 2000 22:48:55 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 24 Aug 2000 22:48:21 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id RAA01492
	for parisc-linux@thepuffingroup.com; Thu, 24 Aug 2000 17:43:56 -0400
Date: Thu, 24 Aug 2000 17:43:56 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000824174356.K29677@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Testing CPU detection
List-ID: <linux-parisc.vger.kernel.org>


Hi.

With some of the changes that have gone into the tree over the past week,
it is now important that we get CPU detection correct.  So I took the
tables from the HWDB which are a lot more accurate than the ones which
were in the kernel before and built a new kernel using them.

I would be very obliged if people would boot the kernel which I've put up
at ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-testcpu
and mail me (don't cc the list, please) the line which starts:

CPU might be a

It's fine on an A180 -- reports `PA7300LC (PCX-L2)'.  I want to know
what other machines get.  Thanks in advance to everyone who tests this
because I expect to be overwhelmed by mail from this :-).  Once I have
a reasonable sample, I'll check the code in.

Oh -- just remembered.  PA8600 (PCX-W+) processors aren't in this table.
people with J5600s will have to wait a few hours.

-- 
Revolutions do not require corporate support.
