Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id C543E482A; Mon, 23 Jul 2001 15:21:04 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6540EB00C; Mon, 23 Jul 2001 22:22:35 +0100 (BST)
Date: Mon, 23 Jul 2001 22:22:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20010723222235.E4597@linuxcare.com>
References: <200107232044.OAA23340@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107232044.OAA23340@puffin.external.hp.com>; from rhirst@puffin.external.hp.com on Mon, Jul 23, 2001 at 02:44:51PM -0600
Subject: [parisc-linux] Re: Update debian-configs for 2.4.6
List-ID: <linux-parisc.vger.kernel.org>

I turned off aic7xxx for 64 bit, as it wanted endian.h which wasn't
available.  Have built kernel images, and then built boot-floppies
with them.

B180 graphical test:

  Keyboard was dead on boot, unplug/replug didn't help

B180 serial console test:

  Keyboard was dead after reboot in to second stage install

A500 serial console test:

  Keyboard was dead after reboot in to second stage install

Richard
