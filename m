From: Michael Buesch <mb@bu3sch.de>
Subject: [PATCH] parisc-isa-eeprom: Fix loff_t usage
Date: Tue, 21 Jul 2009 00:58:44 +0200
Message-ID: <200907210058.44737.mb@bu3sch.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

loff_t is a signed type. If userspace passes a negative ppos, the "count"
range check is weakened. "count"s bigger than HPEE_MAX_LENGTH will pass the check.
Also, if ppos is negative, the readb(eisa_eeprom_addr + *ppos) will poke in random
memory.

Signed-off-by: Michael Buesch <mb@bu3sch.de>
Cc: stable@kernel.org

---

Patch is untested due to lack of hardware.

---
 drivers/parisc/eisa_eeprom.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.orig/drivers/parisc/eisa_eeprom.c
+++ linux-2.6/drivers/parisc/eisa_eeprom.c
@@ -48,21 +48,21 @@ static loff_t eisa_eeprom_llseek(struct 
 	return (offset >= 0 && offset < HPEE_MAX_LENGTH) ? (file->f_pos = offset) : -EINVAL;
 }
 
 static ssize_t eisa_eeprom_read(struct file * file,
 			      char __user *buf, size_t count, loff_t *ppos )
 {
 	unsigned char *tmp;
 	ssize_t ret;
 	int i;
 	
-	if (*ppos >= HPEE_MAX_LENGTH)
+	if (*ppos < 0 || *ppos >= HPEE_MAX_LENGTH)
 		return 0;
 	
 	count = *ppos + count < HPEE_MAX_LENGTH ? count : HPEE_MAX_LENGTH - *ppos;
 	tmp = kmalloc(count, GFP_KERNEL);
 	if (tmp) {
 		for (i = 0; i < count; i++)
 			tmp[i] = readb(eisa_eeprom_addr+(*ppos)++);
 
 		if (copy_to_user (buf, tmp, count))
 			ret = -EFAULT;

-- 
Greetings, Michael.
