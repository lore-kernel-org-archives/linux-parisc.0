Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from nsr-temip1.sps.ics.didata.com (unknown [196.38.213.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5917A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 09:02:53 -0600 (MDT)
Received: from za.didata.com (localhost [127.0.0.1])
	by ndx-andrewg.sps.ics.didata.com (SGI-8.9.3/8.9.3) with ESMTP id RAA90505
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jul 2001 17:02:35 +0200 (SAT)
Message-ID: <3B657709.4050201@za.didata.com>
Date: Mon, 30 Jul 2001 17:02:33 +0200
From: Andrew Gaylard <andrew.gaylard@za.didata.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Dead keys in X
List-ID: <linux-parisc.vger.kernel.org>

Hello All,

After lurking daily on the mailing archives for 2 years,
I decided that the time has finally come to give PARISC-Linux
a spin.  I burned a CD of the 0.9.2 release, booted up my
715/100 (STI console, HIL keyboard & mouse) and it worked
on the first install.  Excellent work!

I then decided to give X a try, based on Helge Deller's
message in http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013241.html
(thanks, Helge!)

This worked, but...

The 'i' and 'o' keys in X are dead.  The 'i'-key at least
sends a keycode-224 to X (as viewed in xev), but if I try

	xmodmap -e "keycode 224 = i"

I get the error:
	xmodmap: commandline:0: bad keycode value (out of range)

The 'o'-key, on the other hand, doesn't send anything at all.
Where do I begin to track this down?  I've checked that my
XF86Config-4 file is set up as described by Helge.  My
/etc/X11/xkb/rules/xfree86 file also looks OK.

I've tried various other maps, such as hp-101 and pc101, as
well as several keymaps from xkeycaps, but they either scramble
the layout completely, or have no effect.

This puzzles me, since the STI console works fine with those
keys.  Where are the scancodes from the HIL bus mapped to X
keycodes? (I presume that it uses scancodes like a normal PC
keyboard... right?)  Or is there another layer needing configuring,
which maps keyboard-specific scancodes to linux-generic keynames to
X keycodes?

Also, I'm using a MS-compatible serial-mouse.  Although it works,
it is really s-l-o-w.  I have a HIL-PS/2 adapter box, but will
it work with a PS/2 mouse?  If so, will the mouse device change
to something like /dev/psaux?

Lastly, is anyone working on HIL mouse support?  If not, then I
wouldn't mind having a go.

Thanks to everyone for making this port such a success!


-- 
Andrew G
