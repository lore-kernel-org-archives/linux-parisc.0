Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 793EC482A
	for <parisc-linux@parisc-linux.org>; Tue,  7 Aug 2001 17:30:09 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9B706B00C; Wed,  8 Aug 2001 00:31:23 +0100 (BST)
Date: Wed, 8 Aug 2001 00:31:23 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The final patch for the keyboard problem
Message-ID: <20010808003123.G1011@linuxcare.com>
References: <3B6F986D.FA89E147@esiee.fr> <20010807115817.A1011@linuxcare.com> <20010807131419.B1011@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010807131419.B1011@linuxcare.com>; from rhirst@linuxcare.com on Tue, Aug 07, 2001 at 01:14:19PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 07, 2001 at 01:14:19PM +0100, Richard Hirst wrote:
> On Tue, Aug 07, 2001 at 11:58:17AM +0100, Richard Hirst wrote:
> > Anyway, I'm about to try it on a couple of machines here; I'll let you
> > know how it goes.
> 
> HP US keyboard on B180.  Worked until I unplugged and replugged the
> keyboard.  Keyboard was dead after that, but machine still responded
> to pings.

Tried unplugging/replugging again; survived this time.  Keyboard
generates a scancode AA (reconnected), but the console says unrecognised
scancode 7f.

btw, I guess we should reinitialise the LED status on a replug.

Back to the compaq UK keyboard, CapsLock works also with the longer
mdelay() calls.  The CapsLock LED doesn't come on, but the others
do, so I'll assume faulty k/b for now.  Unplug/replug still results
in a dead keyboard (init=/bin/sh, so I can't tell if the machine is
still alive).

On the mdelay() calls, the PC driver would check for an ack every 1ms,
but would only resend the command every 1000ms.  Your code was resending
every 1ms.  Checking every 1ms and resending less frequently is better
than just checking and resending every 5ms.
  
Richard
