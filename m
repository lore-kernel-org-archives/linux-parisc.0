Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB4504A18
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Jan 2001 19:11:30 -0700 (MST)
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id TAA24173
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 19:07:25 -0700
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id 9A224192B
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 20:04:45 -0500 (EST)
Received: from hp.com (hazel.fc.hp.com [15.1.52.8])
	by ldl.fc.hp.com (Postfix) with ESMTP id 26E755A963
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 18:00:46 -0700 (MST)
Sender: dafra@ldl.fc.hp.com
Message-ID: <3A77652A.7CD6D5D8@hp.com>
Date: Tue, 30 Jan 2001 18:06:50 -0700
From: dann frazier <daniel_frazier@hp.com>
MIME-Version: 1.0
To: parisc-linux@puffin.external.hp.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] list migration & bug tracking system
List-ID: <linux-parisc.vger.kernel.org>

hey,

We now have a bug tracking system at:
http://bugs.parisc-linux.org/
The BTS is based on the debbugs package, Debian's BTS.

If you're not familiar w/ debbugs, see that page for documentation.

maintainer messages will be sent to corresponding lists on:
http://lists.parisc-linux.org
You can request a copy of the maintainers file through the BTS, as well
as view it online at http://bugs.parisc-linux.org/packages.html

we have moved the mailing lists and archives over to Mailman on a
different machine.  the switch should have been near-transparent.  you
can still send mail to puffinl.external, but lists.parisc-linux.org is
the preferred host.

You can subscribe and/or unsubscribe from all lists at once at:
http://lists.parisc-linux.org/bulksubscribe.html

You can now use htdig to search the list archives at:
http://lists.parisc-linux.org/search.html

please file bugs against the packages "bts" or "lists" if you run across
any problems or have any suggestions.
	-dann
-- 
---------------------------
dann frazier
Hewlett-Packard
Linux Development Lab
daniel_frazier@hp.com
(970) 898-0800
