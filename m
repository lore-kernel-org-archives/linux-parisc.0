Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id TAA06157
	for <hppa-linux@sod.res.cmu.edu>; Wed, 24 Mar 1999 19:52:24 -0500
Received: from america.net (buggz@tnt1-243.america.net [206.67.248.243])
	by smtp.america.net (8.9.1/8.9.1) with ESMTP id TAA14095
	for <hppa-linux@thepuffingroup.com>; Wed, 24 Mar 1999 19:52:01 -0500 (EST)
Sender: buggz@smtp.america.net
Message-ID: <36F98997.130DE72A@america.net>
Date: Wed, 24 Mar 1999 19:55:52 -0500
From: Ed June <buggz@america.net>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
References: <199903242116.NAA25002@gatekeeper.equator.com>
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] the cvs thingy
List-ID: <linux-parisc.vger.kernel.org>

>

Hmm, am I doing this correct ?

$ export CVSROOT=':pserver:anonymous@sod.res.cmu.edu:/home/cvs/hppa'
$ cvs login
(Logging in to anonymous@sod.res.cmu.edu)
CVS password:
$ cvs -z3 checkout hppa-linux
cvs server: cannot find module `hppa-linux' - ignored
cvs [checkout aborted]: cannot expand modules


--

 Ed June

 buggz@america.net
 Linux: An open choice for free people worldwide.
