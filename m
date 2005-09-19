From: Christoph Hellwig <hch@lst.de>
Subject: [parisc-linux] [PATCH] move PA perf driver over to ->compat_iocll
Date: Mon, 19 Sep 2005 22:43:09 +0200
Message-ID: <20050919204309.GA19633@lst.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: matthew@wil.cx
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

the lock_kernel could probably go away aswell, but I'll rather leave
that to the parisc experts..


Signed-off-by: Christoph Hellwig <hch@lst.de>

Index: linux-2.6/arch/parisc/kernel/perf.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/perf.c	2005-09-19 17:41:31.000000000 +0200
+++ linux-2.6/arch/parisc/kernel/perf.c	2005-09-19 17:41:42.000000000 +0200
@@ -438,48 +438,56 @@
  * must be running on the processor that you wish to change.
  */
 
-static int perf_ioctl(struct inode *inode, struct file *file, unsigned int cmd,
+static long perf_ioctl(struct file *file, unsigned int cmd,
 	unsigned long arg)
 {
 	long error_start;
-	uint32_t raddr[4];	
+	uint32_t raddr[4];
+	int error = 0;
 
+	lock_kernel();
 	switch (cmd) {
 
 	    case PA_PERF_ON:
 			/* Start the counters */
 			perf_start_counters();
-			return 0;
+			break;
 
 	    case PA_PERF_OFF:
 			error_start = perf_stop_counters(raddr);
 			if (error_start != 0) {
 				printk(KERN_ERR "perf_off: perf_stop_counters = %ld\n", error_start);
-				return -EFAULT;	
+				error = -EFAULT;
+				break;
 			}
 
 			/* copy out the Counters */
 			if (copy_to_user((void __user *)arg, raddr, 
 					sizeof (raddr)) != 0) {
-				return -EFAULT;
+				error =  -EFAULT;
+				break;
 			}
-			return 0;
+			break;
 
 	    case PA_PERF_VERSION:
   	  		/* Return the version # */
-			return put_user(PERF_VERSION, (int *)arg);
+			error = put_user(PERF_VERSION, (int *)arg);
+			break;
 
 	    default:
-  	 		break;
+  	 		error = -ENOTTY;
 	}
-	return -ENOTTY;
+
+	unlock_kernel()
+	return error;
 }
 
 static struct file_operations perf_fops = {
 	.llseek = no_llseek,
 	.read = perf_read,
 	.write = perf_write,
-	.ioctl = perf_ioctl,
+	.unlocked_ioctl = perf_ioctl,
+	.compat_ioctl = perf_ioctl,
 	.open = perf_open,
 	.release = perf_release
 };
Index: linux-2.6/arch/parisc/kernel/ioctl32.c
===================================================================
--- linux-2.6.orig/arch/parisc/kernel/ioctl32.c	2005-09-19 17:41:31.000000000 +0200
+++ linux-2.6/arch/parisc/kernel/ioctl32.c	2005-09-19 17:41:49.000000000 +0200
@@ -37,11 +37,6 @@
 #define DECLARES
 #include "compat_ioctl.c"
 
-/* PA-specific ioctls */
-COMPATIBLE_IOCTL(PA_PERF_ON)
-COMPATIBLE_IOCTL(PA_PERF_OFF)
-COMPATIBLE_IOCTL(PA_PERF_VERSION)
