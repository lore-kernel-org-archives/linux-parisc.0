Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29390482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 03:30:59 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id AC5D0B00C; Tue, 17 Jul 2001 10:29:03 +0100 (BST)
Date: Tue, 17 Jul 2001 10:29:03 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Tom <tom@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 715/100 no longer boots into console?
Message-ID: <20010717102903.N30356@linuxcare.com>
References: <Pine.LNX.4.33.0107151938330.529-100000@goliath>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0107151938330.529-100000@goliath>; from tom@alaskatech.org on Sun, Jul 15, 2001 at 07:50:39PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jul 15, 2001 at 07:50:39PM -0800, Tom wrote:
> So I upgraded from the 0.9 to the latest 0.91. Exerything worked nicely,
> no errors, except now I get no login on the console. Looking over the boot
> messages there's no errors, but there is two lines saying the FB is alive
> and well and the console is switching to STI FB color console. Last
> messages is after "INIT: switching to runlevel 2" and all the
> "starting:..." messages (the last one is cron starting).
> 
> I *had* all the common pitfalls saved, until I had a drive crash in the
> mail server and nuke all the saved mail :-(. So, if someone can tell me
> the simple solution to this I'd appreciate it... If needed the output of
> dmesg is at http://www.alaskatech.org/stuff/715boot.txt

Presumably you logged in via the network to get that dmesg output,
so the machine is working ok.  Sounds like a frame buffer problem.
0.9 used STI console, 0.9.x uses STI frame buffer, if it is a chipset
it recognises.

When you say you upgraded from 0.9 to 0.91, what do you mean?  Did
you simply reinstall from the new .iso, or something else?  If you just
installed, how did you get to being able to read dmesg without console
access?

I assume your /etc/inittab is spawning a getty on tty0?

Maybe Helge can comment, if he reads this.

Richard
