Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A7E24831
	for <parisc-linux@parisc-linux.org>; Fri, 29 Nov 2002 12:03:42 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18HqQL-0005hK-00
	for parisc-linux@parisc-linux.org; Fri, 29 Nov 2002 19:03:37 +0000
Date: Fri, 29 Nov 2002 19:03:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021129190337.W1586@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2.5 status update 2002-11-29
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

We've merged 2.5.50 into our tree.  It boots on an A500 (uniprocessor)
and compiles for most common configurations.  Userspace apps still crash
a lot.  Our diff vs Linus' tree is 536k, which seems like a lot, except
that it was around 2.7MB in the 2.5.44 timeframe.  It compresses down to
about 130k which is comparable with other architectures.

For the curious, this is how it breaks down:

parisc-hil.diff  167064
parisc-misc.diff  46402
parisc-ps2.diff   60152
parisc-scsi.diff  44026
parisc-sti.diff  162164

I'm hoping Linus will take parisc-ps2.diff & parisc-misc.diff soon.
Rusty's promised to fix the module situation.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
