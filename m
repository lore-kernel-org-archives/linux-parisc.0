Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 841994840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 17:50:04 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id F0C92298034
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 17:50:03 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13048-06 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 20 Nov 2003 17:50:03 -0700 (MST)
Date: Thu, 20 Nov 2003 17:50:03 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031121005003.GB13007@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] strace locks up 2.4.22-pa14
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

In trying to debug a problem with dcopserver not starting,
I tried: 
	strace -f -o /tmp/dcop.out dcopserver

This locked up the system. I could still ping the tg3 LAN (interrupts
are enabled?). But Mouse and keyboard stopped responding.
I TOC'd the system - but forgot to dump PIM on the way up.
Since it's a graphical console, I don't plan on copying down
all the info.  If anyone wants to see that, please let me know
which registers are of interest (IOAQ, gr02, gr26-23 are obvious).

grant
