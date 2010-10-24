From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: [PATCH] e1000: Allow the driver to be used on PA RISC C8000
 workstation
Date: Sun, 24 Oct 2010 04:28:59 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010240417160.30241@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
To: e1000-devel@lists.sourceforge.net, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

This is my first patch for my PA RISC C8000 machine: allow to use the 
onboard NIC.

Mikulas

---

Allow the driver to be used on PA RISC C8000 workstation

Search on the internet shows that the checksum field in the EEPROM on HPPA is
really not a checksum but a signature (different users including me found
the same mismatching checksum 0x16d6, despite their MAC addresses and
EEPROM content being different).

So I allow 0x16d6 (the last word read) as the matching checksum on hppa.

Signed-off-by: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>

Index: linux-2.6.36-rc8/drivers/net/e1000/e1000_hw.c
===================================================================
--- linux-2.6.36-rc8.orig/drivers/net/e1000/e1000_hw.c	2010-10-24 04:01:03.000000000 +0200
+++ linux-2.6.36-rc8/drivers/net/e1000/e1000_hw.c	2010-10-24 04:25:22.000000000 +0200
@@ -3840,6 +3840,12 @@ s32 e1000_validate_eeprom_checksum(struc
 		checksum += eeprom_data;
 	}
 
+#ifdef __hppa__
+	/* This seems to be a signature and not a checksum on HP c8000 */
+	if (eeprom_data == 0x16d6)
+		return E1000_SUCCESS;
+#endif
+
 	if (checksum == (u16) EEPROM_SUM)
 		return E1000_SUCCESS;
 	else {
