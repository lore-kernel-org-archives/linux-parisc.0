Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0769B4A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 11:32:17 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id MAA14527
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 12:32:01 -0600
Date: Tue, 13 Feb 2001 12:32:01 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Linux/HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <20010202025203.C32691@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0102131225540.14493-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 & Latest CVS Bits
List-ID: <linux-parisc.vger.kernel.org>

Howdy,

The latest CVS bits crater on my C100.  The last two messages are:

VFS: Mounted root (ext2 filesystem).
Warning: unable to open an initial console.

(Which is normal so far.)  Then I get a stack dump, a kernel fault and a
register dump.  As I recall, Grant said the stack dump itself isn't
helpful unless it's a kernel built with the default configuration.  I'd be
happy get that output if it would help.

As a side question, is it possible to have the system automatically reboot
after it encounters these errors?

Cheers,

- Greg
