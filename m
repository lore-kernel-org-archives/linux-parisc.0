Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ex1.ncsa.uiuc.edu (ex1.ncsa.uiuc.edu [141.142.2.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A381482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 13:44:17 -0600 (MDT)
Date: Thu, 6 Sep 2001 14:44:14 -0500 (CDT)
From: Galen Arnold <arnoldg@ncsa.uiuc.edu>
To: Matthew Wilcox <willy@debian.org>
Cc: Mike Pflugmacher <mikep@ncsa.uiuc.edu>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] smp kernel hangs during boot on L2000...
In-Reply-To: <20010906201033.H316@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.33.0109061441100.530-100000@osage.ncsa.uiuc.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Matthew,

Thanks for the tip.  My L2000 box is hanging here with the smp 64bit
kernel I've built:

CPU(s): 2 x PA8600 (PCX-W+) at 540.000000 MHz
Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Initialized PDC Console for debu
                                ^^^^^hangs right there...

-Galen

-- 
+
Galen Arnold, system engineer--systems group       arnoldg@ncsa.uiuc.edu
National Center for Supercomputing Applications           (217) 244-3473
152 Computer Applications Bldg., 605 E. Spfld. Ave., Champaign, IL 61820
