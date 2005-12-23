From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [parisc-linux] [PATCH] eisa_eeprom.c: __user annotations
Date: Sat, 24 Dec 2005 02:41:30 +0300
Message-ID: <20051223234130.GC23618@mipter.zuzino.mipt.ru>
References: <20051222101523.GP27946@ftp.linux.org.uk>
	<20051223093146.GT27946@ftp.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Al Viro <viro@ftp.linux.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051223093146.GT27946@ftp.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/parisc/eisa_eeprom.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/parisc/eisa_eeprom.c
+++ b/drivers/parisc/eisa_eeprom.c
@@ -48,7 +48,7 @@ static loff_t eisa_eeprom_llseek(struct 
 }
 
 static ssize_t eisa_eeprom_read(struct file * file,
-			      char *buf, size_t count, loff_t *ppos )
+			      char __user *buf, size_t count, loff_t *ppos )
 {
 	unsigned char *tmp;
 	ssize_t ret;

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
