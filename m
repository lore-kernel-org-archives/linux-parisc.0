Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2439B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Dec 2002 05:16:59 -0700 (MST)
Received: from kabel209080 (kabel209080.kabel.utwente.nl [130.89.232.79])
          by netlx010.civ.utwente.nl (8.11.4/HKD) with SMTP id gB4CGp804545
          for <parisc-linux@lists.parisc-linux.org>; Wed, 4 Dec 2002 11:16:51 -0100
Message-ID: <004001c29b8e$f47eb0c0$4fe85982@kabel.utwente.nl>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: <parisc-linux@lists.parisc-linux.org>
References: <3DA3DE6600007D28@ocpmta4.be.tiscali.com> <003101c299e1$9b2e7680$4fe85982@kabel.utwente.nl> <20021202105023.GL24337@sleepie.demon.co.uk> <003a01c29a1d$cd94b800$4fe85982@kabel.utwente.nl> <20021202165219.GP24337@sleepie.demon.co.uk> <001c01c29b89$f01db9e0$4fe85982@kabel.utwente.nl> <20021204120244.GV24337@sleepie.demon.co.uk>
Subject: Re: [parisc-linux] lifimage
Date: Wed, 4 Dec 2002 13:16:20 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I don't see any output at all. Does it matter which emulation mode I use? I
now use VT100.

Greetings,
Tim

----- Oorspronkelijk bericht -----
Van: "Richard Hirst" <rhirst@linuxcare.com>
Aan: "Tim Kemna" <t.kemna@student.utwente.nl>
CC: <parisc-linux@lists.parisc-linux.org>
Verzonden: woensdag 4 december 2002 13:02
Onderwerp: Re: [parisc-linux] lifimage


> On Wed, Dec 04, 2002 at 12:40:25PM +0100, Tim Kemna wrote:
> > I changed the console by booting de lifimage. The machine now boots
without
> > a keyboard connected to it. Also when I push the power button it doesn't
> > turn off. So I'm pretty sure the console is now the serial device.
>
> Power button is completely unrelated to which console you are configured
> for.  When things are working right, hitting the power button should
> cause a clean shutdown of Linux followed by a power off.  Pretty neat.
> There have been some issues in that area, but it worked for me last time
> I tried.
>
> > Now my problem is that I can't get any output. I'm using HyperTerminal
6.3
> > on windows 98. The settings are 9600 8-N-1. My serial cable is D9F/D9F.
> > Do I need to reboot the 712 every time I try to connect to it? Or can I
just
> > plug the cable into another COM port and try again?
>
> You can move your serial cable while the system is up, no need to
> reboot.
>
> Do you mean no output, or do you mean you see kernel boot messages but
> no login prompt?
>
> If you see nothing at all, suspect your cable - may need a crossover
> rather than 1:1 cable (or visaversa), or suspect your terminal emulator.
>
> In any case, if you had this running on graphical console and have now
> switched, you need to modify /etc/inittab to enable a getty on the
> serial port.  Otherwise, no login prompt.
>
> Even though you have switched conosles, inittab still sets up a getty on
> the graphical console; plug your monitor and keyboard in as well, and
> you can probably log in via that to fix /etc/inittab.  Assuming you can
> be bothered to move your monitor and keyboard one more time ;-)
> Otherwise, perhaps you can telnet or ssh in to it over the network.
>
> Beware the keyboard is not designed for hotpluging, so to be absolutely
> safe, you should move that with both systems powered off.
>
> Richard
>
