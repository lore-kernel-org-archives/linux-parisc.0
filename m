Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16154
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 May 2000 17:07:21 -0600
Date: Wed, 24 May 2000 19:07:15 -0400 (EDT)
From: Pavel Roskin <pavel_roskin@geocities.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Serial support in IPL 
In-Reply-To: <20000524215425.6B32937DA8@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0005241831420.12287-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hello, Matt!

> A couple suggestions(obvious but worth checking),
> 
> - Make sure all keyboards are unplugged
> - Have you tried both serial ports?
> - Are you sure your serial console is working?

The cable was bad. Now it works!!! Thank you for the tip!

Now I can interact with firmware and IPL. I can edit the prompt and load
the kernel. But the kernel doesn't show anything:

Please enter the command-line:
/stand/vmlinux HOME=/ TERM=LINUX console=tty

SOM-Kernel:
aux_header_location: 00000080
som       : 01000080
exec_dfile: 00145000
exec_dsize: 000B9000
exec_dmem : C01F5000
exec_tfile: 00050000
exec_tsize: 000F4008
exec_tmem : C0100000
exec_bsize: 00060FE0
exec_entry: C0100000
Code at 0x00100000, size=0x000F4008
Data at 0x001F5000, size=0x000B9000
BSS  at 0x002AE000.
exec_entry: C0100000

Transferring control to kernel. (At entry point 0x00100000)

That's all I see. I have tried console=serial, console=ttyS0, I have tried
to remove the "console" parameter - no effect. I cannot see where that
"console" parameter is parsed.

I'm using Image-20000218.bin

Anyway, I have yet a lot of things to try (including compiling the latest
version). Thank you for your help.

Regards,
Pavel Roskin
