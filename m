Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id AD310482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 16:32:23 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Andrew Gaylard <andrew.gaylard@za.didata.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Dead keys in X
Date: Tue, 31 Jul 2001 00:31:38 +0200
References: <3B657709.4050201@za.didata.com>
In-Reply-To: <3B657709.4050201@za.didata.com>
MIME-Version: 1.0
Message-Id: <20010730223223.AD310482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Andrew,

On Monday 30 July 2001 17:02, Andrew Gaylard wrote:
> ....
> I then decided to give X a try, based on Helge Deller's
> message in
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013241.html
> (thanks, Helge!)

I assume you meant this link (just for the record):
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/012972.html

>
> This worked, but...
>
> The 'i' and 'o' keys in X are dead.  The 'i'-key at least
> sends a keycode-224 to X (as viewed in xev), but if I try
>
> 	xmodmap -e "keycode 224 = i"
>
> I get the error:
> 	xmodmap: commandline:0: bad keycode value (out of range)
>
> The 'o'-key, on the other hand, doesn't send anything at all.
> Where do I begin to track this down?  I've checked that my
> XF86Config-4 file is set up as described by Helge.  My
> /etc/X11/xkb/rules/xfree86 file also looks OK.
>
> I've tried various other maps, such as hp-101 and pc101, as
> well as several keymaps from xkeycaps, but they either scramble
> the layout completely, or have no effect.

I have the same problem as you, but was too lazy to look any further yet.
On the other hand I don't think other keymaps are more suitable, and
the easiest way would be to get it fixed with your xmodmap approach 
and in the long term with a fixed pre-installed keymap from the XFree86
packages.

> Also, I'm using a MS-compatible serial-mouse.  Although it works,
> it is really s-l-o-w.  I have a HIL-PS/2 adapter box, but will
> it work with a PS/2 mouse?  If so, will the mouse device change
> to something like /dev/psaux?

No idea since I don't have such a adapter box myself. Maybe you 
should just try and let us know since you are not the first one asking.

> Lastly, is anyone working on HIL mouse support?  If not, then I
> wouldn't mind having a go.

Currently no one is working on such a driver, but instead there is a 
generic HIL-driver in progress. If this driver is finished a generic 
HIL-mouse-driver-plugin should be easy.
In any case, just go ahead if you want.

> Thanks to everyone for making this port such a success!

Thanks


Greetings,
Helge
