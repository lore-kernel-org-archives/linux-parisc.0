Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B0FA4893
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Aug 2003 14:34:14 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308182034.QAA13970@hiauly3.hia.nrc.ca>
To: christoph.plattner@gmx.at
Date: Mon, 18 Aug 2003 16:34:11 -0400 (EDT)
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Apollo 9000 power problem
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

Christoph,

I saw your recent note on power supply problems.  It looks like
my 735(730) has suffered a similar failure in the recent blackout.
The symptoms appear similar to what you described a a couple of
years ago.  On power up, leds flash for 100-200 ms and then all
go out.

Did you replace the failed capacitor?  Adding a resistor between
the +Vaux line and the current sense line to compensate for leakage
between the -12V line and the current sense line seems like a
bit of a hack.

Do you have docs for the supply?

Dave
