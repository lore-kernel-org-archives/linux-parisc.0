Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA20830
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jan 2000 20:31:23 -0700
Date: Wed, 12 Jan 2000 04:33:25 +0100
From: Philipp Rumpf <prumpf@mkp.net>
To: parisc-linux@thepuffingroup.com
Cc: willy@thepuffingroup.com
Message-ID: <20000112043325.A18348@tux.mkp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] C360 shellprompt
List-ID: <linux-parisc.vger.kernel.org>

Just so you all know, we get to a shell prompt on the C360 after the
changes which I'm about to commit (blame slow dialup lines).  I would
like to know whether we get to a prompt on other PA2.0 machines as well.

When testing, please keep in mind most "kernel doesn't print anytihng"
problems are problems in the .config rather than kernel bugs.  Start
with the defconfig and modify as little as possible.  Also, the most
likely cause for non-reproducible failures is page colouring problems
so try 3-4 times.

Anyway, on Lasi-based machines such as the C360 you should be able to
do anything you can do on the 712 right now (-ls, fork() but not exec(),
rebooting the machine with SysRq-B), just a lot faster.

	Philipp Rumpf
