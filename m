Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA15239
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 May 2000 15:52:35 -0600
To: Pavel Roskin <pavel_roskin@geocities.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Serial support in IPL 
In-Reply-To: Message from Pavel Roskin <pavel_roskin@geocities.com>
   of "Wed, 24 May 2000 17:22:46 EDT." <Pine.LNX.4.21.0005241559150.11687-100000@sunapee.transcept.com>
References: <Pine.LNX.4.21.0005241559150.11687-100000@sunapee.transcept.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 24 May 2000 15:54:25 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000524215425.6B32937DA8@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Pavel Roskin writes...

> I've got C160L without monitor. I also don't know how to connect the
> console. There is a connector "HP-HIL" which is somewhat similar to RJ-45,
> but I don't know the wiring, and I'm not sure if it's the PDC console.

The console is probably set to graphics, but if you boot without a keyboard 
plugged in it should go to the first serial port(unless the console path is 
set to something weird).

> If the hard drive is connected, I don't see anything interesting except a
> packet on the ethernet interface containing words:
> 
> HP LAN loop back test packet. LAN2 driver version 1

It's booting off the primary path(the disk). The disk probably still has HP-UX 
on it and that packet is the result of the driver loading.

> If I disconnect the drive, the box sends a bootp request and then a tftp
> request.

In this case the primary path failed and it's trying the secondary path which 
is lan.

> I can feed it with the linux kernel, but I see nothing on the
> serial port.

A couple suggestions(obvious but worth checking),

- Make sure all keyboards are unplugged
- Have you tried both serial ports?
- Are you sure your serial console is working?
- If you are connecting computer to computer be sure to use a null modem cable.
- Use 9600,8,N,1

> If I use a fake kernel it is requested only once. The real kernel is
> requested two or three times. I believe, this means that IPL actually
> tries to "rewind" tftp to get the kernel.
> 
> I'm affraid that I need a version of IPL with serial console support to
> get any further. ipl_c.c contains encouraging words:
> 
>  * Revision 1.24 1999/10/15 19:30:30 deller
>  *
>  * The serial console works now !
> 

This only affect after the system starts booting. No matter what you should be 
seeing the firmware interface on the console(whatever it's set to).

If none of the above work it could be that your console path is set to 
something weird. You might be able to fix it by blindly changing it. If you 
can't get it to work let me know and I'll post a keystroke recipe to fix it.

-- 
Matt Taggart
taggart@fc.hp.com
