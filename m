From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: J5000 LCD heartbeat
Date: Sun, 20 Mar 2005 21:03:57 +0100
Message-ID: <20050320210357.53534d01__45788.0010865212$1416623703$gmane$org@Tatooine.r3z0>
References: <200503191959.05972.dmp@davidmpye.dyndns.org>
	<200503201918.31808.dmp@davidmpye.dyndns.org>
	<20050320204032.3ed40468@Tatooine.r3z0>
	<200503201952.31465.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: dmp@davidmpye.dyndns.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200503201952.31465.dmp@davidmpye.dyndns.org>
Resent-Message-ID: <4F1NGD.A.LRG.BsdPCB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Sun, 20 Mar 2005 19:52:29 +0000
David Pye <dmp@davidmpye.dyndns.org> wrote:

> Hi, and thanks for your reply.
> 
> On Sunday 20 March 2005 19:40, you wrote:
> 
> > > I think I have an idea that it's related to CPU1 init, but I haven't
> > > confirmed this yet - depending on your feedback to the idea below, I
> > > won't bother tracing it down.
> >
> > Don't bother. I have that kind of message left on my j5k LCD has well,
> > that's been there for ages, without problem.
> 
> Well, I'd like to see it gone myself, even though it doesn't do anything
> unpleasant. It is a little messy, at least having it mangled up with the
> Linux default text is.
> 
> If all it takes to prevent it is to make the lcd init happen slightly
> later in the boot process (ie after the chassis code was emitted), I'd
> have thought it would be an easy win.

it's not that simple.
If you want to have it gone, add 
@reboot echo "" > /proc/pdc/lcd
in your root crontab :)

> > If you think about the firmware code that drives the display of
> > chassis messages, it's firmware, changing how it works is pretty much
> > not possible at that point. If you think about the PDC Chassis driver,
> > that code doesn't work (read, "isn't activated") on j5k and other
> > System Map firmware machines, it only works on PDC PAT machines (eg
> > high end servers).
> 
> Yeah, true. So, if the PDC chassis driver isn't used on the j5k, how
> does the chassis message get sent from the kernel to the PDC?  I haven't
> worked that out yet.

That message is a *firmware* one. It is send by the machine itself, not
by anything in the kernel (at least, directly).
 
> > I don't think this is either useful nor desirable. We want to have the
> > firmware messages going over whatever the led/lcd driver would have
> > shown, and going into such a pain for a corner case doesn't really
> > seem worth it.
> 
> At the very least, clearing the display first before the message is
> shown would have been helpful, imho.  

As i told you, this is not possible. The firmware doesn't know there's
already something on the display. And you don't want to rewrite the PDC
firmware, do you? :)

> I'd personally like to have the firmware message displayed only for a
> limited time, though I can see a counter argument for this.  But not for
> having cleared the display first, though. (Whether this is possible
> depends on your answer as to how the PDC is told to display the
> message!)

This is certainly not a good idea, but if you want that, add the following
to your root crontab:

*/10 * * * * echo "" > /proc/pdc/lcd

This will redraw the original message every 10mn.

> > > Did you have any hints you could give me as to fix my very
> > > occasional heartbeat issue either?
> >
> > I recall that the LCD heartbeat is quite slow on my j5k as well, but
> > nothing really awful, afaicr.
> 
> Well, here it's sufficiently slow to be utterly useless as a heartbeat, 
> anyway. It usually flips state every 10-30 seconds, depending on how it 
> feels. It certainly doesn't boot.
> 
> I realise the LCD functionality is something fairly minor, and that I'm
> being picky, but I'd be happy to invest some time to do some fine
> tuning.  The only two must-haves for me is to nail the INI CC01 message
> being displayed over the Linux kernel version display, and preferably to
> make my heart beat too ;)

The LED/LCD driver uses tasklets, which are quite CPU expensive. I think
this is one of the reason the heartbeat is slow. Though 30s seems alot to
me either.

HTH

Thibaut VARENE
The PA/Linux Team
http://www.pateam.org/


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
