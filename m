Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA18330
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 00:03:10 -0700
Received: (from phil@localhost)
	by moiraine.off.net (8.9.3/8.9.3) id VAA04186
	for parisc-linux@thepuffingroup.com; Mon, 7 Feb 2000 21:47:41 -0800
Date: Mon, 7 Feb 2000 21:47:41 -0800
From: Phil Schwan <phil@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000207214741.A4108@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CVS commit messages
List-ID: <linux-parisc.vger.kernel.org>

I put some scripts in place (thanks OpenBSD!) that nicely coalesce cvs
commit messages into one message (instead of a commit message for
every directory that had a changed file).

Since this obsoletes the parisc-linux-cvs-digest value of 10 minutes
(which was put in place to do the same thing), I've increased the
parisc-linux-cvs-digest maximum time to one day; people who want the
old behaviour should switch to parisc-linux-cvs, and people who would
rather have one message per day should stay on -digest.

-Phil

-- 
Phil Schwan, Senior Linux Consultant, Linuxcare, Inc.
415.354.4878 x271 tel, 415.701.7457 fax
pschwan@linuxcare.com http://www.linuxcare.com/
Linuxcare.  Support for the revolution.
