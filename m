Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1B4C483E
	for <parisc-linux@parisc-linux.org>; Sat, 27 Sep 2003 21:38:49 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3SOW-0001H7-UL; Sun, 28 Sep 2003 04:38:48 +0100
Date: Sun, 28 Sep 2003 04:38:48 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Bame <bame@riverrock.org>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20030928033848.GD24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs-snapshot problem discovered
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

OK, think I have it figured out.  I experimented on
arch/parisc/vmlinux.lds.S since I know both we & Linus removed it.
The version in the linux-2.6.0-test6/_cvs-snapshot-linux-2.6/linux-2.6
tree was cvs revision 1.3 which was the same one tagged with the `linus'
symbolic tag.  Version 1.4 was where we deleted it, but the linus tag
never got moved (presumably because cvs tag -F won't move a tag to a
deleted revision).  So cvs up -rlinus still gets deleted files.

How to fix this?  I'm not at all sure.  I think there's an interesting
question about whether a deleted file should have no linus tag or a
linus tag on the deleted revision.

I'm going to go ahead and merge the 2.6.0-test6 upstream into the trunk
since there's nothing wrong with what's checked in (as long as I don't
try to use the `linus' tag for anything).

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
