Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5FD6482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 14:08:24 -0700 (MST)
Date: Fri, 9 Nov 2001 22:08:14 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA stuff now in CVS
In-Reply-To: <20011108004716.4A44C482C@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.40.0111092205340.12365-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Helge,

> I don't have any EISA cards, so I tested it here with an
> old ISA NE2000 NIC clone in my 715/64:
> 
> dmesg:
> ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
> Last modified Nov 1, 2000 by Paul Gortmaker
> NE*000 ethercard probe at 0x340: 08 00 00 50 11 13
> eth0: NE2000 found at 0x340, using IRQ 10.
> 
> pa64:~# ping www.kde.org
> PING www.kde.org (213.203.58.36): 56 data bytes
> 64 bytes from 213.203.58.36: icmp_seq=0 ttl=237 time=149.7 ms

Pretty strange you're getting any interrupts, as with the current patch 
the EISA PIC isn't initialized, at all...

Index: gsc/eisa.c
===================================================================
RCS file: /var/cvs/linux/drivers/gsc/eisa.c,v
retrieving revision 1.12
diff -u -r1.12 eisa.c
--- gsc/eisa.c	2001/11/08 00:12:40	1.12
+++ gsc/eisa.c	2001/11/09 21:07:19
@@ -336,8 +336,6 @@
 	}
 	pcibios_register_hba(&eisa_dev.hba);
 
-	init_eisa_pic();
-	
 	result = request_irq(dev->irq, eisa_irq, SA_SHIRQ, "EISA", NULL);
 	if (result) {
 		printk(KERN_ERR "EISA: request_irq failed!\n");
@@ -352,6 +350,7 @@
 	irq_region[0] = &eisa_irq_region;
 	
 	EISA_bus = 1;
+	init_eisa_pic();
 	
 	return 0;
 }
