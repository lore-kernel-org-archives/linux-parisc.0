Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7C2C482D
	for <parisc-linux@parisc-linux.org>; Wed, 14 May 2003 15:58:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19G4Gv-0002vx-Fo
	for parisc-linux@parisc-linux.org; Wed, 14 May 2003 22:58:49 +0100
Date: Wed, 14 May 2003 22:58:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030514215849.GK6859@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sym53c8xx.c
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

The sym53c8xx driver is near to being removed from 2.6.  Can anyone think
of a situation where we might still want it?  I'm concerned that maybe
some of the fixes didn't go into the sym53c8xx_2 driver.  In particular,
I'd like to know that the sym53c8xx_2 driver in 2.5 works on C3k (wide &
narrow!) and A500.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
