Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc3-hems4-0-cust183.bre.cable.ntl.com [213.107.179.183])
	by dsl2.external.hp.com (Postfix) with ESMTP id 978E4482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 19:12:11 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C7C88B00C; Thu, 18 Oct 2001 22:46:44 +0100 (BST)
Date: Thu, 18 Oct 2001 22:46:44 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?DUTOT_St=E9phane?= <stephane.dutot@exlicite.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PPTP and PPPOE under Debian HPPA Linux.
Message-ID: <20011018224644.U11105@linuxcare.com>
References: <01a501c1565e$c9ce4e60$9601a8c0@utopia>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <01a501c1565e$c9ce4e60$9601a8c0@utopia>; from stephane.dutot@exlicite.net on Tue, Oct 16, 2001 at 06:22:44PM +0200
List-ID: <linux-parisc.vger.kernel.org>

I've just had a look at this.  Seems to be a problem related to
the kernel trying to invoke non-existant usermode helper progs.

I created a script /sbin/hotplug containing just


#!/bin/sh
echo hotplug: $* > /dev/console


and my kernel no longer crashes when trying to establish an async
ppp link.  Instead, I get this in syslog:

Mar 20 16:24:33 merlin pppd[221]: Serial connection established.
Mar 20 16:24:34 merlin insmod: Note: /etc/modules.conf is more recent than /lib/modules/2.4.9-32/modules.dep
Mar 20 16:24:34 merlin pppd[221]: using channel 1
Mar 20 16:24:34 merlin pppd[221]: Using interface ppp0
Mar 20 16:24:34 merlin pppd[221]: Connect: ppp0 <--> /dev/ttyS1
Mar 20 16:24:34 merlin pppd[221]: read: Resource temporarily unavailable       
Mar 20 16:24:34 merlin pppd[221]: read /dev/ppp: Resource temporarily unavailable
Mar 20 16:24:35 merlin pppd[221]: read: Resource temporarily unavailable
Mar 20 16:24:35 merlin pppd[221]: read /dev/ppp: Resource temporarily unavailable
Mar 20 16:24:35 merlin pppd[221]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x7837ff6f> <pcomp> <accomp>]
Mar 20 16:24:35 merlin pppd[221]: read: Resource temporarily unavailable
Mar 20 16:24:35 merlin pppd[221]: read /dev/ppp: Resource temporarily unavailable
Mar 20 16:24:36 merlin pppd[221]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x7837ff6f> <pcomp> <accomp>]
Mar 20 16:24:38 merlin pppd[221]: sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x7837ff6f> <pcomp> <accomp>]
etc
etc

I guess next I need to figure out what is causing the "Resource
temporarily unavailable" (assuming that is an error).

iirc we have had problems with non-existant usermode helpers before,
and had to turn module support off until we had modutils ported.

Richard


On Tue, Oct 16, 2001 at 06:22:44PM +0200, DUTOT Stéphane wrote:
> Hello,
> 
> I have a HP 712/100, I will install my HP station on Adsl gateway. For this, i need make a pptp or pppoe connexion.
> 
> When, the debian install kernel 2.4.0-32, when i start pppoe or pptp connexion, the pppd is launch and just after all system is block. With the last kernel version (2.4.9-pa45) downloaded on paris-linux site. When, i start pptp connexion, he has a kernel panic.
> 
> I have check the mailing-list archive. And i haven't found a begin of solution.
> 
> Maybe, do you have see this problem under the past ?
> 
> Thanks Stéphane DUTOT.
