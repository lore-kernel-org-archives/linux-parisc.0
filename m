Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ra.abo.fi (ra.abo.fi [130.232.213.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id EDB4A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 23:59:41 -0700 (MST)
Received: from pctest10 (pctest10.abo.fi [130.232.17.64])
	by ra.abo.fi (8.10.1/8.10.1) with SMTP id g0L6xcT26637
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Jan 2002 08:59:39 +0200 (EET)
Message-ID: <002a01c1a249$31f95260$4011e882@abo.fi>
From: "Kaj-Michael Lang" <milang@tal.org>
To: <parisc-linux@lists.parisc-linux.org>
References: <DLEJJFGDAJICFFBHFNCDGEBBCEAA.bjorn.bylander@telia.com>  <20020121030235.C37E737D2B@carmen.fc.hp.com>
Date: Mon, 21 Jan 2002 08:59:37 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] sti console (was: Booting to ISL with Linux installed)
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

> BTW- I recently converted a couple 712s with serial console *back* to
> graphics console since the sti-fb stuff is working so well now.

This reminds me of the reason why I had to move to serial console, not
because of lack of
support but because the monitor I had at the time (brand new 19" sony)
didn't work with my
712. Or it does.. but the screen flickers sometimes with just a couple of
seconds appart, sometimes it can take a couple of minutes, but it just won't
stop. It does it with another cheap 15", but I now got a another monitor, a
17" Panasonic and the sti console work fine it, no blinking.
Does anyone know what could be the cause for the 19" sony not to function
correctly. It works fine with a PC, Mac and even an old Sun3.

--
Kaj-Michael Lang, milang@tal.org
