Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx10.cluster1.charter.net (dc-mx10.cluster1.charter.net [209.225.8.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F65C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 20:30:10 -0600 (MDT)
Received: from [24.159.161.68] (HELO charter.net)
  by dc-mx10.cluster1.charter.net (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 762769 for parisc-linux@lists.parisc-linux.org; Wed, 02 Oct 2002 22:30:02 -0400
Message-ID: <3D9BABA9.80209@charter.net>
Date: Wed, 02 Oct 2002 22:30:01 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 oddness
References: <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

If you did a "make-kpkg" kernel and then a "dpkg -i kernel-image-...."
then you should be able to do a palo boot modification of something
like kernel=/vmlinux.old or /boot/vmlinux.old, etc.

I generally always keep some old "proven" kernel around in /boot
and symlink it to something I can remember easily like /vmlinux-rescue
or such. A couple extra megs of space will is definately worth it.

Thats why PALO, or (in X86: GRUB) is great because you don't have
to monkey with LILO every time you recompile your kernel. Just copy
it into /boot and use your firmware (or GRUB) to boot directly, leaving
your already proven boot sector safe and secure.

If all else fails, use Debian HPPA CDRom Disk-1 to get in there and
see what your old kernel is saved as.

Good Luck!

- Doug



Tom wrote:
 > Okay - after a bit of downtime (due to houseguests being in the room with
 > the HP), I fired it back up to update things. Apt updated the system fine;
 > cvs updated the kernel from 2.4.18-pa59 to the latest -pa20 release
 > without errors. Recompiled using menuconfig (no errors), used make-kpkg to
 > create the kernel, then dpkg to install the generated .deb file (which
 > created all the links nicely, etc. Ran palo, which was happy, and
 > rebooted.
 >
 > Now, the C180 runs headless, with a serial cable running to a Proliant
 > next to it so I can use minicom as a console if needed. After the reboot,
 > I couldn't ssh back in, so I checked the console, but minicom wouldn't
 > get a response. Power-cycled the HP, still no messages on console, no
 > errors on the LCDs, and eventually (several minutes) a heartbeat light.
 > Tried unplugging the serial cable, plugging in a keyboard/mouse/monitor
 > and rebooting again, but still nothing. With the monitor on, after power
 > on I do get a green signal light on the monitor, just no display. I tried
 > the "tab after powerup" to switch console settings, but nothing. According
 > to my C180 manual, having the monitor and keyboard on there should set the
 > monitor as console, while removing them should send console to ttyS0.
 >
 > Anyone have any ideas how to rescue this, or what could have caused it?
 > It's running firmware 6.1, and has been for several months. There's no
 > error LEDs, no smell of smoke, no melted bits, and no actual response. I
 > tried switching off the UPS it's on and leaving it for an hour, but still
 > get the same lack of results. Minicom is set to 9600/8N1/VT100, which is
 > what worked last time I used the console this way...
 >
 > _______________________________________________
 > parisc-linux mailing list
 > parisc-linux@lists.parisc-linux.org
 > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
 >
