Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA12805
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Jul 2000 17:13:20 -0600
Received: from ottawa.linuxcare.com (HELO vodka.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 18 Jul 2000 23:14:52 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id SAA08743
	for parisc-linux@thepuffingroup.com; Tue, 18 Jul 2000 18:09:20 -0400
Date: Tue, 18 Jul 2000 18:09:20 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000718180920.Q3150@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] scheduling
List-ID: <linux-parisc.vger.kernel.org>


i can't seem to find any documentation on the HP website about scheduling
instructions for different processor models.  gcc currently defaults to
scheduling for the PA700 (presumably this is PCX?), and can be asked
to schedule for PA-7100, PA-7200 or PA-8000.  i'm guessing that 8200,
8500 and 8600 have slightly different scheduling requirements.

my main question is, what should we default it to?  does scheduling for
PA-8000 have a really bad effect on other CPU models?  or vice versa,
is scheduling for PA-700 a really bad choice for PA-8x00 CPUs?  i know
later PA models have all the fancy register renaming stuff in them so
it may not make much difference, but i'm curious.

-- 
Revolutions do not require corporate support.
