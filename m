Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.london-2.starlabs.net (mail.london-2.starlabs.net [212.125.75.4])
	by dsl2.external.hp.com (Postfix) with SMTP id 4681C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 05:57:09 -0600 (MDT)
Received: from lmscentralns01.leica.co.uk ([209.28.72.115])
	by kos.leica.co.uk with esmtp (Exim 3.15 #1)
	id 15reCJ-0000YW-00
	for parisc-linux@lists.parisc-linux.org; Thu, 11 Oct 2001 12:40:20 +0100
To: parisc-linux@lists.parisc-linux.org
From: norbert.naether@leica-microsystems.com
Date: Thu, 11 Oct 2001 12:27:13 +0200
Message-ID: <OF4ACC8BA3.E1FA8942-ONC1256AE2.0037A5B7@leica.co.uk>
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPA4552A, stifb
List-ID: <linux-parisc.vger.kernel.org>

Hi,

the C200 VISUALIZE with an HPA4552A graphic board (SUMMIT fx2) is finally
running sticon. :-)
I only added the PCI device ID to sti_pci_tbl[ ] in sticore.c :

{ PCI_VENDOR_ID_HP, 0x1008, PCI_ANY_ID, PCI_ANY_ID, 0 ,0, 0}

Now, I did some (more or less stupid..) things in stifb.c. With one
(expected) result:  *take the power cord !* ;-)
Is there anything I could do, to get this device running the framebuffer
driver ?

Thanks,
Greetings, Norbert
....
....
Oct 11 10:05:04 hp707 kernel: Starting kswapd v1.8
Oct 11 10:05:04 hp707 kernel: parport_init_chip: initialize bidirectional-mode.
Oct 11 10:05:04 hp707 kernel: parport0: PC-style at 0xffd02800, irq 216 [PCSPP,TRISTATE]
Oct 11 10:05:04 hp707 kernel: STI PCI ROM enabled at 0xf1e00000
Oct 11 10:05:04 hp707 kernel: PCI graphic ROM found at f1e00000 (2048 kB), fb @f6000000 (32 MB)
Oct 11 10:05:04 hp707 kernel: PCI region 0: f6000000 with 32768 kB
Oct 11 10:05:04 hp707 kernel: PCI region 1: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 2: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 3: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 4: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 5: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 6: f1e00000 with 2048 kB
Oct 11 10:05:04 hp707 kernel: PCI region 7: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 8: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 9: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 10: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: PCI region 11: 00000000 with 0 kB
Oct 11 10:05:04 hp707 kernel: Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
Oct 11 10:05:04 hp707 kernel: sig 55aa0000, PCI STI ROM at f1e00044
Oct 11 10:05:04 hp707 kernel: STI word mode ROM at f1e00044, hpa=f6000000
Oct 11 10:05:04 hp707 kernel: STI word mode ROM, id 2fc1066b-9a02587, conforms to spec rev. 8.09
Oct 11 10:05:04 hp707 kernel: STI device: HPA4552A
Oct 11 10:05:04 hp707 kernel: stifb: Unsupported graphics card (id=0x2fc1066b) - skipping.
Oct 11 10:05:04 hp707 kernel: pty: 256 Unix98 ptys configured
....
....





_______________________________________________________________________
This message has been checked for all known viruses by the oxstrad Ltd (www.oxstrad.com) scanning service, powered by Messagelabs. For further information visit http://www.messagelabs.com/stats.asp
