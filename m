Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wolf.alaskatech (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AABD4829
	for <parisc-linux@parisc-linux.org>; Wed,  2 Oct 2002 11:46:29 -0600 (MDT)
Received: from wolf.alaskatech (palinux@wolf.alaskatech [24.237.5.207])
	by wolf.alaskatech (8.12.3/8.12.3/Debian -4) with ESMTP id g92HlxR5006750
	for <parisc-linux@parisc-linux.org>; Wed, 2 Oct 2002 09:47:59 -0800
Date: Wed, 2 Oct 2002 09:47:59 -0800 (AKDT)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C180 oddness
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

Okay - after a bit of downtime (due to houseguests being in the room with
the HP), I fired it back up to update things. Apt updated the system fine;
cvs updated the kernel from 2.4.18-pa59 to the latest -pa20 release
without errors. Recompiled using menuconfig (no errors), used make-kpkg to
create the kernel, then dpkg to install the generated .deb file (which
created all the links nicely, etc. Ran palo, which was happy, and
rebooted.

Now, the C180 runs headless, with a serial cable running to a Proliant
next to it so I can use minicom as a console if needed. After the reboot,
I couldn't ssh back in, so I checked the console, but minicom wouldn't
get a response. Power-cycled the HP, still no messages on console, no
errors on the LCDs, and eventually (several minutes) a heartbeat light.
Tried unplugging the serial cable, plugging in a keyboard/mouse/monitor
and rebooting again, but still nothing. With the monitor on, after power
on I do get a green signal light on the monitor, just no display. I tried
the "tab after powerup" to switch console settings, but nothing. According
to my C180 manual, having the monitor and keyboard on there should set the
monitor as console, while removing them should send console to ttyS0.

Anyone have any ideas how to rescue this, or what could have caused it?
It's running firmware 6.1, and has been for several months. There's no
error LEDs, no smell of smoke, no melted bits, and no actual response. I
tried switching off the UPS it's on and leaving it for an hour, but still
get the same lack of results. Minicom is set to 9600/8N1/VT100, which is
what worked last time I used the console this way...
