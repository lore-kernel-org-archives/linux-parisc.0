Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 360C5482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Apr 2001 14:39:42 -0600 (MDT)
Message-ID: <3AE9D90C.3AD819B2@esiee.net>
Date: Fri, 27 Apr 2001 22:39:40 +0200
From: Xavier Debacker <xavier.debacker@esiee.net>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Cc: puffin@esiee.net
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] iso 0.6 - request for LAST feedfack
List-ID: <linux-parisc.vger.kernel.org>

Hi PA/Linux users!

We had some feedback about the CD iso 0.6 and now consider releasing a
0.6-1 iso ASAP

We are now aware of some bugs, listed in the todo-list above, but maybe
we missed some
We would also like a 'wish-list', describing what users - and coders! -
would like to see on the CD

Now even simple remark is important.

Thanks.


Here are known bugs:

A message appears on serial console isos:
INIT: Id "1" respawning too fast: disabled for 5 minutes
solution:
comment (for serial console) or uncomment (for STI console) the line:
1:2345:respawn:/sbin/getty 38400 tty1
in /etc/inittab
todo: patch sys-install and readme.install

/dev/rtc is not created on the HDD
solution:
include /dev/rtc in cdrom:/install/base.tgz

keyboard bugs on STI isos, some scancodes are unrecognised.
solution:
hey, I'm working on it ;-) a patch proposal is coming soon.

keyboard bug:
doesn't work on C110
solution:
none for now.

press ESC in vi crashes the kernel. (non-exhaustive key list)
solution:
need to be tested:
it's due to either an error in the kernel
or vi needs to be recompiled.

the -I needs to be before ${DEVICE} in the sys-install script.



WISHLIST:
an eth0/hosts/resolv.conf/hostname configuration script.


Any other idea ?



Xavier Debacker
ESIEE Team
http://www.esiee.fr/puffin
