Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FF34482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Aug 2001 22:04:37 -0600 (MDT)
Received: from security.hp.com (cranston.fc.hp.com [15.1.44.224])
	by atlrel6.hp.com (Postfix) with ESMTP id 795751F5EF
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 00:04:36 -0400 (EDT)
To: parisc-linux@lists.parisc-linux.org
From: LaMont Jones <lamont@hp.com>
Cc: LaMont Jones <lamont@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 01 Aug 2001 22:04:34 -0600
Sender: lamont@hp.com
Message-Id: <20010802040435.818241872C@security.hp.com>
Subject: [parisc-linux] libqthreads and hppa-linux
List-ID: <linux-parisc.vger.kernel.org>

I started to play with getting the hppa assembly code in guile-core to work
on pa-linux, but ran into challenges with %farg[0-3], which aren't defined
by the assembler...

I'm about to upload a source NMU of guile-core, which has qt/md/hppa*-linux.?
in it.  If someone wanted to take that the rest of the way, I'd be happy to
upload it...

lamont
