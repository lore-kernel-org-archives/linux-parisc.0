Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA01277
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:31 -0700
Date: Sat, 6 Nov 1999 19:24:55 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Congratulations, remarks and questions
Message-Id: <19991106192455.G11609@mathe.stud.uni-erlangen.de>
References: <19991103123044.18853.rocketmail@web507.yahoomail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991103123044.18853.rocketmail@web507.yahoomail.com>
List-ID: <linux-parisc.vger.kernel.org>

> 4. run make config and change the following options:
> CONFIG_IODC_CONSOLE=y
> CONFIG_NETDEVICES=n 
> CONFIG_VT=y
> CONFIG_VT_CONSOLE=y
> CONFIG_SERIAL=n

you're seeing the prompt with the IODC console ?

> Now the questions: the kernel boots to the
> sash-prompt, but no keyboard input is possible
> (neither the HIL-keyboard, nor the keyboard from the
> serial terminal I was using). Is this because of the
> missing support for the ASP chip of the 715/33 ? Are

Unfortunately, the IODC console is not designed to be full-duplex for
multitasking OSes.  Thus, you need to get the serial / HIL driver going
on your hardware to be able to input things or add input to the IODC
console driver which will cause bad 5 second delays (according to the
documentation) when there is no input.

	Philipp Rumpf
