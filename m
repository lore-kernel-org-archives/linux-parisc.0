Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA12608
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Feb 2000 02:02:45 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id BAA05465
	for <parisc-linux@thepuffingroup.com>; Tue, 1 Feb 2000 01:03:46 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id BAA10229 for parisc-linux@thepuffingroup.com; Tue, 1 Feb 2000 01:03:45 -0700 (MST)
Date: Tue, 1 Feb 2000 01:03:45 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002010803.BAA10229@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Lan configuration failures
List-ID: <linux-parisc.vger.kernel.org>

Today some people have seen a couple of failures using the new ram disk
that willy generated. This new ram disk contains a program that tries
to configure a network card.  I have tracked down the problems, and
found them to both be configuration related:

    1) First, you must have CONFIG_INET set. If you don't, the socket
    call will fail, and you will get a "Bad file number" failure,
    due to the code trying to do an ioctl call on the -1 returned
    from the socket call failure.

    2) You must have the tulip driver configured in (CONFIG_DEC_ELCP)
    which also requires things like CONFIG_PCI, etc. If you have
    an older box that does not contain a tulip based network interface,
    or if you have a newer non Lasi box, you will not be able to
    get this to work. You must see "eth0:" debug output.

    If the hardware is not configured properly, the socket call will
    succeed, however the following ioctl will fail and you will get
    a "No such device" error.

Both of the failures will lead to the program exiting, which finally
will result in a "Kernel panic: Attempted to kill init!" failure.

John
jsm@fc.hp.com
