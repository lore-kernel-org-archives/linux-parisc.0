Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D7D74829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 May 2003 00:46:32 -0600 (MDT)
Date: Wed, 28 May 2003 00:42:50 -0600
From: dann frazier <dannf@dannf.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030528064250.GA29360@dannf.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] cvs migration
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

cvs has moved to our new box (finally! hosted on a parisc-linux box!)
if you've been using the recommended cvs.parisc-linux.org name, the transition
should have been transparent, in most regards.

- anonymous access should be transparent.
- ssh users that weren't part of willy's list of recent committers will need
  to request their account be reactivated.
- ssh users will see that the host key has changed.
- you may get errors until dns propogation has completed
- non-cvs accounts from dsl2 have not migrated to palinux, nor have home
  directories.  home directories should be migrated by hand.
- bame: your cronjobs that access cvs will likely break - sorry for the lack
  of warning.

please let me know if you notice other breakages (i'm not on this list).

-- 

dannf@dannf.org 
