Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 7551D4830
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 04:37:36 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Grant Grundler <grundler@puffin.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] review of Documentation/parisc/unwritten
Date: Sat, 6 Oct 2001 12:37:19 +0200
References: <200110060919.DAA06756@puffin.external.hp.com>
In-Reply-To: <200110060919.DAA06756@puffin.external.hp.com>
MIME-Version: 1.0
Message-Id: <20011006103736.7551D4830@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Grant,

> machine_halt		BUG. NOP.  Should update LEDs/ChassisCode.
> machine_power_on	obsolete - delete it
> 		arch/parisc/kernel/process.c

The LED/ChassisCodes are already updated by the led_halt() function, called
by the reboot notifier chain. machine_halt() is called by sys_reboot(), so we need
to let it be a NOP, or just #define it as NOP.
machine_power_on could be deleted AFAIT.

> check_bugs	include/asm-parisc/bugs.h
> 		NOP. Check for CPU bugs or misconfigured kernel.
> 		review?

Does the PA CPU has bugs ? :-)

Helge
