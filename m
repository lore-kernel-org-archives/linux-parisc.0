Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6487F4830
	for <parisc-linux@parisc-linux.org>; Thu, 21 Aug 2003 15:19:34 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19pwqC-0003SV-S5
	for parisc-linux@parisc-linux.org; Thu, 21 Aug 2003 22:19:32 +0100
Date: Thu, 21 Aug 2003 22:19:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030821211932.GC19630@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sym53c8xx_2 development
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

Hi.  I've got some changes for the sym53c8xx_2 driver I'm working on.
Does anyone object to me working on them in the parisc 2.6 tree?
Obviously, I'll do my best to not break anything and I'll handle any
merge problems.

We've done this kind of thing before (eg with the pcnet32 driver in 2.4)
but since every PCI-based parisc box uses sym53c8xx_2 for its scsi,
I didn't feel it was appropriate to inflict potentially-buggy changes
on everyone without a little bit of discussion.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
