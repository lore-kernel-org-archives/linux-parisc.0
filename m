Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DA014829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 14:19:54 -0600 (MDT)
Subject: Re: [parisc-linux] 9000/802/K250 won't boot with images -
	serial/stack problem?
From: Ryan Bradetich <rbradetich@uswest.net>
To: Stian Soiland <stain@itea.ntnu.no>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020930200805.GA9133@itea.ntnu.no>
References: <20020930200805.GA9133@itea.ntnu.no>
Content-Type: text/plain
Date: 30 Sep 2002 14:19:51 -0600
Message-Id: <1033417191.31126.4.camel@beavis>
Mime-Version: 1.0
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

> The serial console is connected to 'CONSOLE (X/4/0/0)*', 

This is good, see .. we even find the device :)
> 6. Sahp Baat Kiuh AP/MUX (5) at 0xf1900000 [10/4/0], versions 0x44,
0x0, 0xd

> Command line for kernel: 'ramdisk_size=8192 root=/dev/ram console=ttyS0
Oops... this is bad.  The K class systems do not have a 16550 compatible
serial port.  The console should be ttyB0.
For mor info on the console, see Matthew's excellent description of what
systems use the Serial Mux driver.

http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017837.html


Thanks,

- Ryan
