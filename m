Return-Path: <JKonrad@linotype.com>
Received: from mail.linotype.com (events.linotypelibrary.com [213.61.7.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51AF14875
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Apr 2004 07:07:20 -0600 (MDT)
Received: from www.fonts.de (bhonet00003.fonts.de [193.103.125.42])
	by mail.linotype.com (Linotype Mail System) with ESMTP id 3A668B41AA
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Apr 2004 15:07:09 +0200 (CEST)
Received: from domino001.fonts.de (webmail.linotype.com [193.103.125.36])
	by www.fonts.de (Linotype Mail System) with ESMTP id B32114C0AB
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Apr 2004 15:07:06 +0200 (CEST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OF340E924B.3CE17FA1-ONC1256E6F.0047D690@fonts.de>
From: JKonrad@linotype.com
Date: Wed, 7 Apr 2004 15:06:01 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] problems installing on k 200
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I have just tried to install my K 200 with this netinstall.iso:

palinux-2.4.21-pa6-20030718-netinst.iso

which is the newest. This image allows me to fully install the machine using the CD, but when I reboot my machine, it boots Linux, then hangs, telling me:

bin/sh: /dev/ttyB0: No such device

It looks like the kernel on the CD supports ttyB0, but the kernel the CD installs does not. How can that be, and how can I fix this?

Yours,

Jay

P.S.: The latest full image debian-30r1-hppa-binary-NONUS.iso won't even let me install, it hangs immediately, telling me my console isn't right, although I set it on ttyB0 with IPL.

PPS: the e-mail for bug reports does not seem to work anymore
