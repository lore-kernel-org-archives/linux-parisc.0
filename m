Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id A29C8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jul 2001 15:16:55 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Richard Hirst <rhirst@linuxcare.com>, Tom <tom@alaskatech.org>
Subject: Re: [parisc-linux] 715/100 no longer boots into console?
Date: Tue, 17 Jul 2001 23:12:02 +0200
Cc: PA-RISC Linux List <parisc-linux@lists.parisc-linux.org>
References: <Pine.LNX.4.33.0107151938330.529-100000@goliath> <20010717102903.N30356@linuxcare.com>
In-Reply-To: <20010717102903.N30356@linuxcare.com>
MIME-Version: 1.0
Message-Id: <20010717211655.A29C8482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Tom, Richard,

On Tuesday 17 July 2001 11:29, Richard Hirst wrote:
> On Sun, Jul 15, 2001 at 07:50:39PM -0800, Tom wrote:
> > So I upgraded from the 0.9 to the latest 0.91. Exerything worked nicely,
> > no errors, except now I get no login on the console. Looking over the
> > boot messages there's no errors, but there is two lines saying the FB is
> > alive and well and the console is switching to STI FB color console. Last
> > messages is after "INIT: switching to runlevel 2" and all the
> > "starting:..." messages (the last one is cron starting).
> >
> > I *had* all the common pitfalls saved, until I had a drive crash in the
> > mail server and nuke all the saved mail :-(. So, if someone can tell me
> > the simple solution to this I'd appreciate it... If needed the output of
> > dmesg is at http://www.alaskatech.org/stuff/715boot.txt
>
> Presumably you logged in via the network to get that dmesg output,
> so the machine is working ok.  Sounds like a frame buffer problem.
> 0.9 used STI console, 0.9.x uses STI frame buffer, if it is a chipset
> it recognises.

IIRC the 715/100 is nearly identical to the 715/64, so sticon and stifb should work.

> .....

> I assume your /etc/inittab is spawning a getty on tty0?

Tom: Does it ?  If not, then that's why it's failing.

Greetings,

Helge
