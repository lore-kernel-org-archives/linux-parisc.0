Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA04386
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Dec 2000 09:22:13 -0700
Date: Sat, 23 Dec 2000 17:25:04 +0100 (CET)
From: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>
To: Matthew Wilcox <matthew@wil.cx>
cc: Jens Trzaska <j_trzaska@gmx.net>, <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] trouble booting from palinux-0.5.iso on 712/80
In-Reply-To: <20001223154951.B20418@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSF.4.30.0012231714501.5467-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 23 Dec 2000, Matthew Wilcox wrote:

> On Sat, Dec 23, 2000 at 04:14:15PM +0100, Jens Trzaska wrote:
> > Since yesterday i'm the owner of a HP 712/80 and i've searched along
> > the net to find an OS which is able to run on this box. When i found
> > palinux i downloaded the palinux-0.5.iso. But the booting process
> > doesn't seem to be successful. In the readme it says that i should
> > get a login prompt...but i don't get the prompt. The system stops
> > when saying:
> > "Switching from PDC console"
>
> This ought to be, but isn't, in the FAQ.  Could someone who knows more about
> the 0.5 CD-ROM than I do write up the answer for the FAQ?
>
> Basically, your kernel is using the wrong console device.  try editing the
> command line to specify `console=tty0'.

Hi,

I do not know much about it but running this image on a 715/100.
I think he does not use serial console:
On the palinux-0.5.iso it always switches to serial console and you
do not see anything more on the screen. Please use a null modem
cable and plug it into first serial port of your 712 and to
another PC.  Then use cu, minicom, hyperterminal (for win32) or
some similar terminal program to see if boot and init fail.
If not you get a Login prompt on serial console and can install
and afterwards after another reboot setup networking (as described
in the readmes) and use ssh to connect to the box.
As far as I know no screen is supported on that image (never tried
it after installing).

hope that helps.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
