Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA06114
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 21:26:06 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id XAA05353
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Jun 1999 23:35:15 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <37744A6C.3A570E1E@thepuffingroup.com>
Date: Fri, 25 Jun 1999 23:35:08 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] [Fwd: new commits for the kernel]
List-ID: <linux-parisc.vger.kernel.org>

More good news from Helge...  I've also committed a few small fixes.

>From what I know, the descriptions in machines.h (which I transcribed on
a bus from Montreal to Ottawa in March) are reasonably up to date.

- Alex

-------- Original Message --------
Subject: new commits for the kernel
Date: Sat, 26 Jun 1999 04:00:03 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: Alex deVries <adevries@thepuffingroup.com>

Hi again.

I have committed again some changes, so that the kernel now uses the
real
linux-console-code, and at start it shows you the name of the machine
(mine is: Mirage Jr. (715/64)).
If your machine-name isn´t shown, take a look into machines.c &
setup.c..... esp. identification-code for PA2.x-Machines could be
updated.

The code for getcpu_info() [proc-fs] is also implemented.

Bye,
Helge Deller.
