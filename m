Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from droid3.webreklam.hu (para.abs0lut.com [195.56.113.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8134F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 May 2001 03:36:18 -0600 (MDT)
Date: Fri, 25 May 2001 11:36:15 +0200 (CEST)
From: diab <diab@diab.rulez.org>
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Cc: debackex@esiee.fr
Subject: Re: [parisc-linux] dead keyboard after booting 0.61 STI32 iso on a
  715/100
In-Reply-To: <3B0E12FD.4EB7BCF5@esiee.fr>
Message-ID: <Pine.LNX.4.21.0105251130540.20410-100000@droid3.webreklam.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Yes, it is a a PC PS2 keyboard (plugged to a keyboard adapter module,
which connects to the HP715 w/ an rj45 like jack).
I've tried two different ps2 keyboars, with no luck so far

before that fbconsole would init i see a screen full of information 
(lots of rows starting with Mirage something detected) but it clears the
screen (switchin to STIfb) so quick, i cant read it :( 
is there any way to hold it? 

% Could you send him (debackex@esiee.fr) the list
% of hardware detected by the kernel during the boot sequence?
hardware detected:
ttys00, ttys01, lp0 
Sim700: 57c710 scsi (it displays a warning, irq probe failed)
Lasi Harmony Audio rev. 18 

im typing all of these from my memory since the keyboard is frozen after
vmlinuz stars to boot and no way to somehow stop the screen :(
i even tried to make a photo of it but the flash makes the screen
unreadable and its too dark and "moving" quickly for flashless pix.

--
diab 
		
