Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath (cable-207-5-237-24.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98E12482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 08:11:30 -0600 (MDT)
Date: Tue, 17 Jul 2001 06:08:49 -0800 (AKDT)
From: Tom <tom@alaskatech.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: PA-RISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 715/100 no longer boots into console?
In-Reply-To: <20010717102903.N30356@linuxcare.com>
Message-ID: <Pine.LNX.4.33.0107170603520.5536-100000@goliath>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Me:
> > So I upgraded from the 0.9 to the latest 0.91. Exerything worked nicely,
> > no errors, except now I get no login on the console. Looking over the boot
> > messages there's no errors, but there is two lines saying the FB is alive
> > and well and the console is switching to STI FB color console. Last
> > messages is after "INIT: switching to runlevel 2" and all the
> > "starting:..." messages (the last one is cron starting).

> Richard:
> Presumably you logged in via the network to get that dmesg output,
> so the machine is working ok.  Sounds like a frame buffer problem.
> 0.9 used STI console, 0.9.x uses STI frame buffer, if it is a chipset
> it recognises.

Yeah, the machine itself worked fine, just no console output. COM1 console
as well as SSH in both are quite happy.

> When you say you upgraded from 0.9 to 0.91, what do you mean?  Did
> you simply reinstall from the new .iso, or something else?  If you just
> installed, how did you get to being able to read dmesg without console
> access?

I had been doing the incremental updates, but when the ISO came out I
reinstalled. Console worked fine during the install...

> I assume your /etc/inittab is spawning a getty on tty0?

It is now - that is what I missed. For some reason the 0.91 install
disabled all the tty's for local consoles. Not sure why that is a default
setting, but I just test things - I'm not quite up to understanding what's
actually happening :-)
