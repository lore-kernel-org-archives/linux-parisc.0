Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id E363B482C
	for <parisc-linux@parisc-linux.org>; Fri,  9 Nov 2001 16:38:19 -0700 (MST)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA08146
	for <parisc-linux@parisc-linux.org>; Fri, 9 Nov 2001 16:38:14 -0700
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m162LDy-000PwmC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Fri, 9 Nov 2001 16:38:14 -0700 (MST)
Message-Id: <m162LDy-000PwmC@bame.riverrock.org>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
To: parisc-linux@parisc-linux.org
Date: Fri, 09 Nov 2001 16:38:14 -0700
Subject: [parisc-linux] Merged 2.4.14
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

willy, Fleedwood, and I committed an initial merge of 2.4.14
to CVS.  IT HAS NOT BEEN TESTED.  If you need a good version
use the tag V249_PA79 or LINUS_2414_PREMERGE which are probably identical.
Fix bugs, have fun :-)

For drivers/net/pcnet32.c we adopted upstream which probably isn't
right (helge?)

	-Paul Bame
