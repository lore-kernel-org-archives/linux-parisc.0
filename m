Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD436482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Jul 2001 09:37:26 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3B4C6FED.BAA6CD6F@esiee.fr>
Date: Wed, 11 Jul 2001 17:25:33 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Jari Eskelinen <jari.eskelinen@enfo.fi>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] 712/60, kernel 2.4.6 and keyboard.
References: <JA8AAAAAAd8izgABYQABMhINAcxU@enfo.fi>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Jari,
> 
> Hi!
> 
> I have 712/60 machine and I have used 2.4.0-pa30 kernel with it with great success. Today I tried to compile 2.4.6-pa11 kernel (cross-compiling with my P800, it was horrible sloooooow with 721/60 :) and it almost succeeded. Everything else works, but PS/2 keyboard won't just work. Nothing comes to screen when typing. Logging from network works as usual. Kernel seems to recognise keyboard:
> 
> PS/2 keyboard controller at 0xf0108000 (irq 69) found, device attached.
> Lasi PS/2 wait 3734
> PS/2 psaux controller at 0xf0108100 (irq 69) found, device attached.
> 
For the moment, my conclusion is that gsc_ps2_kbd_ops are not
registered. That's why you should not have the leds working on your
keyboard too. If you want the keyboard working, you can add a little
hack but it is NOT the best solution.

In drivers/char/hp_psaux.c:
You have
switch (id) {
	case 0:	
	   	register_kbd_ops(&gsc_ps2_kbd_ops);
		break;
	case 1:
And, you can put this:
switch (id) {
	case 0:	
->		inited++;
	   	register_kbd_ops(&gsc_ps2_kbd_ops);
		break;
	case 1:

Agian, this is not a permanent solution, Thomas
ESIEE Team
