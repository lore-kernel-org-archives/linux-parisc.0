Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A2A9482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Apr 2002 08:35:13 -0600 (MDT)
Date: Wed, 10 Apr 2002 15:35:06 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] some bugs
In-Reply-To: <200204100130.14037.deller@gmx.de>
Message-ID: <Pine.LNX.4.44.0204101509020.1717-100000@sal.ucc.ie>
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

On Wed, 10 Apr 2002, Helge Deller wrote:

> > - leds don't seem to work (i.e. no heartbeat or other leds on or blinking -
> > or is my hp really so idle ?)
> >   This is just with the latest 2.4.18-pa14 kernels (2.4.18-pa5-32bit
> > worked, but IIRC not perfectly)
>
> Could you post me some of your bootlogs ?

of course. but I have no access to the c240 until tomorrow.
I have access to /proc/pdc/leds, echo "0 0 0" and echo "1 1 1"
will change the /proc/pdc/leds entry, but not leds with flash.

> > - 100Mbit is not supported properly (full-duplex support is always
> >   recognized, but 100Mbit just occationally).
> >   Of course it's a full 10/100Mbit SWITCH (no hub), and I checked the
> > cables Moreover I just have 100Mbit network devices plugged into the
> > switch.
>
> I never had problems with tulip and 100MBit here (on c3k).

10Mbit works perfectly. 100Mbit works once it is detected, which is
often, but not always. Lately it seems to be working most of the times
on 100Mbit, perhaps due latest improvements in the kernel ?

But perhaps it's only a h/w issue (incompatibility with switch and
network card?). Once the workstation is switched on, it seems
the kernel won't change the connection mode (e.g. changing from
10Mbit to 100Mbit) that was initially negotiated by the network card.
Thus is presume that sometimes the h/w 100Mbit negotiation works,
sometimes not, since the 10Mbit mode is entered BEFORE starting the
linux kernel (which don't change it to 100Mbit).

> > - the 'poweroff' command doesn't work, it just shutdowns the machine, but
> > does no real poweroff. (AFAIK 'poweroff' is a synonym for 'shutdown -p
> > now', isn't it ? this doesn't work either).
> >   The powerkey works as expected (including powering off the workstation)
> >   with 32bit kernels.

[...]      // cutting out interesting stuff

> So currently I don't see any solution here. You will _always_ have to press the power
> button at least once: Directly while the kernel runs, or after you have started "shutdown -n".
> Of course I may be wrong, in which case I would appreciate if someone from HP
> would correct me here.

Ah, I see! It's a little bit strange though

> > - if fs type "auto" is set for a ext3 partition, the kernel detects the /,
> > but the mount command (in the bootscript) fails to detect the fstype.
> > Setting the fstype entry in /etc/fstab to "ext3" or "ext2" fixes the
> > problem. Since 'mount -a' fails to detect the fs type, it won't remount /
> > in read-write mode, and thus the system won't boot correctly.
> >
> >   But "auto" in /etc/fstab works with the corresponding 32bit kernel
>
> This should be reported to the debian folks.

Well, yes, maybe, because it's 'mount' specific. But why is it working
with the 32bit kernel? I thought this kind of things should be
platform-independent ...

> > - crashme is effective (example settings, after a few minutes kernel
> > crashed, even MagicSysRq didn't work. It didn't seem to 'work' on
> > 2.4.18-pa5-32bit, I didn't try with the 2.4.18-pa14-32bit kernel)
> >
> > - once I got a kernel oops at interrupt_stack() at boot up (attached to
> > mail), but eveything seemed to work. I didn't get any more kernel oops.
>
> We don't have chance to trace this bug without having your System.map.

That's true ;)
I just looked into the kernel oops and System.map and the only address
that matched the address range of a function in System.map was
interrupt_stack (exactly 00000000106100000). Since there was just one,
not reproducable kernel oops, and since I don't know what caused it,
it doesn't make sense to investigate it further. There are no other
kernel oops in /var/log/messages.
I just thought perhaps there would be a known issue with interrupt_
stack on 64bit or so ...

> > - shutdown&poweroff when hitting powerkey does not work (it just switches
> > off the workstation immediately; it works properly on the corresponding
> > 32bit kernel and 2.4.18-pa5-32bit)
>
> Ryan committed some related changes here in 2.4.18-pa16.
> Could you retry with this kernel and check the results with CONFIG_PDC_NARROW
> enabled and disabled ?

okay, but it will take some time tough ;)

> > - if I compile in support for STIcon/STIfb, it doesn't switch the output
> >   to the console (after the 'branching to kernel entry point' message).
> >   At least I waited for quite some time, and I didn't seem to go on.
> >   I didn't compile in support for STIcon/STIfb for the 32bit kernel,
> >   therefore I can't tell whether there is the same problem or not.
> >   STIcon/STIfb works with 2.4.18-pa5-32bit. Well, my FX/2 card isn't
> > supported for fb, but at least the kernel doesn't hang with that kernel.
>
> Are you using the latest palo ? Do you maybe have "console=ttyS00" as
> kernel boot parameter (check /proc/cmdline).

no, there is no console entry in palo.conf. Palo is the one from
ISO 0.9.3, and it might be updated by apt-get (I'm using unstable).

BTW, one question:

I always wondered if sid (unstable) is the preferred dist for
debian/hppa (very likely a debian-mailing-list question, but what
do you kernel hackers and developers use and prefer?)

thanks, greetings max
