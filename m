Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD95055D2.dip.t-dialin.net [217.80.85.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9AC54A19
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Feb 2001 10:31:38 -0700 (MST)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f16HVR102991
	for <parisc-linux@lists.parisc-linux.org>; Tue, 6 Feb 2001 18:31:28 +0100
Date: Tue, 6 Feb 2001 18:31:26 +0100 (CET)
From: "M. Grabert" <xam@deathsdoor.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102061808500.2465-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Generic Parisc Linux Kernel Questions & 9000/730 success report
List-ID: <linux-parisc.vger.kernel.org>

Hello there!

I'm lucky again :)))))


Finally I got my HP box bootin & running Linux *smile*

There are some minor troubles, but I think these will be fixed soon,
e.g.

smb won't compile
netware won't compile
ppp_sync won't compile
fbcon-sti won't compile (at least when I don't compile STI-console)
hwclock doesn't work (can't use /dev/rtc), 'though I seems the
   time and date is read correctly (but hwclock can't set them).
   Is this a known problem ?

I think the "do_page_fault() messages & stack traces"  (, which are
   not seen when I switch VERBOSE=no in /etc/defaults/rcS,)
   are because of some segfaults whilst running some rc-scripts.
   Hope that will be fixed in the new nfsroot.

Many segfaults in sourcing / executing rc-boot-scripts and
   shutdown-scripts. Therefore (I think) I can't reboot/shutdown
   properly (last message is: "sending all processes the TERM signal").
   At least the HP doesn't reboot. But e2fsck reports ext2 is clean.

Is the well known problem of the missing termcap fixed in the new nfsroot?

Is is enough to copy nfsroot onto the scsi disc and adopt /etc/fstab,
   or should I use base.tgz ? what's the difference ?

Mhhh. missing ftp and (open)ssh, strace in (old) nfstools. Are they in the
   new one?

Does the new xc fix major problems or is it just a a little update ?
   IMHO there was a lot done for parisc64, but also for parisc(32) ?



Some questions regarding kernel support of...

networking: can I use all the protocols like ipv6, routing, masq etc?

WAX: is it still not usable ? if not, can I use all the Linux-2.4 isa
   drivers (easily) ?

modules: are kernel modules supported (fully) on parisc ?



greetings & TIA
                  max


PS: yes, quite alot of questions, but I hope that helps others, too!
