Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.com [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 4BD444829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 21:46:52 -0600 (MDT)
Date: Tue, 8 Oct 2002 23:46:46 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ksoftirqd eats 100% cpu :-(
In-Reply-To: <200210081427.IAA27522@udlkern.fc.hp.com>
Message-ID: <Pine.BSO.4.44.0210082251330.6903-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Tue, 8 Oct 2002, John Marvin wrote:
> I understand that polling is necessary while sending commands out
> to hil devices, but input should be interrupt driven. What is the
> reason for all of the polling?

The polling in the driver can definitely be improved.  I haven't
had the inspiration to go do so yet.

First off, on a system that has just a mouse and keyboard, doesn't
need to use any of the other features in the HP SDC (the real time
clock, which seems redundant in most systems capable of running
parisc-linux, the timers, and the tone generator), and doesn't need to
keep track of plug/unplug events for multiple mice/keyboards or transfer
large amounts of data to the HIL, which is probably going to be 90%+ of
the user base, a much simpler driver that allows the i8042 firmware to drive
the HIL MLC could be written, sort of like the USB_HIDBP stuff.

The HIL driver that's in there now is more like the full-fledged
USB driver, and repolls of the loop to check for added/removed
devices are done manually, which allows more information to be extracted
from the devices during this process.  Unfortunately, because the MLC was
designed a bit cretinously, it expects the host to wait for timeouts
and responses.  The current design uses a state machine to keep
those delays from having an impact on the real-time scheduling, rather
than busy-polling.  Unfortunately again, the system clock only has a 100HZ
frequency, so in order to provide timely responses the driver runs an
opportunistic tasklet in order to catch the CPU during a context
switch.  The linux tasket scheduler is a bit limited in that you
cannot tell it not to re-call a tasklet more than once every
N nanoseconds unless that N is as large as a full clock tick (10ms).

So most of the time the tasklet gets woken up, decides there's nothing
to do, and goes back to bed.  This should only takes a very few CPU
cycles (238 to be precise), so I don't know why it accounts for so much
time.  I guess the kernel decides when the system is idle to run the
tasklets continuously, which is not the way I was expecting them to behave
(I was expecting them to run one time per IRQ, and once all the taskets
returned and there was no work to do in userspace, the idle task would
start.  I believe that that is what the documentation I was using said
would happen when a tasklet rechedules itself, but apparently it was
wrong.)

Rest assured that the HIL driver does move aside for real work, it's
just taking the place of the idle task, really.  Not that that's
a good thing -- the idle task is supposed to use any power-saving
CPU instructions available to decrease power consumption.

BTW, does anyone have any hardware that does host-to-HIL transfers?
So far the only one I could potentially test with is the tiny
command that sets the autorepeat rate on the keyboard -- I don't even have
a keyboard with LEDs :-(

Additionally I'm interested to know if the HIL MLC chipsets were ever
used in system without the accompanying i8042.

--
Brian S. Julin
