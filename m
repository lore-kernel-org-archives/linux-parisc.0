Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp010pub.verizon.net (unknown [206.46.170.189])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA69F482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 20:42:12 -0700 (MST)
Received: from verizon.net (pool-151-201-224-254.pitt.east.verizon.net [151.201.224.254])
	by smtp010pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id fAD3gr800679
	Mon, 12 Nov 2001 21:42:53 -0600 (CST)
Message-ID: <3BF096F2.8010409@verizon.net>
Date: Mon, 12 Nov 2001 22:43:46 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Booting with the STI console in a 715/75
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

This is another bug report on my test machine.

I compiled 2.4.9-pa79 using "make oldconfig", set the machine to use the 
STI console and booted the system.

I can see the kernel boot messages and get a login prompt, but the 
keyboard does not work, since what I type does not appear.

This is a keyboard that whose cable connects directly to the computer 
and has a connector for the mouse.

P.S. I see similar bahavior with 2.4.14, but from previous responses, 
the code merge is not complete yet and the console code is affected.

By the way what is the correct inittab entry, palo figures the parameter 
"console=tty0", but there is no entry for tty0 in inittab.

-- 
      Rafael
