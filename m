Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22676484B
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Mar 2004 00:29:02 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1AzshD-0001J4-00 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 07 Mar 2004 02:27:35 -0500
Date: Sun, 7 Mar 2004 02:27:35 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040307072733.GL963@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Sleepy, EWOULDBLOCK != EAGAIN?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


pa,

Please remind me why we don't make EWOULDBLOCK == EAGAIN?
I know it would break our existing ABI, but Linux apps expect them to be
the same. I remember vaguely some argument about hpux compatibility...
I'm sleepy, but I thought I'd post so I don't forget.

I'm reminded of this because update-menus is complaining about locks
during a recent 712/100 install, and it all came flooding back.

c.
