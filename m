Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CA4C482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Jun 2001 02:06:23 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 73855B007; Sun,  3 Jun 2001 09:03:09 +0100 (BST)
Date: Sun, 3 Jun 2001 09:03:09 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Jim Buttafuoco <jim@buttafuoco.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] .9 install problems on a 735
Message-ID: <20010603090309.G25745@linuxcare.com>
References: <200106022131.RAA28418@p2.buttafuoco.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200106022131.RAA28418@p2.buttafuoco.net>; from jim@buttafuoco.org on Sat, Jun 02, 2001 at 05:31:33PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 02, 2001 at 05:31:33PM -0400, Jim Buttafuoco wrote:
> Richard,
> 
> Here is my /var/log/messages file, there are a few errors in it.  

Nothing to worry about here, all the 'expr' and '[' errors are
because of missing features in our build of busybox, so everyone
will be seeing those.

Richard


> Apr 27 14:48:52 (none)  syslogd started: BusyBox v0.51
> (2001.05.18-08:42+0000)
> Apr 27 14:50:57 (none) user.info dbootstrap[34]: mounting /dev/sda2 at
> /target
> Apr 27 14:51:09 (none) user.info dbootstrap[34]: mounting /dev/sda4 at
> /target/usr
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: Internet Software
> Consortium DHCP Client 2.0pl5
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: Internet Software
> Consortium DHCP Client 2.0pl5 
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: Copyright 1995, 1996,
> 1997, 1998, 1999 The Internet Software Consortium.
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: Copyright 1995, 1996,
> 1997, 1998, 1999 The Internet Software Consortium. 
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: All rights reserved.
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: All rights reserved. 
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: 
> Apr 27 14:51:26 (none) user.info dbootstrap[34]:  
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: Please contribute if
> you find this software useful.
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: Please contribute if
> you find this software useful. 
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: For info, please
> visit http://www.isc.org/dhcp-contrib.html
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: For info, please visit
> http://www.isc.org/dhcp-contrib.html 
> Apr 27 14:51:26 (none) daemon.info dhclient-2.2.x: 
> Apr 27 14:51:26 (none) user.info dbootstrap[34]:  
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: [: 2: unexpected
> operator 
> Apr 27 14:51:26 (none) user.info dbootstrap[34]: [: 2: unexpected
> operator 
> Apr 27 14:51:27 (none) daemon.info dhclient-2.2.x: Listening on
> LPF/eth0/08:00:09:48:34:29
> Apr 27 14:51:27 (none) user.info dbootstrap[34]: Listening on
> LPF/eth0/08:00:09:48:34:29 
> Apr 27 14:51:27 (none) daemon.info dhclient-2.2.x: BOOTREPLY from
> 192.1.3.13
> Apr 27 14:51:27 (none) user.info dbootstrap[34]: BOOTREPLY from
> 192.1.3.13 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: expr: not found 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: [: 2: unexpected
> operator 
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: [: 2: unexpected
> operator 
> Apr 27 14:51:28 (none) daemon.info dhclient-2.2.x: bound to 192.1.3.113
> -- renewal in 8000 seconds.
> Apr 27 14:51:28 (none) user.info dbootstrap[34]: bound to 192.1.3.113 --
> renewal in 8000 seconds. 
> Apr 27 14:51:28 (none) user.err dbootstrap[34]: The network has been
> successfully configured using DHCP/BOOTP.
> Apr 27 14:51:42 (none) user.info dbootstrap[34]: palo version 0.86
> bame@palinux Fri May 11 16:10:24 MDT 2001 
