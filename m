Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01DFC482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 08:32:49 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 42FA5B00D; Fri,  6 Jul 2001 15:32:02 +0100 (BST)
Date: Fri, 6 Jul 2001 15:32:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010706153202.Y23509@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sticon problems
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I've noticed two problems installing with sticon (not stifb),
on a B180.

First, cfdisk is supposed to show a highlighted bar over the
current partition on its main display.  It does not, so it
is difficult to know which partition you are working on.

Second, tasksel gives no indication at all which box is
active; it is only by toggling selections on and off that you
can work out where the cursor is.

I know there are limitations with the sti console, but it would
be nice if we could somehow translate attributes such that these
areas of the install worked better.

Richard
