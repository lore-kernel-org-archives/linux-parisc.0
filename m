Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB8DE482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 04:59:38 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 285D9B007; Fri,  8 Jun 2001 11:55:50 +0100 (BST)
Date: Fri, 8 Jun 2001 11:55:50 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: E Frank Ball <frankb@efball.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dselect problems
Message-ID: <20010608115550.J16532@linuxcare.com>
References: <20010606140212.A11814@zouave.sonic.net> <20010606141807.B11814@zouave.sonic.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010606141807.B11814@zouave.sonic.net>; from frankb@efball.com on Wed, Jun 06, 2001 at 02:18:07PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jun 06, 2001 at 02:18:07PM -0700, E Frank Ball wrote:
> On Wed, Jun 06, 2001 at 02:02:12PM -0700, E Frank Ball wrote:
> } 
> } I have a 712/80 and a graphics monitor (HP A1097C).  I got the base
> } system running from the palinux-0.9-32sti.iso CD.
> 
> It had rebooted ok a couple of times, but now it get to starting cron,
> then register dumps with a kernel fault.

As mentioned in the errata <http://parisc-linux.org/release-0.9/errata.html>,
sti installs have a tendency to crash on reboot at the moment.  If this is a
repeatable problem, I'd be interested in the register dump.

Richard
