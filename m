Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 768544829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Oct 2002 20:40:17 -0600 (MDT)
From: Ryan Bradetich <rbradetich@uswest.net>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 01 Oct 2002 20:40:14 -0600
Message-Id: <1033526414.31126.1871.camel@beavis>
Mime-Version: 1.0
Subject: [parisc-linux] Request for preliminary approval for a lanana device number.
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

Alan,

I have written a driver to handle the non-16550-compatible serial ports
used on the parisc machines.  This includes support for the E, F-I,
K and optional console card for the D & R class systems.  The console
for these systems is on port 0 of the MUX.  

I would like to request prelimiary approval from you that you intend to
merge this driver into your tree, so I can request a valid device
number from lanana.

Here is a link to the code in CVS:
http://cvs.parisc-linux.org/linux/drivers/char/mux.c?rev=1.3&content-type=text/vnd.viewcvs-markup


Obviously this driver is not finished yet, as others are working on
getting the full MUX support from these devices, but this driver does
handle the console nicely.

I am not asking for you to pick this driver up immediately, as I assume
you will pick it up during your next merging excercise of the
parisc-linux tree.


Thanks much for your time, and hopefully we can get approval for the
device number to get these systems supported by the Debian installer.

Thanks,

- Ryan
