Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 403CB482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 11:29:20 -0600 (MDT)
Date: Fri, 8 Jun 2001 19:28:51 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20010608115550.J16532@linuxcare.com>
Message-ID: <Pine.LNX.4.33.0106081924340.9668-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Kernel faults on boot
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 8 Jun 2001, Richard Hirst wrote:

> On Wed, Jun 06, 2001 at 02:18:07PM -0700, E Frank Ball wrote:
> > On Wed, Jun 06, 2001 at 02:02:12PM -0700, E Frank Ball wrote:
> > }
> > } I have a 712/80 and a graphics monitor (HP A1097C).  I got the base
> > } system running from the palinux-0.9-32sti.iso CD.
> >
> > It had rebooted ok a couple of times, but now it get to starting cron,
> > then register dumps with a kernel fault.
>
> As mentioned in the errata <http://parisc-linux.org/release-0.9/errata.html>,
> sti installs have a tendency to crash on reboot at the moment.  If this is a
> repeatable problem, I'd be interested in the register dump.

Hi!

I have played with a 712/60 and had the same problem as Frank. I got
it installed over the first reboot, but after a the next one on
every reboot it crashed with Kernel faults at cron.

Now I have reinstalled and I do not get over the reboot. Is it
explained somewhere, which I need to write down, to help you debug
the problem? (I guess it doesn't make it into any logs, which I
could look at by putting the disk on another machine.)

Greetings,
	Peter.
