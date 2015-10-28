From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: Drop hpux_stat64 struct from stat.h header file
Date: Wed, 28 Oct 2015 21:40:18 +0100
Message-ID: <20151028204018.GA3141@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The struct hpux_stat64 is not needed any longer since we dropped HP-UX
support in commit 04c1614 ("parisc: hpux - Drop support for HP-UX
binaries").

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/uapi/asm/stat.h b/arch/parisc/include/uapi/asm/stat.h
index b606b36..3310d2a 100644
--- a/arch/parisc/include/uapi/asm/stat.h
+++ b/arch/parisc/include/uapi/asm/stat.h
@@ -36,37 +36,6 @@ struct stat {
 
 #define STAT_HAVE_NSEC
 
-struct hpux_stat64 {
-	unsigned int	st_dev;		/* dev_t is 32 bits on parisc */
-	unsigned int	st_ino;         /* 32 bits */
-	unsigned short	st_mode;	/* 16 bits */
-	unsigned short	st_nlink;	/* 16 bits */
-	unsigned short	st_reserved1;	/* old st_uid */
-	unsigned short	st_reserved2;	/* old st_gid */
-	unsigned int	st_rdev;
-	signed long long st_size;
-	signed int	st_atime;
-	unsigned int	st_spare1;
-	signed int	st_mtime;
-	unsigned int	st_spare2;
-	signed int	st_ctime;
-	unsigned int	st_spare3;
-	int		st_blksize;
-	unsigned long long st_blocks;
-	unsigned int	__unused1;	/* ACL stuff */
-	unsigned int	__unused2;	/* network */
-	unsigned int	__unused3;      /* network */
-	unsigned int	__unused4;	/* cnodes */
-	unsigned short	__unused5;	/* netsite */
-	short		st_fstype;
-	unsigned int	st_realdev;
-	unsigned short	st_basemode;
-	unsigned short	st_spareshort;
-	unsigned int	st_uid;
-	unsigned int	st_gid;
-	unsigned int	st_spare4[3];
-};
