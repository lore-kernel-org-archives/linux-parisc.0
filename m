Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA23271
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Sep 1999 22:51:28 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37D72A58.C01218B5@uswest.net>
Date: Wed, 08 Sep 1999 21:32:40 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Parisc Linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Finally ... Kernel Booted on C200
List-ID: <linux-parisc.vger.kernel.org>

Well I'm slowly learning .... :)

I finally figured out how to compile the cvs tree into a kernel that
I could boot on the C200.
These are the steps I followed, will someone verify if they are correct?

1. built the kernel using vmlinux,
2. built the ipl in arch/parisc/boot/boot_code
3. stripped ipl
4. mkImage ipl vmlinux vmlinux.boot
5 boot off of vmlinux.boot

At this point I get Tranfering control to kernel.  (At entry point
0x00010000)
The LED are also flashing in some patteren.

Well, time to start researching signals :)

-Ryan
