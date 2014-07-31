From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] [PARISC] sys_hpux: NUL terminator is one past the end
Date: Thu, 31 Jul 2014 18:20:20 +0300
Message-ID: <20140731152020.GB31539@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	kernel-janitors@vger.kernel.org
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

We allocate "len" number of chars so we should put the NUL at "len - 1"
to avoid corrupting memory.  Btw, strlen_user() is different from the
normal strlen() function because it includes NUL terminator in the
count.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/hpux/sys_hpux.c b/arch/parisc/hpux/sys_hpux.c
index d9dc6cd..e5c4da0 100644
--- a/arch/parisc/hpux/sys_hpux.c
+++ b/arch/parisc/hpux/sys_hpux.c
@@ -456,7 +456,7 @@ int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
 		}
 
 		/* String could be altered by userspace after strlen_user() */
-		fsname[len] = '\0';
+		fsname[len - 1] = '\0';
 
 		printk(KERN_DEBUG "that is '%s' as (char *)\n", fsname);
 		if ( !strcmp(fsname, "hfs") ) {
