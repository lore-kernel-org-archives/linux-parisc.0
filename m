Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE071482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 22:28:40 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel 
Date: Wed, 1 May 2002 16:31:22 +1200
Message-ID: <005701c1f0c9$0c4fe5a0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <003801c1f0c7$e6687c90$5e01000a@bongo>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Arrrgh, sorry for this. Take 3:

--- kernel-source-2.4.17-hppa/arch/parisc/kernel/ioctl32.c      Fri Nov
2 18:54:54 2001
+++ kernel-source-2.4.17-hppa-patch/arch/parisc/kernel/ioctl32.c
Wed May  1 03:46:28 2002
@@ -19,9 +19,7 @@
 #include <linux/if.h>
 #include <linux/slab.h>
 #include <linux/hdreg.h>
-#if 0 /* New RAID code is half-merged... -DaveM */
-#include <linux/md.h>
-#endif
+#include <linux/raid/md.h>
 #include <linux/kd.h>
 #include <linux/route.h>
 #include <linux/skbuff.h>
@@ -2880,16 +2878,26 @@ COMPATIBLE_IOCTL(BLKFRASET)
 COMPATIBLE_IOCTL(BLKSECTSET)
 COMPATIBLE_IOCTL(BLKSSZGET)

-#if 0
-       /* New RAID code is being merged, fix up to handle
-        * new RAID ioctls when fully merged in 2.3.x -DaveM
-        */
-/* 0x09 */
-COMPATIBLE_IOCTL(REGISTER_DEV)
-COMPATIBLE_IOCTL(REGISTER_DEV_NEW)
-COMPATIBLE_IOCTL(START_MD)
-COMPATIBLE_IOCTL(STOP_MD)
-#endif
+/* RAID */
+COMPATIBLE_IOCTL(RAID_VERSION)
+COMPATIBLE_IOCTL(GET_ARRAY_INFO)
+COMPATIBLE_IOCTL(GET_DISK_INFO)
+COMPATIBLE_IOCTL(PRINT_RAID_DEBUG)
+COMPATIBLE_IOCTL(CLEAR_ARRAY)
+COMPATIBLE_IOCTL(ADD_NEW_DISK)
+COMPATIBLE_IOCTL(HOT_REMOVE_DISK)
+COMPATIBLE_IOCTL(SET_ARRAY_INFO)
+COMPATIBLE_IOCTL(SET_DISK_INFO)
+COMPATIBLE_IOCTL(WRITE_RAID_INFO)
+COMPATIBLE_IOCTL(UNPROTECT_ARRAY)
+COMPATIBLE_IOCTL(PROTECT_ARRAY)
+COMPATIBLE_IOCTL(HOT_ADD_DISK)
+COMPATIBLE_IOCTL(SET_DISK_FAULTY)
+COMPATIBLE_IOCTL(RUN_ARRAY)
+COMPATIBLE_IOCTL(START_ARRAY)
+COMPATIBLE_IOCTL(STOP_ARRAY)
+COMPATIBLE_IOCTL(STOP_ARRAY_RO)
+COMPATIBLE_IOCTL(RESTART_ARRAY_RW)

 /* Big K */
 COMPATIBLE_IOCTL(PIO_FONT)
