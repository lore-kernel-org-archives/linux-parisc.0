Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 14 Jan 2003 11:02:00 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 status update 2003-01-14
Message-ID: <20030114180200.GC32537@dsl2.external.hp.com>
References: <20030114155409.X26554@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030114155409.X26554@parcelfarce.linux.theplanet.co.uk>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Jan 14, 2003 at 03:54:09PM +0000, Matthew Wilcox wrote:
>  - drivers/pci/setup-bus.c has a hppa-specific #ifdef right now to
>    prevent pci reinit from hpmc'ing the machine. this probably needs to
>    go upstream

This code has changed alot. I'll look at it this week to see if
we still need this and if so, how to get rid of it.

>  - ad1889 driver - stress, debug, ALSA and commit to 2.5 (ggg, tausq, tbone)

What we have now only groks .wav files (eg cat foo.wav > /dev/audio).
We need better docs for this chip.
The ad1889.pdf data sheet is only an abbreviated guide to the chip.
It's not good enough for writing a driver from scratch.

>  - CPU hotplug support (maybe not needed, V-Class doesn't support that feature)

While we may not be able to physically remove the CPU, it would be
useful to take CPUs "offline" when they start misbehaving.

>  - fix harmony buffer-overflows

Laurent rewrote harmony to be Alsa compliant and it seems to be working.
I just have to learn how to setup/use alsa properly.

>  - the irq needs to go from doubly-indexed to singly-indexed scheme, or else fs/proc/proc_misc.c needs changes.

you fixed this.

>  Started and in progress:
>  ------------------------
>  - port sym53c8xx hppa changes forward (helge)
>  - push STI changes upstream (helge)
>  - Look at Config.help too. (tbone, HIL -> helge?)
>  - send tulip changes to jgarzik (grant)

done.

>  - switching Harmony to ALSA (laurent)

nearly done.

>  - oprofile support (tausq)

done? Seems like it's working but has a bug.

thanks,
grant
