Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA17238
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 13:01:39 -0700
Received: from unknown (HELO linuxcare.com) (216.208.98.2)
  by relay1.pair.com with SMTP; 25 Jan 2000 19:01:21 -0000
Sender: mang@mailserv2.iuinc.com
Message-ID: <388DF323.7B9EF164@linuxcare.com>
Date: Tue, 25 Jan 2000 14:01:55 -0500
From: Michael Ang <mang@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: multipart/mixed;
 boundary="------------D0BD82966A7539A1A823BCA3"
Subject: [parisc-linux] progress on tulip driver
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------D0BD82966A7539A1A823BCA3
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I just committed some changes to the tulip driver that should let you
read a MAC on the bultin tulip on the A180 -- please let me know if this
doesn't work on other machines.  You need to apply the attached patch
since check_region doesn't understand our fudged PCI I/O addresses.  You
can type "in la" from the boot menu to get the MAC of the builtin lan
adapter.

I suspect that the tulip code is still broken on pa20 boxen because of
the fudged addresses.

Thanks to Grant for fixing the Dino code that I was having problems
with.

	- Mike.
--------------D0BD82966A7539A1A823BCA3
Content-Type: text/plain; charset=us-ascii;
 name="tulip.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tulip.diff"

Index: tulip.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/drivers/net/tulip.c,v
retrieving revision 1.3
diff -u -r1.3 tulip.c
--- tulip.c	2000/01/25 19:48:06	1.3
+++ tulip.c	2000/01/25 19:48:52
@@ -513,7 +513,10 @@
 
 		/* Avoid already found cards */
 		if (check_region(pci_ioaddr, tulip_tbl[chip_idx].io_size))
-			continue;
+/*XXXmang			continue; */
+			printk("tulip_probe: warning, region 0x%x size 0x%x not available, continuing anyway\n",
+				   pci_ioaddr, tulip_tbl[chip_idx].io_size);
+		
 
 		pcibios_read_config_word(pci_bus, pci_device_fn,
 								 PCI_COMMAND, &pci_command);

--------------D0BD82966A7539A1A823BCA3--
