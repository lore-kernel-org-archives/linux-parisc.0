Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D758482A
	for <parisc-linux@parisc-linux.org>; Tue,  7 Aug 2001 15:35:40 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B0D6FB00C; Tue,  7 Aug 2001 22:36:50 +0100 (BST)
Date: Tue, 7 Aug 2001 22:36:50 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The final patch for the keyboard problem
Message-ID: <20010807223650.F1011@linuxcare.com>
References: <3B6F986D.FA89E147@esiee.fr> <20010807115817.A1011@linuxcare.com> <20010807131419.B1011@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010807131419.B1011@linuxcare.com>; from rhirst@linuxcare.com on Tue, Aug 07, 2001 at 01:14:19PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 07, 2001 at 01:14:19PM +0100, Richard Hirst wrote:
> Went back to the HP keyboard, and CapsLock hangs the machine there also.


I've fixed the lockup on CapsLock, using an analyser to monitor what happened
on the PS/2 cable:

(fw=firmware, kb=keyboard, li=linux)

B180, HP keyboard, this is what the firmware does on reset:

fw F5	disable scanning
kb FA	ack

fw F2	???
kb FA	ack
kb AB
kb 83

fw FF	reset
kb FA	ack
kb AA	power-on reset

fw F0	???
kb FA	ack

fw 02	???
kb FA	ack

fw F0	???
kb FA	ack

fw 00	???
kb FA	ack
kb 02

fw ED	set leds
kb FA	ack

fw 02	NumLock
kb FA	ack

fw F4	enable scanning
kb FA	ack

Now CapsLock pressed and released:

kb 58	keypress

fw ED	set leds
kb FA	ack

fw 06	CapsLock + NumLock
kb FA	ack

kb F0	keyrelease
kb 58

Now we boot Linux:

li ED	set leds
kb FA	ack

li 00	No LEDs
kb FA	ack

li F4	enable scanning
kb FA	ack

Now we press and release '1':

kb 16	keypress

kb F0	keyrelease
kb 16

Now we press CapsLock:

kb 58	keypress

li ED	set leds
li ED	set leds
kb FA	ack

System is hung.

The problem was that the driver retried the 'set leds' every 1ms, but the data rate
on the serial PS/2 cable is such that it takes at least 1ms for the command to reach
the keyboard, and a further 1ms for the ack to return.

I changed the driver to allow 5ms rather than 1ms, and it works now.  In fact, for
my keyboard, the time from command being written to ack being received is about
2.5ms.

Can't say I like the idea of mdelay(5) being called 3 times every time I press
CapsLock though.

Richard
