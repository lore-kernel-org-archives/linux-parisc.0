Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust111.brnt.cable.ntl.com [213.107.179.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AF494829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Dec 2002 05:08:34 -0700 (MST)
Date: Wed, 4 Dec 2002 12:02:44 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Tim Kemna <t.kemna@student.utwente.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] lifimage
Message-ID: <20021204120244.GV24337@sleepie.demon.co.uk>
References: <3DA3DE6600007D28@ocpmta4.be.tiscali.com> <003101c299e1$9b2e7680$4fe85982@kabel.utwente.nl> <20021202105023.GL24337@sleepie.demon.co.uk> <003a01c29a1d$cd94b800$4fe85982@kabel.utwente.nl> <20021202165219.GP24337@sleepie.demon.co.uk> <001c01c29b89$f01db9e0$4fe85982@kabel.utwente.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <001c01c29b89$f01db9e0$4fe85982@kabel.utwente.nl>
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

On Wed, Dec 04, 2002 at 12:40:25PM +0100, Tim Kemna wrote:
> I changed the console by booting de lifimage. The machine now boots without
> a keyboard connected to it. Also when I push the power button it doesn't
> turn off. So I'm pretty sure the console is now the serial device.

Power button is completely unrelated to which console you are configured
for.  When things are working right, hitting the power button should
cause a clean shutdown of Linux followed by a power off.  Pretty neat.
There have been some issues in that area, but it worked for me last time
I tried.

> Now my problem is that I can't get any output. I'm using HyperTerminal 6.3
> on windows 98. The settings are 9600 8-N-1. My serial cable is D9F/D9F.
> Do I need to reboot the 712 every time I try to connect to it? Or can I just
> plug the cable into another COM port and try again?

You can move your serial cable while the system is up, no need to
reboot.

Do you mean no output, or do you mean you see kernel boot messages but
no login prompt?

If you see nothing at all, suspect your cable - may need a crossover
rather than 1:1 cable (or visaversa), or suspect your terminal emulator.

In any case, if you had this running on graphical console and have now
switched, you need to modify /etc/inittab to enable a getty on the
serial port.  Otherwise, no login prompt.

Even though you have switched conosles, inittab still sets up a getty on
the graphical console; plug your monitor and keyboard in as well, and
you can probably log in via that to fix /etc/inittab.  Assuming you can
be bothered to move your monitor and keyboard one more time ;-)
Otherwise, perhaps you can telnet or ssh in to it over the network.

Beware the keyboard is not designed for hotpluging, so to be absolutely
safe, you should move that with both systems powered off.

Richard
