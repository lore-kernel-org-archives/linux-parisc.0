Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA29204
	for <parisc-linux@puffin.external.hp.com>; Wed, 2 Feb 2000 14:54:59 -0700
Date: Wed, 2 Feb 2000 15:55:08 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Alex deVries <adevries@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot info from 715/64
In-Reply-To: <388F492B.1E8EF289@linuxcare.com>
Message-ID: <Pine.BSO.4.21.0002021544170.19835-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Wed, 26 Jan 2000, Alex deVries wrote:

> "Brian S. Julin" wrote:
> > Searching for devices in PDC firmware...   an older box...
> > Found devices:
> > 1. Mirage Jr GSC Builtin Graphics (10) at 0xf8000000, versions 0x12,
> > 0x0, 0x85, 0x0, 0x0
> > 
> > [...]  more devices, some of which I don't have.
> > 
> > 15. Mirage Jr (715/64) (0) at 0xfffbe000 versions 0x60a, 0x0, 0x4, 0x0,
> > 0x81
> > 16. Mirage Jr (1) at 0xfffbf000, vesions 0x4a, 0x0, 0x9, 0x0, 0x0
> > That's a total of 16 devices.
> 
> Which ones don't you have?  Could you paste the entire list?

Actually I'm typing by hand since I'm not using a serial console :).
Of the devices listed, the one I know for sure I don't
have is the floppy:

8. Mirage Jr Core PC Floppy (10) at 0xf010a000, versions 0x28, 0x0, 0x83,
0x0, 0x0

...there's also these which are suspect, since I have HIL, though
their may be PC keyboard ports back there I haven't looked.....

9. Mirage Jr Core PC Keyboard (10) at 0xf0108000, versions 0x28, 0x0,
0x84, 0x0, 0x0
10. Mirage Jr Core PC Keyboard (10) at 0xf0108100, versions 0x28, 0x0,
0x84, 0x0, 0x0

Question for the kernel high priests on the list -- is the rest of
the input-linux stuff going into the 2.3 series soon -- if so I think 
I'll work on converting the HIL driver over to linux-input and fitting
the linux-input patch to this kernel (which luckily there exists one for).

--
P.S. Sorry about bounced mail; have no idea what that was all about.
