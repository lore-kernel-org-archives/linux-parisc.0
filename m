Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA15678
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 May 2000 16:15:04 -0600
Message-ID: <20000524161458.A15622@puffin.external.hp.com>
Date: Wed, 24 May 2000 16:14:58 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Pavel Roskin <pavel_roskin@geocities.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Serial support in IPL
References: <Pine.LNX.4.21.0005241559150.11687-100000@sunapee.transcept.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005241559150.11687-100000@sunapee.transcept.com>; from Pavel Roskin on Wed, May 24, 2000 at 05:22:46PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 24, 2000 at 05:22:46PM -0400, Pavel Roskin wrote:
> I've got C160L without monitor. I also don't know how to connect the
> console. There is a connector "HP-HIL" which is somewhat similar to RJ-45,
> but I don't know the wiring, and I'm not sure if it's the PDC console.

This is the keyboard connector.  Some older C-class workstations have both
HIL and PS/2; forget it exists.

> If I use a fake kernel it is requested only once. The real kernel is
> requested two or three times. I believe, this means that IPL actually
> tries to "rewind" tftp to get the kernel.

IPL, parts of the kernel and the boot interface all use the console device
selected in nvram.  my guess is this is graphics (since you don't see
anything on your serial port when booting the machine ?), so you should
either connect a monitor or try to remove all keyboards.

> I'm affraid that I need a version of IPL with serial console support to
> get any further. ipl_c.c contains encouraging words:

You should make sure you have a working firmware console first (IPL does
not really care whether it's connected to serial or graphics).

>  * Revision 1.24 1999/10/15 19:30:30 deller
>  *
>  * The serial console works now !

That comment is in ipl_c.c only because the command line was changed and
it was set there back then.

	Philipp Rumpf
