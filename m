Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90B05611D
	for <parisc-linux@parisc-linux.org>; Tue, 11 Dec 2001 09:44:58 -0700 (MST)
Received: from ldl.fc.hp.com (unknown [15.1.50.190])
	by atlrel8.hp.com (Postfix) with ESMTP id 828211F9B7
	for <parisc-linux@parisc-linux.org>; Tue, 11 Dec 2001 11:44:57 -0500 (EST)
Received: from noam.fc.hp.com (noam.fc.hp.com [15.1.52.69])
	by ldl.fc.hp.com (Postfix) with ESMTP id 063464679
	for <parisc-linux@parisc-linux.org>; Tue, 11 Dec 2001 09:44:57 -0700 (MST)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.32 #1 (Debian))
	id 16Dq1Y-0002zm-00
	for <parisc-linux@parisc-linux.org>; Tue, 11 Dec 2001 09:44:56 -0700
To: parisc-linux@parisc-linux.org
Date: Tue, 11 Dec 2001 09:44:56 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16Dq1Y-0002zm-00@noam.fc.hp.com>
Subject: [parisc-linux] 2.5 kernel and CVS -- opinions?
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

It's time to start tracking the 2.5 kernel at cvs.parisc-linux.org
and there are a few different ways to do it -- I'm looking for opinions.
My favorite option at the moment is 1A.  SPEAK UP BY FRIDAY because I'll
probably make CVS changes pretty soon after that.  I'll send a
HOWTO to the mailing list after the CVS changes are made.

The first decision:

    1. Start a separate 'linux-2.5' in CVS just like 'linux' with both
       an upstream branch and a development branch.  This is more manual
       perhaps, but using 'diff' and 'patch' and having 2.4 and 2.5 trees
       checked out all the time, it can accomplish the same things as #2.

    2. Add the 2.5 upstream and development branches to CVS 'linux'.
       IMO this is the most functional and flexible -- allowing us to
       use CVS to do the myriad of interesting 'diffs'.  CVS could also
       be used to keep single versions of 2.4/2.5 pa-specific files where
       no fork is required, but that will require some developers to acquire
       additional CVS expertise so I'm not sure whether to recommend that.
       2.4-only developers would not need to change their use model.  Not
       that it's an issue, but #2 requires less CVS disk space.

The second decision:

    Date-based CVS update on the trunk is broken (bugs filed -- no
    action for a long time).  It works fine on non-trunk branches.

    A. We've lived with this defect so far, don't change anything.
       If we choose this with #2 above, the only thing on the trunk
       is 2.4 development -- 2.5 devel date-based checkout will
       work fine.  However 2.4 devel date-based checkout will work
       less often than it does now.

    B. Move everything in CVS to non-trunk branches so we can use
       date-based CVS update.  This would cause another little change
       in how we use CVS.

    Option A is even more acceptable if we do either aggressive tagging
    (for example, each -paXX release gets tagged) or keep a fairly
    large set of the daily source tarballs.  IMO tagging is the "right"
    answer, but it's pretty slow due to CVS limitation or perhaps
    we could do a daily tagging from cron so nobody'd have to wait.
