Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DFCC482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Aug 2002 17:23:15 -0600 (MDT)
Received: from localhost.localdomain (beavis.ybsoft.com [10.0.0.2])
	by beavis.ybsoft.com (Postfix) with ESMTP id 196322E3D8
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Aug 2002 17:23:14 -0600 (MDT)
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 11 Aug 2002 17:23:14 -0600
Message-Id: <1029108194.637.9.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] Updated parisc-linux .cvsrc
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

Thibaut found an interesting problem today when he checked out a fresh
linux tree from cvs.  The build failed because he had an empty
scripts/cramfs directory.  I looked at my tree and did not have this
directory so the kernel would build fine for me.  Also cvs update did
not update my tree with this directory either.

Matt Taggart finally figured out that the update had the -P (prune)
option, and the checkout option did not.  Adding the -P option to the
checkout command fixed this problem.

I have updated the build-tools/cvsrc in the cvs repository that everyone
should be using ... please update if you are using cvs.

Thanks,

- Ryan
