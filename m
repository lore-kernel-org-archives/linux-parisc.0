Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA31062
	for <parisc-linux@puffin.external.hp.com>; Fri, 20 Oct 2000 08:07:31 -0600
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id B77901319
	for <parisc-linux@thepuffingroup.com>; Fri, 20 Oct 2000 10:08:48 -0400 (EDT)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id IAA06081 for parisc-linux@thepuffingroup.com; Fri, 20 Oct 2000 08:08:48 -0600 (MDT)
Date: Fri, 20 Oct 2000 08:08:48 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200010201408.IAA06081@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Bug in shared libraries
List-ID: <linux-parisc.vger.kernel.org>


I've been chasing a bug for the last few days that I believe is
responsible for a variety of flaky VM behaviour.  It turns out that we
were missing some code in do_page_fault() that is supposed to check access
permissions before calling handle_mm_fault().  This leads to problems with
reference counts on pages being wrong, which leads to a variety of bad
problems.

I checked in new code (in arch/parisc/mm/fault.c) to fix the problem,
however, I had to enclose the actual permission check inside an #ifdef
CHECK_PERMISSIONS, because the fix cannot be enabled yet.  The problem is
that at least one shared library is writing into a read only region
(routine _dl_start in /lib/ld-2.1.94.so).  I'm afraid this looks like part
of the dynamic linker, which means that just about every command is
potentially broken.  I'm hoping that we only have to fix a few shared
libraries, and not every command, to get around this problem.  Basically,
we need to be able to successfully boot with the #ifdef CHECK_PERMISSIONS
in fault.c removed.

I'm hoping that someone who knows more about the shared library builds
can look into fixing this.

John Marvin
jsm@fc.hp.com
