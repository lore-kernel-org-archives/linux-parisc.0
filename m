Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ex1.ncsa.uiuc.edu (ex1.ncsa.uiuc.edu [141.142.2.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48009482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Sep 2001 13:02:22 -0600 (MDT)
Received: from mx1.ncsa.uiuc.edu (mx1.ncsa.uiuc.edu [141.142.2.8])
	by ex1.ncsa.uiuc.edu (8.11.6/8.11.0) with ESMTP id f86J2KU22359
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Sep 2001 14:02:20 -0500 (CDT)
Received: from osage.ncsa.uiuc.edu (osage.ncsa.uiuc.edu [141.142.2.56])
	by mx1.ncsa.uiuc.edu (8.11.6/8.11.0) with ESMTP id f86J2KT28439
	for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Sep 2001 14:02:20 -0500 (CDT)
Date: Thu, 6 Sep 2001 14:02:20 -0500 (CDT)
From: Galen Arnold <arnoldg@ncsa.uiuc.edu>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0109061359230.530-100000@osage.ncsa.uiuc.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] smp kernel hangs during boot on L2000...
List-ID: <linux-parisc.vger.kernel.org>

I've built the latest kernel (downloaded this morning) and am trying to
boot it on an L2000 with smp supported (64 bit also).

The kernel hangs immediately and the last line printed is:

	branching to kernel entry point 0x00100000

Has anyone got an SMP kernel running on their L2000, and if so, could you
send me your .config and palo.conf for comparison?

-Galen Arnold

-- 
+
Galen Arnold, system engineer--systems group       arnoldg@ncsa.uiuc.edu
National Center for Supercomputing Applications           (217) 244-3473
152 Computer Applications Bldg., 605 E. Spfld. Ave., Champaign, IL 61820
