Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
From: Ryan Bradetich <rbradetich@uswest.net>
To: parisc-linux-cvs@lists.parisc-linux.org
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 21 Aug 2002 22:49:47 -0600
Message-Id: <1029991787.4813.14.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] [PATCH] Serial MUX support for Nova and K-Class systems.
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

Hello all,

I just committed support for the Serial MUX driver as linux-2.4.19-pa5. 

This patch has been tested on my K460 and has been working well.  The
driver uses the same /dev/ttyB0 device the PDC Software console that
Christoph Plattner wrote and is available under the Non-standard serial
ports section.


Currently the driver only supports the Eole CAP/MUX (A Direct) device
since that is all I have to test with.  Additional devices can be added
under this driver as people with systems have a chance to test.


I tried to document the driver with kerneldoc, but it would be nice if
someone would check over my comment as I had to google/guess what most
of the ioctls and tty flags were.


The committed patch can be found at:
	ftp://ftp.parisc-linux.org/patches/serial_mux_v0.1.diff


Feedback greatly appreciated!

Thanks,

- Ryan
