Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA12217
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 May 2000 09:53:40 -0600
From: willy@thepuffingroup.com
Date: Wed, 24 May 2000 12:53:49 -0400
To: torvalds@transmeta.com
Cc: linux-fsdevel@vger.rutgers.edu, parisc-linux@thepuffingroup.com
Message-ID: <20000524125349.L17536@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [PATCH] support for HP UFS filesystems
List-ID: <linux-parisc.vger.kernel.org>


Linus, this patch allows Linux to mount HP-style UFS filesystems.  Please
apply.

diff -urNX exclude linux-pre9/fs/ufs/super.c linux-2.3/fs/ufs/super.c
--- linux-pre9/fs/ufs/super.c	Mon Mar 13 15:35:39 2000
+++ linux-2.3/fs/ufs/super.c	Sun Mar 26 17:27:41 2000
@@ -55,6 +55,9 @@
  *
  * write support Daniel Pirkl <daniel.pirkl@email.cz> 1998
  * 
+ * HP/UX hfs filesystem support added by
+ * Martin K. Petersen <mkp@mkp.net>, August 1999
+ *
  */
 
 
@@ -279,6 +282,8 @@
 				ufs_set_opt (*mount_options, UFSTYPE_OPENSTEP);
 			else if (!strcmp (value, "sunx86"))
 				ufs_set_opt (*mount_options, UFSTYPE_SUNx86);
+			else if (!strcmp (value, "hp"))
+				ufs_set_opt (*mount_options, UFSTYPE_HP);
 			else {
 				printk ("UFS-fs: Invalid type option: %s\n", value);
 				return 0;
@@ -473,7 +478,7 @@
 	if (!(sb->u.ufs_sb.s_mount_opt & UFS_MOUNT_UFSTYPE)) {
 		printk("You didn't specify the type of your ufs filesystem\n\n"
 		"mount -t ufs -o ufstype="
-		"sun|sunx86|44bsd|old|nextstep|netxstep-cd|openstep ...\n\n"
+		"sun|sunx86|44bsd|old|hp|nextstep|netxstep-cd|openstep ...\n\n"
 		">>>WARNING<<< Wrong ufstype may corrupt your filesystem, "
 		"default is ufstype=old\n");
 		ufs_set_opt (sb->u.ufs_sb.s_mount_opt, UFSTYPE_OLD);
@@ -573,6 +578,19 @@
 		}
 		break;
 	
+	case UFS_MOUNT_UFSTYPE_HP:
+		UFSD(("ufstype=hp\n"))
+		uspi->s_fsize = block_size = 1024;
+		uspi->s_fmask = ~(1024 - 1);
+		uspi->s_fshift = 10;
+		uspi->s_sbsize = super_block_size = 2048;
+		uspi->s_sbbase = 0;
+		flags |= UFS_DE_OLD | UFS_UID_OLD | UFS_ST_OLD | UFS_CG_OLD;
+		if (!(sb->s_flags & MS_RDONLY)) {
+			printk(KERN_INFO "ufstype=hp is supported read-only\n");
+			sb->s_flags |= MS_RDONLY;
+ 		}
+ 		break;
 	default:
 		printk("unknown ufstype\n");
 		goto failed;
@@ -598,18 +616,30 @@
 #if defined(__LITTLE_ENDIAN) || defined(__BIG_ENDIAN) /* sane bytesex */
 	switch (usb3->fs_magic) {
 		case UFS_MAGIC:
+	        case UFS_MAGIC_LFN:
+	        case UFS_MAGIC_FEA:
+	        case UFS_MAGIC_4GB:
 			swab = UFS_NATIVE_ENDIAN;
 			goto magic_found;
 		case UFS_CIGAM:
+	        case UFS_CIGAM_LFN:
+	        case UFS_CIGAM_FEA:
+	        case UFS_CIGAM_4GB:
 			swab = UFS_SWABBED_ENDIAN;
 			goto magic_found;
 	}
 #else /* bytesex perversion */
 	switch (le32_to_cpup(&usb3->fs_magic)) {
 		case UFS_MAGIC:
+		case UFS_MAGIC_LFN:
+	        case UFS_MAGIC_FEA:
+	        case UFS_MAGIC_4GB:
 			swab = UFS_LITTLE_ENDIAN;
 			goto magic_found;
 		case UFS_CIGAM:
+		case UFS_CIGAM_LFN:
+	        case UFS_CIGAM_FEA:
+	        case UFS_CIGAM_4GB:
 			swab = UFS_BIG_ENDIAN;
 			goto magic_found;
 	}
diff -urNX exclude linux-pre9/include/linux/ufs_fs.h linux-2.3/include/linux/ufs_fs.h
--- linux-pre9/include/linux/ufs_fs.h	Tue Mar 14 21:36:40 2000
+++ linux-2.3/include/linux/ufs_fs.h	Sun Mar 26 17:29:05 2000
@@ -18,6 +18,10 @@
  * Niels Kristian Bech Jensen <nkbj@image.dk>.
  *
  * Write support by Daniel Pirkl <daniel.pirkl@email.cz>
+ *
+ * HP/UX hfs filesystem support added by
+ * Martin K. Petersen <mkp@mkp.net>, August 1999
+ *
  */
 
 #ifndef __LINUX_UFS_FS_H
@@ -38,6 +42,30 @@
 #define UFS_MAGIC 0x00011954
 #define UFS_CIGAM 0x54190100 /* byteswapped MAGIC */
 
+
+/* HP specific MAGIC values */
+
+#define UFS_MAGIC_LFN   0x00095014 /* fs supports filenames > 14 chars */
+#define UFS_CIGAM_LFN   0x14500900 /* srahc 41 < semanelif stroppus sf */
+
+#define UFS_MAGIC_SEC   0x00612195 /* B1 security fs */
+#define UFS_CIGAM_SEC   0x95216100
+
+#define UFS_MAGIC_FEA   0x00195612 /* fs_featurebits supported */
+#define UFS_CIGAM_FEA   0x12561900
+
+#define UFS_MAGIC_4GB   0x05231994 /* fs > 4 GB && fs_featurebits */
+#define UFS_CIGAM_4GB   0x94192305
+
+/* Seems somebody at HP goofed here. B1 and lfs are both 0x2 !?! */
+#define UFS_FSF_LFN     0x00000001 /* long file names */
+#define UFS_FSF_B1      0x00000002 /* B1 security */
+#define UFS_FSF_LFS     0x00000002 /* large files */
+#define UFS_FSF_LUID    0x00000004 /* large UIDs */
+
+/* End of HP stuff */
+
+
 #define UFS_BSIZE	8192
 #define UFS_MINBSIZE	4096
 #define UFS_FSIZE	1024
@@ -111,7 +139,7 @@
 #define UFS_MOUNT_ONERROR_UMOUNT	0x00000004
 #define UFS_MOUNT_ONERROR_REPAIR	0x00000008
 
-#define UFS_MOUNT_UFSTYPE		0x000007F0
+#define UFS_MOUNT_UFSTYPE		0x00000FF0
 #define UFS_MOUNT_UFSTYPE_OLD		0x00000010
 #define UFS_MOUNT_UFSTYPE_44BSD		0x00000020
 #define UFS_MOUNT_UFSTYPE_SUN		0x00000040
@@ -119,6 +147,7 @@
 #define UFS_MOUNT_UFSTYPE_NEXTSTEP_CD	0x00000100
 #define UFS_MOUNT_UFSTYPE_OPENSTEP	0x00000200
 #define UFS_MOUNT_UFSTYPE_SUNx86	0x00000400
+#define UFS_MOUNT_UFSTYPE_HP	        0x00000800
 
 #define ufs_clear_opt(o,opt)	o &= ~UFS_MOUNT_##opt
 #define ufs_set_opt(o,opt)	o |= UFS_MOUNT_##opt
