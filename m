Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA03619
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Jun 1999 10:36:51 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id MAA04646
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Jun 1999 12:45:58 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3773B240.B7F682AA@thepuffingroup.com>
Date: Fri, 25 Jun 1999 12:45:52 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] More on booting...
List-ID: <linux-parisc.vger.kernel.org>


Woo!  It worked for me too!


Here's the boot log, manually copied.


Reading parameters...done.
Size = 589824 bytes, location = 0x0002B040.
Loading kernel...
Kernel loaded at 0x00080000, size=0x0005c708
Data   loaded at 0x000DD000, size=0x00014000

Transferring control to kernel. (At entry point 0x00080000)

-----------------------------------------------------------------


Enter: parisc_stopkernel()

-----------------------------------------------------------------

Linux version 2.2.1 (root@crow) (gcc version egcs-2.91.60 19981201
(egcs-1.1.1 release)) #1
  Fri Jun 25 10:19:58 MDT 1999
PARISC/Linux haltet


I've uploaded my binary, which you can download from:
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-19990625-1


- Alex
-- 
Alex deVries
Vice President of Engineering
The Puffin Group
