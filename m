Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (host194.steeleye.com [216.33.1.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C76C482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 08:45:59 -0700 (MST)
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id fBUFjrE01927;
	Sun, 30 Dec 2001 09:45:56 -0600
Message-Id: <200112301545.fBUFjrE01927@localhost.localdomain>
To: parisc-linux@lists.parisc-linux.org
Cc: J.E.J.Bottomely@HansenPartnership.com
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-12732282180"
Date: Sun, 30 Dec 2001 09:45:53 -0600
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [parisc-linux] Palo and initial ramdisks
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

This is a multipart MIME message.

--==_Exmh_-12732282180
Content-Type: text/plain; charset=us-ascii

Playing some more with modules and initial ramdisks, I noticed that palo only 
allows use of a ramdisk when the ramdisk is placed inside the palo partition 
rather than being able to read one from the boot ext2 filesystem.

The attached patch is a simple hack allowing palo to read a ramdisk from the 
boot ext2 filesystem.

James Bottomley


--==_Exmh_-12732282180
Content-Type: text/plain ; name="palo.diff"; charset=us-ascii
Content-Description: palo.diff
Content-Disposition: attachment; filename="palo.diff"

Index: ipl/bootloader.h
===================================================================
RCS file: /var/cvs/palo/ipl/bootloader.h,v
retrieving revision 1.9
diff -u -r1.9 bootloader.h
--- ipl/bootloader.h	2001/11/19 03:54:42	1.9
+++ ipl/bootloader.h	2001/12/30 15:32:01
@@ -57,6 +57,7 @@
 /* ext2.c */
 int ext2_mount(long cons_dev, long p_offset, long quiet);
 int ext2_open(const char *filename);
+int ext2_filesize(int fd);
 
 /* lib.c */
 void blockprint(int zero_offset, char *buf, int nbytes);
Index: ipl/ext2.c
===================================================================
RCS file: /var/cvs/palo/ipl/ext2.c,v
retrieving revision 1.9
diff -u -r1.9 ext2.c
--- ipl/ext2.c	2001/11/19 03:54:42	1.9
+++ ipl/ext2.c	2001/12/30 15:32:15
@@ -733,6 +733,13 @@
 }
 #endif
 
+int ext2_filesize(int fd)
+{
+	struct ext2_inode * ip = fd2inode[fd];
+
+	return ip->i_size;
+}
+
 #if 0
 static int ext2_fstat(int fd, struct stat* buf)
 {
Index: ipl/ipl.c
===================================================================
RCS file: /var/cvs/palo/ipl/ipl.c,v
retrieving revision 1.26
diff -u -r1.26 ipl.c
--- ipl/ipl.c	2001/11/19 03:54:42	1.26
+++ ipl/ipl.c	2001/12/30 15:32:22
@@ -471,6 +471,7 @@
     {
 	int kern_fd;
 	int bkern_fd;
+	int rd_fd, brd_fd;
 	int part_fd;
 	int mount_fd;
 	struct diskpartition *pp;
@@ -502,6 +503,21 @@
 	if (!load_kernel(bkern_fd, &entry, &wide))
 	{
 	    die("ERROR: failed to load kernel\n");
+	}
+
+	if (rd_part != -1)
+	{
+	    rd_fd = ext2_open(rd_name);
+	    if(rd_fd >= 0) {
+		brd_fd = byteio_open(rd_fd);
+
+		if (!load_rd(brd_fd, ext2_filesize(rd_fd)))
+		{
+		    printf("ERROR: failed to load ramdisk - proceeding anyway\n");
+		}
+	    } else {
+		printf("ERROR: failed to open ramdisk %s\n", rd_name);
+	    }
 	}
     }
 

--==_Exmh_-12732282180--
