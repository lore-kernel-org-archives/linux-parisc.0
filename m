Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA24298
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Feb 2000 09:35:14 -0700
Received: from udlkern.fc.hp.com (jsm@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id IAA07863
	for <parisc-linux@thepuffingroup.com>; Thu, 24 Feb 2000 08:36:00 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.1) id IAA28435 for parisc-linux@thepuffingroup.com; Thu, 24 Feb 2000 08:36:00 -0700 (MST)
Date: Thu, 24 Feb 2000 08:36:00 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200002241536.IAA28435@udlkern.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel Stack size increase
List-ID: <linux-parisc.vger.kernel.org>


I just committed code to change the task structure/kernel stack size from
8K to 16K. Willy asked me to do this after I had mentioned to him that
I had observed that we had already crossed the 6K boundary. 

We may never actually cross the 8K boundary, but I (and willy agrees)
believe that it is not worth risking at this point (a kernel stack overflow
will cause a variety of hard to track problems, since Linux currently does
not have a redzone for kernel stacks).  Later on in the port we can make
more precise measurements to determine what a safe value for the kernel 
stack size should be. There are also other possible designs that could be 
considered.

John Marvin
jsm@fc.hp.com
