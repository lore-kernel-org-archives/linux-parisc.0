Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BFF6482D
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Nov 2001 17:21:05 -0700 (MST)
Received: from gmx.at ([62.178.92.247]) by viefep14-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20011104002103.SZGP9391.viefep14-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sun, 4 Nov 2001 01:21:03 +0100
Message-ID: <3BE489EB.CBD535AD@gmx.at>
Date: Sun, 04 Nov 2001 01:20:59 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Old but open problem of Xfree on 2.4.9-pa75
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

Hello !

Starting current Xfree-4.1.0.1 the system reports the already described

FBIOPUT_VSCREENINFO: Invalid argument

(a message not written into the log file !!)

This message is written after 

(**) FBDev(0): Using "Shadow Frambuffer"

The resulting reaction is the fatal error with an abort.


What is the reason for that ? 
By the way, the server also reports not having
the PCI stuff, which is perhaps not compiled in my kernel, but that
seems not
to be the problem here.

How can this can be solved. My config uses 8 bbp, the STI console driver
inside
the kernel also reports 1280x1024-8 ! So this should run ....

Please help

Christoph P.


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
