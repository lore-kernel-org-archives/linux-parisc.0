Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21EA2482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Jun 2001 07:13:27 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A6433B007; Sun, 10 Jun 2001 14:09:27 +0100 (BST)
Date: Sun, 10 Jun 2001 14:09:27 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010610140927.C16532@linuxcare.com>
References: <20010608115550.J16532@linuxcare.com> <Pine.LNX.4.33.0106081924340.9668-100000@leo.uni-sw.gwdg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0106081924340.9668-100000@leo.uni-sw.gwdg.de>; from weilbach@uni-sw.gwdg.de on Fri, Jun 08, 2001 at 07:28:51PM +0200
Subject: [parisc-linux] Re: Kernel faults on boot
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 08, 2001 at 07:28:51PM +0200, Peter Weilbacher wrote:
> I have played with a 712/60 and had the same problem as Frank. I got
> it installed over the first reboot, but after a the next one on
> every reboot it crashed with Kernel faults at cron.
> 
> Now I have reinstalled and I do not get over the reboot. Is it
> explained somewhere, which I need to write down, to help you debug
> the problem? (I guess it doesn't make it into any logs, which I
> could look at by putting the disk on another machine.)

I expect to get my hands on a 712 very soon, so I'll see if I can
reproduce this problem.  So far as what you can write down for me...
Usually a kernel crash gives a stack dump followed by the fault type
and address, then a bunch of registers.  I'm not too interested in the
stack dump (which has probably scrolled off the screen, anyway), but
everything after the stack dump would be useful.

You could interact with the IPL and add 'init=/bin/sh' to the parameters.
It might at least boot to a shell prompt then.  It is unlikely to be
cron itself that causes the problem, but just in case you could disable
it by renaming /usr/sbin/cron.  Something like

boot to a shell
e2fsck /dev/sda<whatever your root device is>
mount -o remount,rw /
mv /usr/sbin/cron /usr/sbin/cron.ori
sync
mount -o remount,ro /
hit the reset button and try a normal boot again


Thanks,
  Richard
