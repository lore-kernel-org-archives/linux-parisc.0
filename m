Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABF894843
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 18:47:14 -0600 (MDT)
Message-Id: <200110070044.SAA15021@puffin.external.hp.com>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] review of Documentation/parisc/unwritten 
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Sat, 06 Oct 2001 12:37:19 +0200." <200110061035.EAA13283@puffin.external.hp.com>
Date: Sat, 06 Oct 2001 18:44:07 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Helge Deller wrote:
> Hi Grant,

Hi Helge!

> The LED/ChassisCodes are already updated by the led_halt() function, called
> by the reboot notifier chain. machine_halt() is called by sys_reboot(), so we
>    need
> to let it be a NOP, or just #define it as NOP.

Ok. NOP it will stay.

> machine_power_on could be deleted AFAIT.

I'll deal with that.

> Does the PA CPU has bugs ? :-)

Unfortunately, a few here and there. I've seen the bug lists
(eg 2.3 vs 2.4 Cuda) but don't understand all the issues.

I posted this mostly to make folks aware.
This is the place to put CPU-bug detection code so work-arounds
in other parts of the code can use known state.

grant
