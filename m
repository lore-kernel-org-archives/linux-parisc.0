Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-server4.tampabay.rr.com (smtp-server4.tampabay.rr.com [65.32.1.43])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6420E4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 12:19:33 -0700 (MST)
Received: from pentium-200 (226.2.35.65.cfl.rr.com [65.35.2.226])
	by smtp-server4.tampabay.rr.com (8.12.2/8.12.2) with SMTP id gBQJIkeL019418
	for <parisc-linux@lists.parisc-linux.org>; Thu, 26 Dec 2002 14:19:24 -0500 (EST)
Reply-To: <jkirk9@cfl.rr.com>
From: "John K." <jkirk9@cfl.rr.com>
To: "parisc-linux Mailing list" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 26 Dec 2002 14:16:20 -0500
Message-ID: <NDBBLBLICLEJGEFEEOCICEDMCDAA.jkirk9@cfl.rr.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] HIL Keyboard and mouse with KDE
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

All

I have a 710 with HIL keyboard and mouse and have installed
debian-30r0-hppa.  When I boot the system I get the graphical login screen
but the keyboard is not working correctly.  Most of the keys don't seem to
do anything and the ones that do something put the wrong character on the
screen.  For example j is "/", the right "Extend Char" is 1, left "Extend
Char" is 2.

I found the HOWTO: Using HIL keyboard and HIL mouse on PARISC by Helge
Deller, Jun 30, 2002.

1.  I have the files /dev/input/mice, /dev/input/mouseX and
/dev/input/eventX where X is 0, 1, 2 and 3.

2.  I did not have a /etc/gpm.conf file so created one with the two lines:
device=/dev/input/mice
type=imps2

3.  I modified the etc/X11/XF86Config-4 as indicated in the HOWTO.

4.  Rebooted the system.

What do I do now?

Background:  When I first installed from the CD one of the first things that
is to do from the install menu is "Configure Keyboard" if I did that and
selected the option that would be the one I would think correct "Qwerty US"
the keyboard was also hosed so I just skipped that step.  After successfully
installing PARISC Linux it would come up with a command line login prompt
instead of the graphical login screen that I have now.  I started getting
the graphical login screen after fixing the video sections in the
XF86Config-4.

PS:  Is there someway to "interrupt" the boot process so that I get the
command line login instead of the graphical login screen?

PPS:  There is no way to "exit" from the nano-tiny editor.

Thanks for any and all help with my problems.

John Kirk
