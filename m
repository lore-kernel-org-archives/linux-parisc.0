Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49AF5482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Nov 2001 15:36:02 -0700 (MST)
Received: from old@istop (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with SMTP id E5E1717030
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Nov 2001 17:37:43 -0500 (EST)
Message-Id: <3.0.5.32.20011121173555.01928d40@mail.magma.ca>
Date: Wed, 21 Nov 2001 17:35:55 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] My C200 situation
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

OK, I was sidetracked for a few days but I'm back with news on the C200.

I got the cross-compile stuff for my Thunderbird Linux machine, got the
latest snapshot of the source and made a change in
drivers/video/sti/sticore.c to reverse the #if 1 to #if 0 and compiled. The
FX4 works with the exception of a short period during the startup where the
"Tux" logo would be displayed (at least I think this is the place!) the
screen switches to text on a set of 4 stripes - blue, black, blue then
black (quite broad vertical stripes) but then reverts back to the plain
black mode without the logo. Otherwise it seems to work.

Does that mean that stifb is up on the FX4??
What about X then?

I haven't yet dug into the code yet but I'm not too sure I could divine the
cause. Any hints or tips???

By the way, I also tried a 64-bit kernel 2.4.14pa6 which did not do
anything I could see after setting the w-bit in the processor status
register (went to 64-bit mode).

Regards, Herb
