Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tpol.peak.org (unknown [198.88.144.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id B20CC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 20:47:45 -0700 (MST)
Date: Mon, 14 Jan 2002 19:47:43 -0800
From: Allen Brown <abrown@peak.org>
Message-Id: <200201150347.g0F3lh129546@tpol.peak.org>
To: collver@linuxfreemail.com, lug@peak.org,
	parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: [lug] serial breakout box
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

The breakout box is probably most convenient.  I've never had access
to one.  But the first thing you need to determine is if you need
to crossover or not.  You can do that with just a voltmeter.

Pin 7 is GND.  Pins 2 and 3 are the input and outputs, not necessarily
in that order.  Measure from 7 to 2.  Measure from 7 to 3.  One
of them will be close to 0V.  The other will be much higher.  I think
-10V or something like that.  The pin with the higher voltage is
the output.

Do the same thing on the other system also using the 25 pin connector.
Then make sure you are not connecting the output to the output.
--
Allen Brown
  work: Agilent Technologies      non-work: http://www.peak.org/~abrown/
        allen_brown@agilent.com	            abrown@peak.org
  Where are we going? And what's with this hand basket? --- George Carlin
