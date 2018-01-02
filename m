From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Show unhashed EISA EEPROM address
Date: Tue, 2 Jan 2018 20:47:01 +0100
Message-ID: <20180102194701.GA28242@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fixes: ad67b74d2469d9b8 ("printk: hash addresses printed with %p")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/parisc/eisa_eeprom.c b/drivers/parisc/eisa_eeprom.c
index 4dd9b1308128..99a80da6fd2e 100644
--- a/drivers/parisc/eisa_eeprom.c
+++ b/drivers/parisc/eisa_eeprom.c
@@ -106,7 +106,7 @@ static int __init eisa_eeprom_init(void)
 		return retval;
 	}
 
-	printk(KERN_INFO "EISA EEPROM at 0x%p\n", eisa_eeprom_addr);
+	printk(KERN_INFO "EISA EEPROM at 0x%px\n", eisa_eeprom_addr);
 	return 0;
 }
 
