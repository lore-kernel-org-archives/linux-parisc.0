Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72655482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 04:37:52 -0600 (MDT)
Received: from weilbach (helo=localhost)
	by leo.uni-sw.gwdg.de with local-esmtp (Exim 3.16)
	id 15Wba0-0004uL-00
	for parisc-linux@lists.parisc-linux.org; Tue, 14 Aug 2001 12:37:48 +0200
Date: Tue, 14 Aug 2001 12:37:48 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <200107301550.RAA00052@sap-ag.de>
Message-ID: <Pine.LNX.4.33.0108141209060.12006-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Keyboard with 2.4.7-pa2
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I tried the current kernel-tarball linux-20010810.tar.gz and
compiled it successfully using the cross-compiler palinux-20010530
(too slow on my HP 712/60) on a Linux machine. I used the same
config-options as in the working 2.4.0-pa49 kernel I was using
successfully before, but I cannot use the keyboard, neither in X nor
on the console, although the kernel seems to have recognized the
keyboard (from dmesg):

Lasi PS/2 wait 2057
Lasi PS/2 wait 1881
PS/2 keyboard controller at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux controller at 0xf0108100 (irq 69) found, no device attached.

There was some discussion on keyboard problems some time ago, but
that was for [BC]* machines... Is this also known? Where can I find
more info (which logs) to help solve the problem?

Greetings,
	Peter.
