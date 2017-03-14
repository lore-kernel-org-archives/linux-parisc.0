From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] parisc: perf: Handle return NULL error from ioremap_nocache.
Date: Tue, 14 Mar 2017 15:24:51 +0530
Message-ID: <1489485291-21535-1-git-send-email-arvind.yadav.cs@gmail.com>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: jejb@parisc-linux.org, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Here, If ioremap_nocache will fail. It will return NULL.
Kernel can run into a NULL-pointer dereference.
This error check will avoid NULL pointer dereference.

This patch will remove coding style errors.
   - ERROR: code indent should use tabs where possible.
   - ERROR: trailing whitespace.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 arch/parisc/kernel/perf.c | 90 +++++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 43 deletions(-)

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index e282a51..4313624 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -39,7 +39,7 @@
  *  the PDC INTRIGUE calls.  This is done to eliminate bugs introduced
  *  in various PDC revisions.  The code is much more maintainable
  *  and reliable this way vs having to debug on every version of PDC
- *  on every box. 
+ *  on every box.
  */
 
 #include <linux/capability.h>
@@ -195,7 +195,7 @@ struct rdr_tbl_ent {
 static int perf_release(struct inode *inode, struct file *file);
 static int perf_open(struct inode *inode, struct file *file);
 static ssize_t perf_read(struct file *file, char __user *buf, size_t cnt, loff_t *ppos);
-static ssize_t perf_write(struct file *file, const char __user *buf, size_t count, 
+static ssize_t perf_write(struct file *file, const char __user *buf, size_t count,
 	loff_t *ppos);
 static long perf_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
 static void perf_start_counters(void);
@@ -222,7 +222,7 @@ static ssize_t perf_write(struct file *file, const char __user *buf, size_t coun
 /*
  * configure:
  *
- * Configure the cpu with a given data image.  First turn off the counters, 
+ * Configure the cpu with a given data image.  First turn off the counters,
  * then download the image, then turn the counters back on.
  */
 static int perf_config(uint32_t *image_ptr)
@@ -234,7 +234,7 @@ static int perf_config(uint32_t *image_ptr)
 	error = perf_stop_counters(raddr);
 	if (error != 0) {
 		printk("perf_config: perf_stop_counters = %ld\n", error);
-		return -EINVAL; 
+		return -EINVAL;
 	}
 
 printk("Preparing to write image\n");
@@ -242,7 +242,7 @@ static int perf_config(uint32_t *image_ptr)
 	error = perf_write_image((uint64_t *)image_ptr);
 	if (error != 0) {
 		printk("perf_config: DOWNLOAD = %ld\n", error);
-		return -EINVAL; 
+		return -EINVAL;
 	}
 
 printk("Preparing to start counters\n");
@@ -254,7 +254,7 @@ static int perf_config(uint32_t *image_ptr)
 }
 
 /*
- * Open the device and initialize all of its memory.  The device is only 
+ * Open the device and initialize all of its memory.  The device is only
  * opened once, but can be "queried" by multiple processes that know its
  * file descriptor.
  */
@@ -298,7 +298,7 @@ static ssize_t perf_read(struct file *file, char __user *buf, size_t cnt, loff_t
  * called on the processor that the download should happen
  * on.
  */
-static ssize_t perf_write(struct file *file, const char __user *buf, size_t count, 
+static ssize_t perf_write(struct file *file, const char __user *buf, size_t count,
 	loff_t *ppos)
 {
 	size_t image_size;
@@ -306,11 +306,11 @@ static ssize_t perf_write(struct file *file, const char __user *buf, size_t coun
 	uint32_t interface_type;
 	uint32_t test;
 
-	if (perf_processor_interface == ONYX_INTF) 
+	if (perf_processor_interface == ONYX_INTF)
 		image_size = PCXU_IMAGE_SIZE;
-	else if (perf_processor_interface == CUDA_INTF) 
+	else if (perf_processor_interface == CUDA_INTF)
 		image_size = PCXW_IMAGE_SIZE;
-	else 
+	else
 		return -EFAULT;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -330,22 +330,22 @@ static ssize_t perf_write(struct file *file, const char __user *buf, size_t coun
 
 	/* First check the machine type is correct for
 	   the requested image */
-        if (((perf_processor_interface == CUDA_INTF) &&
-		       (interface_type != CUDA_INTF)) ||
-	    ((perf_processor_interface == ONYX_INTF) &&
-	               (interface_type != ONYX_INTF))) 
+	if (((perf_processor_interface == CUDA_INTF) &&
+			(interface_type != CUDA_INTF)) ||
+		((perf_processor_interface == ONYX_INTF) &&
+			(interface_type != ONYX_INTF)))
 		return -EINVAL;
 
 	/* Next check to make sure the requested image
 	   is valid */
-	if (((interface_type == CUDA_INTF) && 
+	if (((interface_type == CUDA_INTF) &&
 		       (test >= MAX_CUDA_IMAGES)) ||
-	    ((interface_type == ONYX_INTF) && 
-		       (test >= MAX_ONYX_IMAGES))) 
+	    ((interface_type == ONYX_INTF) &&
+		       (test >= MAX_ONYX_IMAGES)))
 		return -EINVAL;
 
 	/* Copy the image into the processor */
-	if (interface_type == CUDA_INTF) 
+	if (interface_type == CUDA_INTF)
 		return perf_config(cuda_images[test]);
 	else
 		return perf_config(onyx_images[test]);
@@ -359,7 +359,7 @@ static ssize_t perf_write(struct file *file, const char __user *buf, size_t coun
 static void perf_patch_images(void)
 {
 #if 0 /* FIXME!! */
-/* 
+/*
  * NOTE:  this routine is VERY specific to the current TLB image.
  * If the image is changed, this routine might also need to be changed.
  */
@@ -367,9 +367,9 @@ static void perf_patch_images(void)
 	extern void $i_dtlb_miss_2_0();
 	extern void PA2_0_iva();
 
-	/* 
+	/*
 	 * We can only use the lower 32-bits, the upper 32-bits should be 0
-	 * anyway given this is in the kernel 
+	 * anyway given this is in the kernel
 	 */
 	uint32_t itlb_addr  = (uint32_t)&($i_itlb_miss_2_0);
 	uint32_t dtlb_addr  = (uint32_t)&($i_dtlb_miss_2_0);
@@ -377,21 +377,21 @@ static void perf_patch_images(void)
 
 	if (perf_processor_interface == ONYX_INTF) {
 		/* clear last 2 bytes */
-		onyx_images[TLBMISS][15] &= 0xffffff00;  
+		onyx_images[TLBMISS][15] &= 0xffffff00;
 		/* set 2 bytes */
 		onyx_images[TLBMISS][15] |= (0x000000ff&((dtlb_addr) >> 24));
 		onyx_images[TLBMISS][16] = (dtlb_addr << 8)&0xffffff00;
 		onyx_images[TLBMISS][17] = itlb_addr;
 
 		/* clear last 2 bytes */
-		onyx_images[TLBHANDMISS][15] &= 0xffffff00;  
+		onyx_images[TLBHANDMISS][15] &= 0xffffff00;
 		/* set 2 bytes */
 		onyx_images[TLBHANDMISS][15] |= (0x000000ff&((dtlb_addr) >> 24));
 		onyx_images[TLBHANDMISS][16] = (dtlb_addr << 8)&0xffffff00;
 		onyx_images[TLBHANDMISS][17] = itlb_addr;
 
 		/* clear last 2 bytes */
-		onyx_images[BIG_CPI][15] &= 0xffffff00;  
+		onyx_images[BIG_CPI][15] &= 0xffffff00;
 		/* set 2 bytes */
 		onyx_images[BIG_CPI][15] |= (0x000000ff&((dtlb_addr) >> 24));
 		onyx_images[BIG_CPI][16] = (dtlb_addr << 8)&0xffffff00;
@@ -404,24 +404,24 @@ static void perf_patch_images(void)
 
 	} else if (perf_processor_interface == CUDA_INTF) {
 		/* Cuda interface */
-		cuda_images[TLBMISS][16] =  
+		cuda_images[TLBMISS][16] =
 			(cuda_images[TLBMISS][16]&0xffff0000) |
 			((dtlb_addr >> 8)&0x0000ffff);
-		cuda_images[TLBMISS][17] = 
+		cuda_images[TLBMISS][17] =
 			((dtlb_addr << 24)&0xff000000) | ((itlb_addr >> 16)&0x000000ff);
 		cuda_images[TLBMISS][18] = (itlb_addr << 16)&0xffff0000;
 
-		cuda_images[TLBHANDMISS][16] = 
+		cuda_images[TLBHANDMISS][16] =
 			(cuda_images[TLBHANDMISS][16]&0xffff0000) |
 			((dtlb_addr >> 8)&0x0000ffff);
-		cuda_images[TLBHANDMISS][17] = 
+		cuda_images[TLBHANDMISS][17] =
 			((dtlb_addr << 24)&0xff000000) | ((itlb_addr >> 16)&0x000000ff);
 		cuda_images[TLBHANDMISS][18] = (itlb_addr << 16)&0xffff0000;
 
-		cuda_images[BIG_CPI][16] = 
+		cuda_images[BIG_CPI][16] =
 			(cuda_images[BIG_CPI][16]&0xffff0000) |
 			((dtlb_addr >> 8)&0x0000ffff);
-		cuda_images[BIG_CPI][17] = 
+		cuda_images[BIG_CPI][17] =
 			((dtlb_addr << 24)&0xff000000) | ((itlb_addr >> 16)&0x000000ff);
 		cuda_images[BIG_CPI][18] = (itlb_addr << 16)&0xffff0000;
 	} else {
@@ -433,7 +433,7 @@ static void perf_patch_images(void)
 
 /*
  * ioctl routine
- * All routines effect the processor that they are executed on.  Thus you 
+ * All routines effect the processor that they are executed on.  Thus you
  * must be running on the processor that you wish to change.
  */
 
@@ -459,7 +459,7 @@ static long perf_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			}
 
 			/* copy out the Counters */
-			if (copy_to_user((void __user *)arg, raddr, 
+			if (copy_to_user((void __user *)arg, raddr,
 					sizeof (raddr)) != 0) {
 				error =  -EFAULT;
 				break;
@@ -487,7 +487,7 @@ static long perf_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	.open = perf_open,
 	.release = perf_release
 };
-	
+
 static struct miscdevice perf_dev = {
 	MISC_DYNAMIC_MINOR,
 	PA_PERF_DEV,
@@ -595,7 +595,7 @@ static int perf_stop_counters(uint32_t *raddr)
 		/* OR sticky2 (bit 1496) to counter2 bit 32 */
 		tmp64 |= (userbuf[23] >> 8) & 0x0000000080000000;
 		raddr[2] = (uint32_t)tmp64;
-		
+
 		/* Counter3 is bits 1497 to 1528 */
 		tmp64 =  (userbuf[23] >> 7) & 0x00000000ffffffff;
 		/* OR sticky3 (bit 1529) to counter3 bit 32 */
@@ -617,7 +617,7 @@ static int perf_stop_counters(uint32_t *raddr)
 		userbuf[22] = 0;
 		userbuf[23] = 0;
 
-		/* 
+		/*
 		 * Write back the zeroed bytes + the image given
 		 * the read was destructive.
 		 */
@@ -625,13 +625,13 @@ static int perf_stop_counters(uint32_t *raddr)
 	} else {
 
 		/*
-		 * Read RDR-15 which contains the counters and sticky bits 
+		 * Read RDR-15 which contains the counters and sticky bits
 		 */
 		if (!perf_rdr_read_ubuf(15, userbuf)) {
 			return -13;
 		}
 
-		/* 
+		/*
 		 * Clear out the counters
 		 */
 		perf_rdr_clear(15);
@@ -644,7 +644,7 @@ static int perf_stop_counters(uint32_t *raddr)
 		raddr[2] = (uint32_t)((userbuf[1] >> 32) & 0x00000000ffffffffUL);
 		raddr[3] = (uint32_t)(userbuf[1] & 0x00000000ffffffffUL);
 	}
- 
+
 	return 0;
 }
 
@@ -682,7 +682,7 @@ static int perf_rdr_read_ubuf(uint32_t	rdr_num, uint64_t *buffer)
 	i = tentry->num_words;
 	while (i--) {
 		buffer[i] = 0;
-	}	
+	}
 
 	/* Check for bits an even number of 64 */
 	if ((xbits = width & 0x03f) != 0) {
@@ -808,18 +808,22 @@ static int perf_write_image(uint64_t *memaddr)
 	}
 
 	runway = ioremap_nocache(cpu_device->hpa.start, 4096);
+	if (!runway) {
+		printk(KERN_ERR "write_image: virtual mapping failed!\n");
+		return -ENOMEM;
+	}
 
 	/* Merge intrigue bits into Runway STATUS 0 */
 	tmp64 = __raw_readq(runway + RUNWAY_STATUS) & 0xffecfffffffffffful;
-	__raw_writeq(tmp64 | (*memaddr++ & 0x0013000000000000ul), 
+	__raw_writeq(tmp64 | (*memaddr++ & 0x0013000000000000ul),
 		     runway + RUNWAY_STATUS);
-	
+
 	/* Write RUNWAY DEBUG registers */
 	for (i = 0; i < 8; i++) {
 		__raw_writeq(*memaddr++, runway + RUNWAY_DEBUG);
 	}
 
-	return 0; 
+	return 0;
 }
 
 /*
@@ -843,7 +847,7 @@ static void perf_rdr_write(uint32_t rdr_num, uint64_t *buffer)
 			perf_rdr_shift_out_U(rdr_num, buffer[i]);
 		} else {
 			perf_rdr_shift_out_W(rdr_num, buffer[i]);
-		}	
+		}
 	}
 printk("perf_rdr_write done\n");
 }
-- 
1.9.1

