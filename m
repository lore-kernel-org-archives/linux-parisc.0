Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from 12-225-100-78.client.attbi.com (12-225-100-78.client.attbi.com [12.225.100.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91F08482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 14:30:37 -0700 (MST)
Date: Mon, 14 Jan 2002 13:33:48 -0800
From: collver@linuxfreemail.com
To: lug@peak.org, parisc-linux@lists.parisc-linux.org
Message-ID: <20020114133347.B1367@glen.takilma.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] serial breakout box
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

Hello,

I installed Debian on a pa-risc workstation.  Linux doesn't support the HIL
mouse, so I tried a serial mouse.  The serial port on the workstation seems
different: is 25 pin female (as opposed to male like a PC).  I can log into
the system through the serial port using Kermit.  But I must first set
carrier-watch off.  I am pretty sure my cable is right.  This leads me to
believe the serial port works, but that there is something unusual about it.

The serial mouse works fine going through a 9pin-25pin adapter to a PC
running Linux.  But it doesn't work at all going through the same adapter
(plus a gender changer) to the hp workstation.  I have also tried going
through a normal serial cable (to cross over transmit and receive),
with no luck.

Does anyone here have a rs232 breakout box they would be willing to loan
(or possibly sell) me?  I am interested in making this serial mouse work.
I would also be grateful for any tips from someone more experienced with
this hardware.

Thanks,

Ben

ps.
This is an Apollo 400 which has been upgraded to a 715T/50 (Trailways-50).
