Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB0E5482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Jun 2001 05:54:24 -0600 (MDT)
Received: from weilbach (helo=localhost)
	by leo.uni-sw.gwdg.de with local-esmtp (Exim 3.16)
	id 159QGu-0002cE-00
	for parisc-linux@lists.parisc-linux.org; Mon, 11 Jun 2001 13:54:16 +0200
Date: Mon, 11 Jun 2001 13:54:16 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel faults on boot
In-Reply-To: <20010610140927.C16532@linuxcare.com>
Message-ID: <Pine.LNX.4.33.0106111350100.9668-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 10 Jun 2001, Richard Hirst wrote:

> boot to a shell
> e2fsck /dev/sda<whatever your root device is>
> mount -o remount,rw /
> mv /usr/sbin/cron /usr/sbin/cron.ori
> sync
> mount -o remount,ro /
> hit the reset button and try a normal boot again

If I take cron out like that, then the next job (atd) is the one
which triggers the kernel fault. An error message about problems
with <sth>cron / <sth>atd is displayed, but I am never fast enough
to read and unterstand it entirely, before the stack dump causes it
to scroll off the screen.

Is it normal for PA-RISC Linux, that the typical Linux Key-Combo
<Shift>-<PgUp/Down> does not work on the console? Or is that even
normal for Debian?

Greetings,
	Peter.
