Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA16418
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Jun 1999 20:08:53 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id EAA04459
	for <parisc-linux@thepuffingroup.com>; Wed, 30 Jun 1999 04:08:55 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id EAA3095387
	for <parisc-linux@thepuffingroup.com>; Wed, 30 Jun 1999 04:08:55 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10z9ny-00029qC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Wed, 30 Jun 1999 04:08:54 +0200 (CEST)
Date: Wed, 30 Jun 1999 04:08:54 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990630040854.S30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/33
List-ID: <linux-parisc.vger.kernel.org>


I'd just like to let people know that I've built myself a kernel against
the current CVS tree and it boots on my 715/33 (using rbootd):

PARISC/Linux Bootstrap Version 0.4 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Mon Jun 28 16:30:57 METDST 1999 by willy@bmw

Reading parameters...done.

Loading SOM-Kernel...
Kernel loaded at 0x00010000, size=0x00062008
Data   loaded at 0x00073000, size=0x0001D000
BSS-Data      at 0x00090000, size=0x0000f530 (initialized with 0x00000000)

Transferring control to kernel. (At entry point 0x00010000)


The Kernel has started...
You are running a 33MHz PA-RISC-Machine with 56MB of RAM.
First free address was 0x0009f530 (This is the base of the stack).
Stacksize = 0x00040000.
First free User-Memory starts now at address 0x000df530 and ends at 0x03800000.

Linux version 2.2.1 (willy@bmw) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1
release)) #18
 Wed Jun 30 05:46:53 METDST 1999

at which point it hangs and I have to reset.  Excellent work.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
