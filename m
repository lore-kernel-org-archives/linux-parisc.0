Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fepB.post.tele.dk (fepB.post.tele.dk [195.41.46.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58556482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Feb 2002 05:53:01 -0700 (MST)
Received: from psy.bronderslev.dk ([80.62.41.165]) by fepB.post.tele.dk
          (InterMail vM.4.01.03.23 201-229-121-123-20010418) with ESMTP
          id <20020211125258.WWI22989.fepB.post.tele.dk@psy.bronderslev.dk>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 11 Feb 2002 13:52:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by psy.bronderslev.dk (Postfix) with ESMTP id CFE63EC7A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Feb 2002 13:52:56 +0100 (GMT-1)
Date: Mon, 11 Feb 2002 13:52:56 +0100 (GMT-1)
From: Bent Wagner <psy@tdcadsl.dk>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0202111333350.2647-100000@psy.bronderslev.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] hp100 freezes machine
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

Hi there

I have a 9000/725-100 with a EISA netcard.

When i boot the system the card is detected and reported as
a HP J2577 on ETH0. It also tells me that the 10Mbit plug is
used, which is correct.

At the moment the network configuration is turned off when
booting.

When i try to issue a  ifconfig eth0 172.16.154 netmask 255.255.0.0
the machine freezes completely. The keyboard and the power button
and the TOC button does not work.
I have to yank the powercord to kill it.

When i configure the loopback interface there are no problem.
When i configure the builtin ETH1 it reports a tranceiver problem.
I have no tranceiver for this machine.

Kernel is 2.4.17-20


Am i doing something wrong?

Greetings

Bent Wagner
