Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 630844841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 18:14:00 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id hA81DuY14951;
	Fri, 7 Nov 2003 20:13:56 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: Paul Bame <bame@riverrock.org>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 07 Nov 2003 19:13:55 -0600
Message-Id: <1068254037.2120.93.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Allow palo partition to be mounted as ext2
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

It can be a bit of a pain having both a palo partition and a /boot
partition on the root disc (and both < 2GB), so this patch allows the
palo partition to be mounted as an ordinary ext2/ext3 filesystem
(ideally as /boot).

It does this by creating an ext2/3 filesystem in the palo partition but
leaving a hole for the iplboot program (by telling the filesystem the
blocks are bad).  The kernels can be booted from this filesystem by
specifying 0/ as the partition as usual.

Attached is a preliminary patch for you to see what you think.

Ultimately, it should mean we can get palo to operate much more like
grub (using a palo.conf file within the palo partition itself for
instance).

The diffs are against the palo cvs tree.

James

Index: ipl/ipl.c
===================================================================
RCS file: /var/cvs/palo/ipl/ipl.c,v
retrieving revision 1.32
diff -u -r1.32 ipl.c
--- ipl/ipl.c	13 Jan 2003 19:41:24 -0000	1.32
+++ ipl/ipl.c	8 Nov 2003 01:05:54 -0000
@@ -252,7 +252,7 @@
     int blocked_bootdev;
     int bootdev;
     int wide;
-    int kern_part, rd_part, i;
+    int kern_part, rd_part, i, ext2 = 0, f0;
     char kern_name[128], rd_name[128];
     char kern_fullname[128];
 
@@ -294,6 +294,11 @@
     printf("\n%s contains:\n",
 	partitioned ? "PALO(F0) partition" : "Boot image");
 
+    if(partitioned && f.version >= 4 && (f.flags & PFLAG_EXT2)) {
+	printf("PALO is formatted EXT2/3\n");
+	ext2 = 1;
+    }
+
     if (f.version < 3 && f.kern32_sz > 0)
     {
 	printf("    0/vmlinux %d bytes @ 0x%x\n", f.kern32_sz, f.kern32_offset);
@@ -392,16 +397,23 @@
     {
 	if (partition[i].id == 0xf0)
 	{
-	    if (kern_part == i + 1)
+	    f0 = i + 1;
+	    if (kern_part == f0)
 		kern_part = 0;
 
-	    if (rd_part == i + 1)
+	    if (rd_part == f0)
 		rd_part = 0;
 
 	    break;
 	}
     }
 
+    if (ext2 && kern_part == 0) {
+	kern_part = f0;
+	if(rd_part == 0)
+	    rd_part = f0;
+    }
+
     if (kern_part > 0 && !partitioned)
     {
 	printf("ERROR: Requesting kernel from partition %d "
@@ -507,7 +519,7 @@
 	struct diskpartition *pp;
 
 	if (kern_part >= MAXPARTS || 
-	    (partition[kern_part - 1].id != 0x83 && partition[kern_part - 1].id != 0xfd) )
+	    (partition[kern_part - 1].id != 0x83 && partition[kern_part - 1].id != 0xfd && partition[kern_part - 1].id != 0xf0) )
 	{
 	    printf("ERROR: Partition %d must be ext2\n", kern_part);
 	    while(1);
Index: lib/common.h
===================================================================
RCS file: /var/cvs/palo/lib/common.h,v
retrieving revision 1.24
diff -u -r1.24 common.h
--- lib/common.h	14 Jan 2003 20:32:44 -0000	1.24
+++ lib/common.h	8 Nov 2003 01:05:55 -0000
@@ -11,7 +11,7 @@
 #include <asm/byteorder.h>
 #include <linux/genhd.h>
 
-#define PALOVERSION "1.2"
+#define PALOVERSION "1.3"
 
 /* size of I/O block used in HP firmware */
 #define FW_BLOCKSIZE	2048
@@ -28,9 +28,10 @@
  * kern_sz = 0 or rd_sz = 0 means no kern or ramdisk respectively.
  */
 #define PALOMAGIC "PALO"
-#define PALOHDRVERSION 3
+#define PALOHDRVERSION 4
 
 #define PFLAG_INSTALL 0x1
+#define PFLAG_EXT2    0x2
 
 struct firstblock
 {
Index: palo/error.c
===================================================================
RCS file: /var/cvs/palo/palo/error.c,v
retrieving revision 1.6
diff -u -r1.6 error.c
--- palo/error.c	14 Jun 2001 19:39:58 -0000	1.6
+++ palo/error.c	8 Nov 2003 01:05:55 -0000
@@ -83,6 +83,13 @@
 	/* 17 */
 	"Too many of the same type of kernel.  %s is either the second\n"
 	"32-bit kernel or the second 64-bit one.\n",
+
+	/* 18 */
+	"For formatted palo partitions, you cannot specify a kernel\n"
+	"or a ramdisk.\n",
+
+	/* 19 */
+	"mke2fs failed."
 };
 
 #define NMESSAGES (sizeof errormessages / sizeof errormessages[0])
Index: palo/palo.c
===================================================================
RCS file: /var/cvs/palo/palo/palo.c,v
retrieving revision 1.16
diff -u -r1.16 palo.c
--- palo/palo.c	6 Aug 2002 15:22:14 -0000	1.16
+++ palo/palo.c	8 Nov 2003 01:05:56 -0000
@@ -17,6 +17,8 @@
 #include <string.h>
 #include <ctype.h>
 #include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/wait.h>
 #if LONG_OPTIONS
 # define _GNU_SOURCE
 # include <getopt.h>
@@ -30,6 +32,7 @@
 static const char Id[] = "$Id: palo.c,v 1.12.4.1 2001/06/13 03:13:17 bame Exp $";
 
 static int Install = 0;
+int verbose = 0;
 
 /* compute the sum of words in an 4-byte aligned region */
 int
@@ -39,7 +42,7 @@
     int *x = (int *)p;
     int i;
 
-    if (0) printf("checksum(%p, %u) = ", p, len);
+    if (verbose) printf("checksum(%p, %u) = ", p, len);
     len /= 4;
 
     for (i = 0; i < len; i++)
@@ -47,7 +50,7 @@
 	xsum += B32(x[i]);
     }
 
-    if (0) printf("0x%08x\n", xsum);
+    if (verbose) printf("0x%08x\n", xsum);
 
     return (xsum);
 }
@@ -74,7 +77,7 @@
     int xsum;
     unsigned int *ipl;
 
-    if (0) printf("check_bootloader %d\n", line);
+    if (verbose) printf("check_bootloader %d\n", line);
 
     STRUCTREAD(media, f, 0);
 
@@ -173,9 +176,11 @@
 	error(12);
 
     /* make sure max size boot loader would fit */
-    if (where + MAXBLSIZE >= f0end)
+    if (where + MAXBLSIZE > f0end) {
+	printf("where %d, where+MAX=%d f0end=%d\n",
+	       where, where + MAXBLSIZE, f0end);
 	error(9);
-
+    }
     /* load the boot loader into RAM */
     rblsize = fsize(bootloader);
     assert((rblsize % FW_BLOCKSIZE) == 0);
@@ -425,6 +430,98 @@
 
 #define KSIZE (2 * 1024 * 1024)
 
+/* Blocksize for the ext2/3 fs in the palo partition */
+#define EXT2_BLOCKSIZE	1024
+
+/* size in ext2 blocks of hole for bootloader */
+#define EXT2_HOLE	((MAXBLSIZE + 1) / EXT2_BLOCKSIZE)
+
+/* offset in bytes before start of hole,  ext2 doesn't allow holes at
+ * to cover the first four blocks of the filesystem */
+#define EXT2_OFFSET	(4*EXT2_BLOCKSIZE)
+
+void
+do_formatted(int init, int media, const char *medianame, int partition,
+	     int f0start, int f0length, int bootloaderfd, int do_format,
+	     const char *commandline)
+{
+    char partitionname[256];
+    struct firstblock f;
+    int partitionfd;
+
+    /* FIXME: assuming we can simply add the partition to the end
+     * of the whole disc device isn't always true */
+    snprintf(partitionname, sizeof(partitionname), "%s%d", medianame,
+	     partition);
+
+    if ((partitionfd = open(partitionname, O_RDWR)) < 0) {
+	perror(partitionname);
+	exit(1);
+    }
+    close(partitionfd);
+
+    if (init) {
+	/* make the bootloader align at 256k */
+	unsigned int holestart = (f0start + 0x3ffff + EXT2_OFFSET) & ~0x3ffff;
+	unsigned int partition_offset = holestart - f0start;
+	char badblockfilename[256];
+	int fd, i;
+	char cmd[512];
+
+	if (verbose)
+	    printf("f0 partition starts %d, hole %d-%d, end %d\n",
+		   f0start, holestart, holestart + EXT2_HOLE*EXT2_BLOCKSIZE,
+		   f0start + f0length);
+
+	if(partition_offset + EXT2_HOLE > f0length)
+	    error(14, "bootloader");
+
+	sprintf(badblockfilename, "/tmp/paloblk-%d", getpid());
+	if ((fd = open(badblockfilename, O_RDWR | O_CREAT | O_TRUNC)) < 0) {
+	    perror(badblockfilename);
+	    exit(1);
+	}
+    
+	for (i = (holestart - f0start)/EXT2_BLOCKSIZE;
+	     i < (holestart - f0start)/EXT2_BLOCKSIZE + EXT2_HOLE; i++) {
+	    char buf[128];
+	    sprintf(buf, "%d\n", i);
+	    write(fd, buf, strlen(buf));
+	}
+
+	sprintf(cmd, "mke2fs %s -b %d -l %s %s", do_format == 3 ? "-j" : "",
+		EXT2_BLOCKSIZE, badblockfilename, partitionname);
+
+	if (verbose)
+	    printf("Executing: %s\n", cmd);
+	else
+	    strcat(cmd, " > /dev/null 2>&1");
+
+	i = system(cmd);
+	unlink(badblockfilename);
+
+	if(WEXITSTATUS(i) != 0)
+	    error(20);
+
+	
+
+	STRUCTREAD(media, f, 0);
+	fb_init(&f);
+	f.flags |= PFLAG_EXT2;
+
+	if(commandline)
+	    strcpy(f.cmdline, commandline);
+
+	write_bootloader(media, bootloaderfd, holestart,
+			 holestart + EXT2_HOLE*EXT2_BLOCKSIZE, &f);
+	
+	STRUCTWRITE(media, f, 0);
+
+    }
+
+	
+}
+
 void
 do_randomaccess(int init, int media, int kernel32, int kernel64,
 	const char *commandline, int bootloader, int ramdisk,
@@ -433,7 +530,7 @@
     struct firstblock f;
     int bstart = 0;
 
-    if (0) printf("do_ra(%d, %d, %d, %d, '%s', %d, %d, %u, %u)\n",
+    if (verbose) printf("do_ra(%d, %d, %d, %d, '%s', %d, %d, %u, %u)\n",
 	init, media, kernel32, kernel64, commandline, bootloader, ramdisk, f0start,
 	f0length);
 
@@ -552,9 +649,11 @@
     {"bootloader", 1, 0, 'b'},
     {"ramdisk", 1, 0, 'r'},
     {"init-partitioned", 1, 0, 'I'},
+    {"format-as", 1, 0, 'e'},
     {"update-partitioned", 1, 0, 'U'},
     {"init-tape", 1, 0, 's'},
     {"init-cdrom", 1, 0, 'C'},
+    {"verbose", 0, 0, 'v'},
     {"help", 0, 0, '?'},
     {0, 0, 0, 0}
 };
@@ -583,10 +682,10 @@
     char *bootloaderfile = "/usr/share/palo/iplboot";
     int init = 0;
     extern char *bld_info;
-    const char gargs[] = "f:C:s:b:k:c:r:I:?";
+    const char gargs[] = "f:C:s:b:k:c:r:I:e:v?";
     char *config_file = "/etc/palo.conf";
     char *newargv[MAXARGS];
-    int newargc;
+    int newargc, format_as = 0;
     FILE *fconfig;
 
     assert(sizeof (struct firstblock) == 2048);
@@ -720,6 +819,17 @@
 	    if (strlen(commandline) > 127)
 		error(3);
 	    break;
+	case 'e':
+	    if(strcmp(optarg, "2") == 0)
+		format_as = 2;
+	    else if(strcmp(optarg, "3") == 0)
+		format_as = 3;
+	    else
+		error(0, argv[0]);
+	    break;
+	case 'v':
+	    verbose = 1;
+	    break;
 	default:
 	    error(0, argv[0]);
 	    break;
@@ -787,13 +897,28 @@
 	    }
 	    if (f0 == MAXPARTS)
 		error(11);
-	    print_ptab_pretty(ptab, MAXPARTS);
+	    if(verbose) {
+		print_ptab_pretty(ptab, MAXPARTS);
 
-	    if (0) printf("F0 partition start sector %d length %d\n",
+		printf("F0 partition start sector %d length %d\n",
 		    ptab[f0].start, ptab[f0].length);
+	    }
 
-	    do_randomaccess(init, media, kernel32, kernel64, commandline, bootloader,
-		ramdisk, ptab[f0].start * 512, ptab[f0].length * 512);
+	    if (format_as) {
+		/* if we're going to be a formatted partition, we can't
+		 * load anything into it, so check we haven't been asked
+		 * to */
+		if(kernel32 != -1 || kernel64 != -1
+		   || ramdisk != -1)
+		    error(18);
+		printf("OK we're doing a format as ext%d\n", format_as);
+		do_formatted(init, media, medianame, f0 + 1,
+			     ptab[f0].start * 512, ptab[f0].length * 512,
+			     bootloader, format_as, commandline);
+	    } else
+		do_randomaccess(init, media, kernel32, kernel64, commandline,
+				bootloader, ramdisk, ptab[f0].start * 512,
+				ptab[f0].length * 512);
 	}
 	break;
     case CDROM:
Index: palo/usage.txt
===================================================================
RCS file: /var/cvs/palo/palo/usage.txt,v
retrieving revision 1.3
diff -u -r1.3 usage.txt
--- palo/usage.txt	6 Aug 2002 15:35:22 -0000	1.3
+++ palo/usage.txt	8 Nov 2003 01:05:56 -0000
@@ -46,6 +46,15 @@
 		When -f is not specified, palo tries /etc/palo.conf.  Use
 		--configfile=/dev/null to avoid configuration files or
 		warnings when /etc/palo.conf is missing.
+    -v, --verbose
+		Provide more verbose information when running palo
+    -e, --format-as=type
+		This is only for partitioned media:  Format the palo
+		partition as an ext2 (type == 2) or ext3 (type == 3)
+		partition.  With this option, you cannot specify
+		any parameters, kernels or ramdisks to be loaded into
+		the palo partition
+		
 
 'palo' with no arguments whatsoever is equivalent to 'palo -f /etc/palo.conf'.
 
