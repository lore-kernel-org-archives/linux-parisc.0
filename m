Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA25104
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 15:20:25 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A637862.C312CD12@uswest.net>
Date: Mon, 15 Jan 2001 15:23:30 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Greg Ingram <ingram@symsys.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 Boots! (Mostly)
References: <Pine.LNX.4.21.0101151559150.23803-100000@maestro.symsys.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Greg,

I don't believe you have the latest palo version from cvs.  The latest palo
version will append a console=tty0 or console=ttyS0 to the Kernel
command line.

Try updating your palo, then try again.

- Ryan


Greg Ingram wrote:

> I tracked down the crash on my C100 to somewhere inside register_console()
> called from serial_console_init().  I tried a kernel without serial
> console support but that stopped generating output too early, so I tried
> just removing the register_console call() and now I get past mounting the
> root filesystem before losing console output.  A log follows.  The machine
> accepts telnet connections but telnet session won't start.  I get:
>
>         telnetd: getpty: permission denied
>
> I'm hoping that's just something to do with how I installed the root
> filesystem.  Maybe it hasn't been remounted as writable?  I'm so close to
> a shell!
>
> - Greg

[snip]

>
> Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.64
>

[snip]
