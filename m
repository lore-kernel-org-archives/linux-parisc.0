Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4B40482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Jun 2001 06:23:55 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 95C83B007; Mon, 11 Jun 2001 13:19:49 +0100 (BST)
Date: Mon, 11 Jun 2001 13:19:49 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Kernel faults on boot
Message-ID: <20010611131949.I16532@linuxcare.com>
References: <20010610140927.C16532@linuxcare.com> <Pine.LNX.4.33.0106111350100.9668-100000@leo.uni-sw.gwdg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0106111350100.9668-100000@leo.uni-sw.gwdg.de>; from weilbach@uni-sw.gwdg.de on Mon, Jun 11, 2001 at 01:54:16PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 11, 2001 at 01:54:16PM +0200, Peter Weilbacher wrote:
> On Sun, 10 Jun 2001, Richard Hirst wrote:
> 
> > boot to a shell
> > e2fsck /dev/sda<whatever your root device is>
> > mount -o remount,rw /
> > mv /usr/sbin/cron /usr/sbin/cron.ori
> > sync
> > mount -o remount,ro /
> > hit the reset button and try a normal boot again
> 
> If I take cron out like that, then the next job (atd) is the one
> which triggers the kernel fault. An error message about problems
> with <sth>cron / <sth>atd is displayed, but I am never fast enough
> to read and unterstand it entirely, before the stack dump causes it
> to scroll off the screen.
> 
> Is it normal for PA-RISC Linux, that the typical Linux Key-Combo
> <Shift>-<PgUp/Down> does not work on the console? Or is that even
> normal for Debian?

I wouldn't expect that to work once the kernel has crashed, unfortunately.

Richard
