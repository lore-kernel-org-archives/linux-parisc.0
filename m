Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id NAA07481
	for <hppa-linux@sod.res.cmu.edu>; Mon, 22 Mar 1999 13:57:00 -0500
Received: from srmail.sr.hp.com (srmail.sr.hp.com [15.4.45.14])
	by palrel1.hp.com (8.8.6/8.8.5tis) with ESMTP id KAA23212
	for <hppa-linux@thepuffingroup.com>; Mon, 22 Mar 1999 10:56:50 -0800 (PST)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id KAA04931 for hppa-linux@thepuffingroup.com; Mon, 22 Mar 1999 10:56:37 -0800 (PST)
Message-Id: <199903221856.KAA04931@meow.sr.hp.com>
To: hppa-linux@thepuffingroup.com
Date: Mon, 22 Mar 1999 10:56:37 -0800 (PST)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [hppa-linux] Document Priority?
List-ID: <linux-parisc.vger.kernel.org>

Hello,
	I'm currently digging around, looking under rocks, and digging
up old documents that we eventually hope to clean up and release as
part of HPs support for this project.

	Does anyone have particular machines/chips/subassemblies that
they are desperate for documentation on?  I've been working on "LASI"
which is the I/O subsystem for the 712 (and pretty much all 7100LC, 
7300LC, 7200, 8000, 8200 based computers).  I'm currently digging for
I/O docs for the earlier machines like the 720/730 adn early 715s.

	I just got source code for the PA7100LC processor ERS that I need
to go through and make suitable for release to the world.  It for
example has details on the hardware TLB miss handler.  Would this
be a priority given today's discussion of TLBs?

	Perhaps the biggest challenge is resurrecting appropriate versions
of TROFF and TeX to process these things.

	What output format should I generate? PostScript? PDF? PCL?

	-Bill Katz
