Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-1.gci.net (mta-1.gci.net [208.138.130.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD9E0482A
	for <parisc-linux@parisc-linux.org>; Thu,  3 Jan 2002 19:59:47 -0700 (MST)
Received: from mmp-1.gci.net ([208.138.130.80]) by mta-1.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GPE8BM01.AJW for
          <parisc-linux@parisc-linux.org>; Thu, 3 Jan 2002 17:59:46 -0900
Received: from goliath.alaskatech.org ([24.237.5.207]) by
          mmp-1.gci.net (Netscape Messaging Server 4.15) with ESMTP id
          GPE8BN02.B4T for <parisc-linux@parisc-linux.org>; Thu, 3 Jan
          2002 17:59:47 -0900
Received: from goliath.alaskatech.org (goliath.alaskatech.org [24.237.5.207])
	by goliath.alaskatech.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA19183
	for <parisc-linux@parisc-linux.org>; Thu, 3 Jan 2002 17:56:21 -0900
Date: Thu, 3 Jan 2002 17:56:21 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0201031746180.19160-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Reset default console?
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

Okay, I finally got my EVC-VGA adapter from HP (who are actually the
cheapest place to get one!) and plugged in the A1097C monitor so I can
start using a local keyboard/mouse/monitor on the C180. I changed the
console in the PDC from serial_1 to graphics(0), checked that graphics(0)
is the local video adapter and said it's settings were 1280x1024@75hz,
then rebooted. After I got a completely scrambled screen, I remembered
that the A1097C is 1280x1024@72...

Unfortunately, since graphics(0) is valid, I no longer get PDC info on the
serial cable. Does anyone know how I can reset this, or force it to go
back to the serial console?

I also found one source online that said the A1097C monitor is
1280x960@75, rather than 1280x1024. Anyone at HP care to confirm or deny
this? :-)
