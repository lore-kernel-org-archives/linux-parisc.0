Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81E8C4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Feb 2001 08:32:15 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA02307
	for <parisc-linux@lists.parisc-linux.org>; Wed, 28 Feb 2001 09:32:14 -0600
Date: Wed, 28 Feb 2001 09:32:14 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <002901c0a17f$d0933240$0801a8c0@esiee.fr>
Message-ID: <Pine.LNX.4.21.0102280929070.2282-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] include/asm/semaphore-helper.h
List-ID: <linux-parisc.vger.kernel.org>

Howdy,

I can't build the current CVS bits.  I get this message:

	make[1]: *** No rule to make target \
	`/usr/src/parisc/linux/include/asm/semaphore-helper.h', needed by \
	`semaphore.o'.  Stop.                                     

Is this file supposed to be created in the build process?  Or is the file
simply missing from my tree?

Regards,

- Greg
