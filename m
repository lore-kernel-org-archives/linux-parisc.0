Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA01646
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 Nov 1999 21:37:54 -0700
Received: from [10.10.213.163] by max5.rrze.uni-erlangen.de with ESMTP for parisc-linux@thepuffingroup.com; Sat, 13 Nov 1999 05:39:22 +0100
Received: (from prumpf@localhost)
	by r (8.9.3/8.9.3) id FAA28696
	for parisc-linux@thepuffingroup.com; Sat, 13 Nov 1999 05:41:48 +0100
Date: Sat, 13 Nov 1999 05:40:47 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: parisc-linux@thepuffingroup.com
Message-Id: <19991113054047.A9492@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] keyboard adventures
List-ID: <linux-parisc.vger.kernel.org>

So, I got PS/2 keyboards pretty much working tonight.  The first major discov-
ery was the 8042-compatible chip used on i386s and most other architectures
translates the AT scancodes the keyboard sends to XT scancodes to send on to
the CPU  -  Lasi doesn't do that, but we do it in software to be able to use
i386's keymaps.

I copied large parts of pc_keyb.c in keyb_at.c which deals with AT->XT trans-
lation as well as providing the XT table interfaces so you should be able to
load keymaps aso.

SysRq seems to work well (well, SysRq-P (show regs) and SysRq-B (reboot) do),
the characters printed (-- %c --) match the key label.

I hope SysRq will be of some use in debugging some of the stuff I'm planning
to do, and we might even end up porting parts of kdb  -  so lots of fun ahead.

	Philipp Rumpf
