From: Julian Stecklina <der_julian@web.de>
Subject: [parisc-linux] LCD driver trims whitespace (again again)
Date: Mon, 18 Jun 2007 19:56:28 +0200
Message-ID: <4676C74C.4020608__38859.6543031328$1416624397$gmane$org@web.de>
References: <46279704.1080001@web.de>
	<200704211141.26069.deller@gmx.de>	<4672F1B9.507@web.de>
	<200706172227.22345.deller@gmx.de> <4675A206.7060809@web.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------010003090505010301000006"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4675A206.7060809@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------010003090505010301000006
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Due to my violation of rules, here comes it again...

The attached patch removes the behaviour that writes to /proc/pdc/lcd
are whitespace trimmed. This patch applies to Kyle's parisc git tree.

Signed-off-by: Julian Stecklina <der_julian@web.de>
(See thread "LCD driver trims whitespace" for reference.)

Regards,
Julian

--------------010003090505010301000006
Content-Type: text/x-patch;
 name="no-space-removal.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="no-space-removal.diff"

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 98be288..e5d7ed9 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -195,12 +195,6 @@ static int led_proc_write(struct file *file, const char *buf,
 
 	cur = lbuf;
 
-	/* skip initial spaces */
-	while (*cur && isspace(*cur))
-	{
-		cur++;
-	}
--------------010003090505010301000006--
