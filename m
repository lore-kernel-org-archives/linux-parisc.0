Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA29113
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 11:59:26 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 13 Dec 2000 18:50:12 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 13 Dec 2000 18:49:52 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A37C561.48BD88F5@linuxcare.com>
Date: Wed, 13 Dec 2000 13:52:17 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] WAX, Harmony and SuperIO
List-ID: <linux-parisc.vger.kernel.org>


Just an update on three device drivers I'm vaguely working on.

I'm actually up for working on other various drivers, and am taking
requests.  I do have quite a variety of hardware to test on.

1. Harmony, the sound driver

Definitely some problems here, most are already documented but one
notable one is that the sound chip on a 715/75 doesn't appear to be
Harmony at all.  Does anyone by chance know what this is?

2. WAX

First off, many many thanks to Mike Hibler for finding his WAX docs.  To
make a long story short, I will soon have access under NDA to the WAX
ERS and will have some Christmas time to hack on WAX.  Thanks go to Alan
Meyer for the internal work at HP as well.

3. SuperIO

I made an unsuccessful attempt to understand how SuperIO (the funky IO
controller in C3k and J5k) PCI interrupts work.  I'm inheriting a bunch
of code and info from Martin Petersen, and we all agree we need some
help from someone at HP (hi Grant!) to help us.  This'll probably have
to stay on the back burner until January 2001.

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
