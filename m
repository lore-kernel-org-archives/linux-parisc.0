Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA29429
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Apr 2000 14:52:52 -0600
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id RAA16181
	for parisc-linux@thepuffingroup.com; Thu, 13 Apr 2000 17:52:52 -0400
Date: Thu, 13 Apr 2000 17:52:51 -0400
To: parisc-linux@thepuffingroup.com
Message-ID: <20000413175251.B15697@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CVS info
List-ID: <linux-parisc.vger.kernel.org>


Some people see their commits turning up attributed to `CVSD <cvs@pehc>'.
This is because their CVS/Root file contains the anonymous check-out string;
:pserver:puffin.external.hp.com:/home/cvs/parisc.
You should do the following (assuming you're running bash):

export CVSROOT=:ext:YOUR_USER_NAME@puffin.external.hp.com:/home/cvs/parisc
for i in `find linux-2.3 -name Root`; do echo $CVSROOT >$i; done

and your future commit messages will come from you.  I'd send this message
to the people who're doing it directly, but I have no idea who you are :-)
