Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03241
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 09:55:18 -0600
From: Ulrich.Strelow@schering.de
Received: from fw-wiss.schering.de (be2314.schering.de [149.234.1.29])
	by be3334.schering.de (8.9.1/8.9.1) with SMTP id RAA06145
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Jun 1999 17:55:17 +0200 (MET DST)
To: parisc-linux@thepuffingroup.com
Message-ID: <C125679B.00577445.00@BE2314.schering.de>
Date: Fri, 25 Jun 1999 17:55:04 +0200
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] make dep not working on HP-UX
List-ID: <linux-parisc.vger.kernel.org>



I have had a similar problem on our production HP-UX systems. Running ls *
on a directory with a lot of files gives
ksh: /usr/bin/ls: arg list too long

To solve this problem you need to set the HP-UX kernel parameter
large_ncargs_enabled  1
and rebuild the HP-UX kernel.

Here is the information from HP Electronic Support Center:

Problem Description

What is the impact of changing the kernel parameter
"large_ncargs_enabled" from 0 to 1?

What is the meaning of this parameter?

Configuration Info

Operating System - HPUX
Version-
Hardware System - HP 9000
Series -

Solution
When large_ncargs_enabled is set to "1", it increases the default
"environment size" (the memory set aside to be your login
environment - to hold your PATH variable, etc.) from 20478 to
2048000. SAM doesn't have any info about this parm or any max/minvalue.

If you have been having trouble using an "rm *" on really big
directories (it was running out of environment space), the command
will work when you set it to 1.  Regarding system performance, it
will eat up extra memory (2 M vs. 20 K), but if you don't have too
many users and you have plenty of RAM, it shouldn't be a problem.

Ulrich
---------------------------------------------
Ulrich Strelow
<ulrich.strelow@schering.de or
ulrich_strelow@yahoo.com>
Berlin, Germany
