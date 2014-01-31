From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: convert uapi/asm/stat.h to use native types only
Date: Fri, 31 Jan 2014 23:00:38 +0100
Message-ID: <20140131220038.GA15809@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The stat.h header file is exported to userspace. Some userspace
applications failed to compile due to missing/unknown types, so we
better convert it to use native types only (like it's done on other
architectures too).

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/stat.h b/arch/parisc/include/uapi/asm/stat.h
index d76fbda..b606b36 100644
--- a/arch/parisc/include/uapi/asm/stat.h
+++ b/arch/parisc/include/uapi/asm/stat.h
@@ -5,67 +5,65 @@
 
 struct stat {
 	unsigned int	st_dev;		/* dev_t is 32 bits on parisc */
-	ino_t		st_ino;		/* 32 bits */
-	mode_t		st_mode;	/* 16 bits */
+	unsigned int	st_ino;		/* 32 bits */
+	unsigned short	st_mode;	/* 16 bits */
 	unsigned short	st_nlink;	/* 16 bits */
 	unsigned short	st_reserved1;	/* old st_uid */
 	unsigned short	st_reserved2;	/* old st_gid */
 	unsigned int	st_rdev;
-	off_t		st_size;
-	time_t		st_atime;
+	signed int	st_size;
+	signed int	st_atime;
 	unsigned int	st_atime_nsec;
-	time_t		st_mtime;
+	signed int	st_mtime;
 	unsigned int	st_mtime_nsec;
-	time_t		st_ctime;
+	signed int	st_ctime;
 	unsigned int	st_ctime_nsec;
 	int		st_blksize;
 	int		st_blocks;
 	unsigned int	__unused1;	/* ACL stuff */
 	unsigned int	__unused2;	/* network */
-	ino_t		__unused3;	/* network */
+	unsigned int	__unused3;	/* network */
 	unsigned int	__unused4;	/* cnodes */
 	unsigned short	__unused5;	/* netsite */
 	short		st_fstype;
 	unsigned int	st_realdev;
 	unsigned short	st_basemode;
 	unsigned short	st_spareshort;
-	uid_t		st_uid;
-	gid_t		st_gid;
+	unsigned int	st_uid;
+	unsigned int	st_gid;
 	unsigned int	st_spare4[3];
 };
 
 #define STAT_HAVE_NSEC
 
-typedef __kernel_off64_t	off64_t;
-
 struct hpux_stat64 {
 	unsigned int	st_dev;		/* dev_t is 32 bits on parisc */
-	ino_t           st_ino;         /* 32 bits */
-	mode_t		st_mode;	/* 16 bits */
+	unsigned int	st_ino;         /* 32 bits */
+	unsigned short	st_mode;	/* 16 bits */
 	unsigned short	st_nlink;	/* 16 bits */
 	unsigned short	st_reserved1;	/* old st_uid */
 	unsigned short	st_reserved2;	/* old st_gid */
 	unsigned int	st_rdev;
-	off64_t		st_size;
-	time_t		st_atime;
+	signed long long st_size;
+	signed int	st_atime;
 	unsigned int	st_spare1;
-	time_t		st_mtime;
+	signed int	st_mtime;
 	unsigned int	st_spare2;
-	time_t		st_ctime;
+	signed int	st_ctime;
 	unsigned int	st_spare3;
 	int		st_blksize;
-	__u64		st_blocks;
+	unsigned long long st_blocks;
 	unsigned int	__unused1;	/* ACL stuff */
 	unsigned int	__unused2;	/* network */
-	ino_t           __unused3;      /* network */
+	unsigned int	__unused3;      /* network */
 	unsigned int	__unused4;	/* cnodes */
 	unsigned short	__unused5;	/* netsite */
 	short		st_fstype;
 	unsigned int	st_realdev;
 	unsigned short	st_basemode;
 	unsigned short	st_spareshort;
-	uid_t		st_uid;
-	gid_t		st_gid;
+	unsigned int	st_uid;
+	unsigned int	st_gid;
 	unsigned int	st_spare4[3];
 };
 
