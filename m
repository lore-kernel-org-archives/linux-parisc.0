Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C39BC482E
	for <parisc-linux@parisc-linux.org>; Sat, 23 Aug 2003 08:22:00 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19qZHD-00006Q-QK
	for parisc-linux@parisc-linux.org; Sat, 23 Aug 2003 15:21:59 +0100
Date: Sat, 23 Aug 2003 15:21:59 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030823142159.GM18834@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CVS mixups
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

So... for the second time I messed up and committed 2.6 to the 2.4 tree.
In my defence, this time we were trying the new style of imports so it's
not too surprising I got something wrong (and nobody spotted the problem
till too late...), but twice is too many.

Short term fix: I'm going to merge the latest marcelo patch into our
2.4 tree today.  Looks like that'll be 2.4.22-rc2.  That'll fix this
cvs diff autogeneration breakage.

Long term fix: I'm going to rename the linux tree to linux-2.4.  This will
cause some disruption since everyone with a cvs tree checked out will have
to mangle it to work again.  I'll make a script available in build-tools
to mangle your tree for you.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
