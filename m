Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe32.law4.hotmail.com [216.33.148.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED257482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Apr 2002 07:42:41 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Mon, 29 Apr 2002 15:38:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE32NqFJ3sl3xbYiMCI00001250@hotmail.com>
Subject: [parisc-linux] Problems with hardware clock
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

Hi,

When I first booted my 712/60, that was a few months ago, it was running
some old HP-UX version. Also, the clock was running 7 years behind. After
upgrading my box to Linux I tried to set this clock to a more recent point
in time. No luck however, the date command is -for some reason- not working
for me. So I'm using this workaround to set my clock:
hwclock --set --date="04/29/2002 15:22:00", then hwclock --hctosys.
The problem is that the system does not appear to keep track of time when
it's powered off.
So if I shutdown the system, today at 18h00, the date will still be
04/29/2002 - 18h00 if I boot the system tomorrow. Sometimes the date is
reset to 1970. Currently I'm using NTP to bypass this issue.

Any ideas why this is happening? Could it be that some battery is dead?
(According to this site my box should be Y2K compliant:
http://www.wagoneers.com/UNIX/HP-UX/Y2k.html)


Thanks.

Kenneth
