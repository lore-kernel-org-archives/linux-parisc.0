Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 335CE482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 04:59:20 -0600 (MDT)
Received: from alcatel.at (atusel33.aut.alcatel.at [146.112.129.215])
	by  mail.alcatel.at (8.9.3/8.9.3/1.21 01/27/01 21:43:09) with ESMTP id MAA21825
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 12:58:59 +0200 (MET DST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AE6ADF3.92D612FE@alcatel.at>
Date: Wed, 25 Apr 2001 12:58:59 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Bug in kernel: console support STI/serial
List-ID: <linux-parisc.vger.kernel.org>

Hello PA-RISCers !

I tried the STI console for the first time on a 712/60
workstation but found a problem in handling console
devices.

I compiled the kernel with SUPPORT for both consoles,
the serial and the STI.

Per definition:
---------------
If no `console=xxx' the default is `tty0', and the
"current" virtual console is used.

The user can also select the console via command line
parameter for kernel: `console=ttyS0' for example for
the serial console.

Problem:
--------
On the current kernel, if I do not use the `console='
parameter, the kernel does following:

Boot,...
Output:
  Switching from PDC console ...

And now on the serial line !!!!! the output:
  Switching to STI console ....

Here is the error: Linux know's, it must use the STI
but uses the serial console.

I have not analysed the code fully, yet. Dependent on
my spare time, I can deliver a bug fix or point out the 
position of the wrong code.

------

By the way: How can I set the 712/60 to use serial
PCD console (command `path' does not work for console !)

Cheers
	Christoph P.

------------------------------------------------------------
private:  christoph.plattner@gmx.at
company:  christoph.plattner@alcatel.at
