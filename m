Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70E1E4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 15:09:56 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18UwUH-00055F-00; Sat, 04 Jan 2003 22:09:49 +0000
Date: Sat, 4 Jan 2003 22:09:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: Arto Jantunen <viiru@debian.org>
Cc: Herb Radford <herbr@magma.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] D370
Message-ID: <20030104220949.A19239@parcelfarce.linux.theplanet.co.uk>
References: <5.1.0.14.0.20030101115323.03a100e0@mail.magma.ca> <87el7vjsxo.fsf@welho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87el7vjsxo.fsf@welho.com>; from viiru@debian.org on Thu, Jan 02, 2003 at 08:41:07PM +0200
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

On Thu, Jan 02, 2003 at 08:41:07PM +0200, Arto Jantunen wrote:
> Herb Radford <herbr@magma.ca> writes:
> > Has there been any change in the support for the D-Class machines with
> > an Access Port card?

Yes, I posted an email to this list asking for testers a few weeks back,
I think ...

> > I'm not sure I understand what's happening when the AP card is
> > inserted. If I boot into the PDC I get the console on Serial 1. If I
> > boot with my console plugged into the AP card serial port I get nada!
> > When I plug my console into Serial 2 I also get zip!
> > If I boot with the console in Serial 1, output stops at the famous
> > "branching to" message.

Here's what happens.  Without the AP card plugged in, firmware tells us
about 2 serial ports; the one on Lasi and the one on Wax.  Linux detects
them as ttyS0 and ttyS1, respectively.  With the AP card plugged in,
firmware no longer tells us about Lasi's serial port, so Wax's serial
port is assigned ttyS0 instead.  Ryan wrote a driver for the AP card
which will present it as ttyB0.  Wax will still be assigned ttyS0, so
you have to boot with console=/dev/ttyB0 instead of S0.  You also need
to make sure that you've created ttyB0 before rebooting.  And of course,
you need to build support for the serial mux driver into your kernel.

The good news is that this should now be supported by the debian
bootfloppies.  Not sure whether that will ever make it into an official
Debian release before it's superceded by debian-installer.

> > Must the AP card be removed for useful o[peration?
> 
> Thats how I did it for my D390 and after that it works fine. Also,
> you can do the "switch to serial 2 after the branching point" dance..

Another way to do it is to set up the console path to SERIAL_2 and
then boot Linux with ttyS0 and you'll always see output on the second
serial port.

> Also, so that others know, with the current (as in 2.4.20) kernels
> (which fixed some unaligned access issues, I believe), the machine
> works just fine on 32-bit SMP.

Excellent news!

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
