Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29932482A
	for <parisc-linux@parisc-linux.org>; Mon, 28 Jan 2002 23:20:09 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GQOS9F01.Y1U for
          <parisc-linux@parisc-linux.org>; Mon, 28 Jan 2002 21:20:03 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GQOS9F02.CBO for <parisc-linux@parisc-linux.org>; Mon, 28 Jan
          2002 21:20:03 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA01968
	for <parisc-linux@parisc-linux.org>; Mon, 28 Jan 2002 21:14:55 -0900
Date: Mon, 28 Jan 2002 21:14:55 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0201282102210.1826-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] X on 715/100
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

There was a bit of chat about trying to make this work. Just figured I'd
mention that I've got X running on my 715/100 and A1097C monitor, with KDE
as the WM (not by choice, but it's working, so...)

In a nutshell, I installed the X packages, then 'dpkg-reconfigure
xserver-xfree86' and chose 'advanced'. Entered info as needed (monitor
settings 1280x1024, 78 horiz rate, 72 vertical refresh), then 8-bit color
default. Everything else was defaulted correctly (I believe).

http://www.alaskatech.org/stuff/XF86Config-4 is my working config file.

KDE isn't the speediest window manager for this machine - from 'startx'
until the system is responsive is around a minute or two, maybe a bit
more. But, it's working, and once loaded it isn't too bad. Something like
icewm-lite would probably be much speedier.

(Amazing what you can accomplish when someone says, "Hey, I'd like to buy
your 715 if you can get X working on it..." <g>)
