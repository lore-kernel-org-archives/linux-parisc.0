Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 5BF29482A
	for <parisc-linux@parisc-linux.org>; Wed,  4 Jul 2001 08:53:21 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: colas.sebastien@free.fr, debian-hppa@lists.debian.org
Date: Wed, 4 Jul 2001 16:52:06 +0200
References: <994234306.3b42cfc21ab7f@imp3-1.free.fr>
In-Reply-To: <994234306.3b42cfc21ab7f@imp3-1.free.fr>
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Message-Id: <20010704145321.5BF29482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: X Windows under HP
List-ID: <linux-parisc.vger.kernel.org>

Note: CC'd to parisc-linux@parisc-linux.org

On Wednesday 04 July 2001 10:11, colas.sebastien@free.fr wrote:
>
> First I have an HP Apollo 715/100 with about 100 Mo RAM.
> I finnally succed in installing linux on it after 4 CD burning,
> can you make your .iso directly bootable please.

All of our until now released iso images are and have been
bootable. Maybe you have problems booting the cd, because:

a) you have an "old" cdrom-drive, which can't handle burned cd's.
(I have the same problem here with a Philips PCA80SC cdrom-drive, 
which also doesn't seem to be able to read from a not-self-burned 
credit-card cd :-)
or:
b) you have used a stupid windows program to burn your CD and 
didn't burned it 1:1.

> When i boot under Linux I have a specific harddrive for it,
> sometimes and the end of the procedure when the login must
> be displayed the system crash and I saw all the registry
> variables. I have the same problem with 'vi' when I press
> ctrl-d when I am at the end of the document my linux crash.
> Do you know that problem, is there a fix ?

I have fixed the "vi"-problem in one of the latest kernel versions, but 
can't say you anything about your other problem.

> When I installed my linux I saw there is a package naming
> something like X-Windows-core.hppa.deb, there are also some
> packages like xtris. I installed all these package.
> I searched the XFreeConfig or Xstart or all the program with
> a 'X' and there are nothing.
> So the question is:
> - Is X Window supported on my system ???

Yes - But AFAIK the X-Framebuffer server (xfbdev) is the only supported 
one at this moment. Your 715/100 has an artist gfx chip, so it should work 
for you.

> - If yes what shall I do to run it ???

a) Install the latest kernel and make sure that stifb is activated and used!
(THIS WILL ONLY WORK FOR SOME OF THE 712 AND 715 MODELS!)
b) Install the xserver-xfree86, xfonts*, xlibs*, xbase* and xutils packages
c) Since you have a 715/100 system I assume you have a HIL keyboard.
In this case you have to modify your /etc/X11/XF86Config-4 in the 
keyboard-InputDevice-section:
Option	"XkbdRules"	"xfree86"
Option	"XkbModel"	"hphil"
and insert the following "hphil" line to /etc/X11/xkb/rules/xfree86:
  hp            =       xfree86         pc(pc104)
  hphil         =       hp(hil)         hp(hil)	<--- Add this one !!
d) The HIL-mouse is not supported yet. Instead I attached a serial mouse
to one of the serial ports and modified /etc/X11/XF86Config-4 to use this
mouse.
e) As graphic driver use the fbdev-driver in your "Device" section:
Driver	"fbdev"
f) Now you should be able to boot up the X server and use a simple 
window-manager like vtwm.

> - I supposed the X Window is a modified version to run under
>   HP. Am I rigth ?

No. But it may become true if we want to support other graphic chips in
newer HP systems.

Greetings,
Helge
