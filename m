From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: J5000 LCD heartbeat
Date: Sun, 20 Mar 2005 20:40:32 +0100
Message-ID: <20050320204032.3ed40468__4011.29490132934$1416623702$gmane$org@Tatooine.r3z0>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<200503192233.26991.dmp@davidmpye.dyndns.org>
	<20050319231911.GB21898@colo.lackof.org>
	<200503201918.31808.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: dmp@davidmpye.dyndns.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200503201918.31808.dmp@davidmpye.dyndns.org>
Resent-Message-ID: <oVGNq.A.joF.KcdPCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Sun, 20 Mar 2005 19:18:29 +0000
David Pye <dmp@davidmpye.dyndns.org> wrote:

> On Saturday 19 March 2005 23:19, Grant Grundler wrote:
> > On Sat, Mar 19, 2005 at 10:33:24PM +0000, David Pye wrote:
> >
> > > Is it possible to make the write to the display later in the boot
> > > process, so it occurs after the INI CC01 is printed?
> >
> > I would think it's possible.
> > You want to track down where the CC01 chassis_log is emitted then
> > propose a better place to initialize LED display?
> 
> I think I have an idea that it's related to CPU1 init, but I haven't
> confirmed this yet - depending on your feedback to the idea below, I
> won't bother tracing it down.

Don't bother. I have that kind of message left on my j5k LCD has well,
that's been there for ages, without problem.

> > Another idea is the chassis log code might want to clear the LED
> > diplay when displaying a chassis log and then a few seconds later
> > refresh the LED display with the original contents or something.
> 
> At the very least, I think it needs to clear the lcd display before it
> sends the chassis code to the PDC.  How does this sound:

If you think about the firmware code that drives the display of chassis
messages, it's firmware, changing how it works is pretty much not
possible at that point. If you think about the PDC Chassis driver, that
code doesn't work (read, "isn't activated") on j5k and other System Map
firmware machines, it only works on PDC PAT machines (eg high end
servers).

> Clear the lcd
> Send the chassis code
> set up a timer for 15 seconds, say, to restore the original display text
> 
> This requires a couple of changes to led.c so firmware.c can tell
> whether the machine has an LCD or not. (If it does, then do the above,
> otherwise just send the chassis code as before.)

AFAIK, it's not possible for the led.c driver to figure out whether the
firmware has sent anything to the LCD display.

> If you agree that this is something useful, I will do some more hacking
> on it. Otherwise, I'll do the other option and arrange the the chassis
> log to be sent before the lcd has the initial text printed on it.

I don't think this is either useful nor desirable. We want to have the
firmware messages going over whatever the led/lcd driver would have shown,
and going into such a pain for a corner case doesn't really seem worth it.

> Another idea I had was this:
> 
> How about making the text scrollable? ie if the string is longer than
> the viewport, scroll it along at a reasonable rate.

That has been considered and eventually ruled out. Remember we're in
kernel context, this is not meant to be eye candy etc. The pretty
formatting you suggest should be eventually a userland task, certainly not
a supplementary burden for the kernel.

At some point we looked after writing a complete driver for the LCD
display, but it happens that it's much more complicated than first
expected. For instance, accessing the other row of the LCD is almost
impossible. In any case, it would probably consume resource for nothing
really worth it.

> I'm willing to have a play with this too, if people think it's something
> worth having.

IMHO it's not.

> Did you have any hints you could give me as to fix my very occasional 
> heartbeat issue either? 

I recall that the LCD heartbeat is quite slow on my j5k as well, but
nothing really awful, afaicr.

HTH

Thibaut VARENE
The PA/Linux Team
http://www.pateam.org/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
