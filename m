From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] [PARISC] fix "ENTRY" redefinition between
	linkage.h and xattr.c
Date: Mon, 28 May 2007 18:01:39 +0200
Message-ID: <200705281805.51615.deller__17666.9181943454$1416624376$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
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

[PATCH] fix "ENTRY" redefinition between linkage.h and xattr.c

Signed-off-by: Helge Deller <deller@gmx.de>

Thanks to James for noticing. It fixes:
fs/ext3/xattr.c:65:1: warning: "ENTRY" redefined
In file included from include/linux/linkage.h:4,
                 from include/linux/fs.h:271,
                 from fs/ext3/xattr.c:54:
include/asm/linkage.h:13:1: warning: this is the location of the previous definition



diff --git a/include/asm-parisc/linkage.h b/include/asm-parisc/linkage.h
index 7a09d91..cdb4709 100644
--- a/include/asm-parisc/linkage.h
+++ b/include/asm-parisc/linkage.h
@@ -10,6 +10,8 @@
  * In parisc assembly a semicolon marks a comment while a
  * exclamation mark is used to seperate independend lines.
  */
+#ifdef __ASSEMBLY__
+
 #define ENTRY(name) \
 	.export name !\
 	ALIGN !\
@@ -24,5 +26,6 @@ name:
 	END(name)
 #endif
 
+#endif /* __ASSEMBLY__ */
 
 #endif  /* __ASM_PARISC_LINKAGE_H */
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
