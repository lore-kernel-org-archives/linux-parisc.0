Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5A6F482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Aug 2001 15:08:00 -0600 (MDT)
Sender: chris@dsl2.external.hp.com
Message-ID: <3B8813A8.ECA75408@gmx.at>
Date: Sat, 25 Aug 2001 23:07:52 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	"MEYER,ALAN C. (HP-FtCollins,ex1)" <alan_meyer@hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Status: HP 9000/856, E55 Server with PA-Linux
List-ID: <linux-parisc.vger.kernel.org>

Congratulations, PA Linux is frowing and growing .....

After this 3/4 year, I want to ask again, if there are
news concerning the support or even the documentation of
the proprietary HP machines, like e.g. the E55 Server (9000/856).

As you know from the list, I had success in booting Linux
on this E55 with a self written "PDC console device driver".
So it was possible to boot E55 as diskless machine. But
a "diskless server" is not the best....
But it worked even with login, etc....

For running Linux, only three devices are important to
activate (2 of them necessary, the 3rd is optional):
* MUX multi serial port (also for serial console,
	which I have work arounded with my PDC driver...)
* SCSI Devices
* optional: Parallel interface

I hope you can tell me, that there will be the support
or the documentation, so that I can write or help writing
drivers, if my spare time is enough and my skills will
be sufficient, ...

Please remail...

With friendly regards
	Christoph P.


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
