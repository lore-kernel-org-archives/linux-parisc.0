Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tandu.perlsupport.com (tandu.perlsupport.com [66.220.6.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64C70482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jul 2003 09:49:45 -0600 (MDT)
Date: Fri, 25 Jul 2003 11:49:23 -0400
From: Chip Salzenberg <chip@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org, 201873-done@bugs.debian.org
Message-ID: <20030725154923.GR2287@perlsupport.com>
References: <3F1CEEEE000003DF@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F1CEEEE000003DF@ocpmta8.freegates.net>
Subject: [parisc-linux] Re: Bug#201873: nfs-kernel-server: can't use nfs ...
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

According to Joel Soete:
> dmesg informe me that rpc.mountd do_page_fault() at this very moment

This is almost certainly the use-of-freed-memory bug that many people
suffered from in 1.0.3-1.

I have already uploaded 1.0.5-1, which fixes this bug, so I'm closing
this bug report.  If your problem continues to occur (which I strongly
doubt it will), please submit a new bug.

Thanks for the bug report.
-- 
Chip Salzenberg               - a.k.a. -               <chip@pobox.com>
"I wanted to play hopscotch with the impenetrable mystery of existence,
    but he stepped in a wormhole and had to go in early."  // MST3K
