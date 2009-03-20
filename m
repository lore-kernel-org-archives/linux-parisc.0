From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH next 1/2] PARISC: led: remove proc_dir_entry::owner
Date: Fri, 20 Mar 2009 12:55:50 +0300
Message-ID: <20090320095550.GA26020@orion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: adobriyan@gmail.com
To: kyle@mcmartin.ca, linux-parisc@vger.kernel.org,
	linux-next@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

proc_dir_entry::owner was removed in 0702c1c1a4
(proc 2/2: remove struct proc_dir_entry::owner)

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/parisc/led.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/parisc/led.c b/drivers/parisc/led.c
index 454b653..67bdf20 100644
--- a/drivers/parisc/led.c
+++ b/drivers/parisc/led.c
@@ -243,13 +243,11 @@ static int __init led_create_procfs(void)
 
 	proc_pdc_root = proc_mkdir("pdc", 0);
 	if (!proc_pdc_root) return -1;
-	proc_pdc_root->owner = THIS_MODULE;
 	ent = create_proc_entry("led", S_IFREG|S_IRUGO|S_IWUSR, proc_pdc_root);
 	if (!ent) return -1;
 	ent->data = (void *)LED_NOLCD; /* LED */
 	ent->read_proc = led_proc_read;
 	ent->write_proc = led_proc_write;
-	ent->owner = THIS_MODULE;
 
 	if (led_type == LED_HASLCD)
 	{
@@ -258,7 +256,6 @@ static int __init led_create_procfs(void)
 		ent->data = (void *)LED_HASLCD; /* LCD */
 		ent->read_proc = led_proc_read;
 		ent->write_proc = led_proc_write;
-		ent->owner = THIS_MODULE;
 	}
 
 	return 0;
