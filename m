Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3069F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 07:22:38 -0700 (MST)
Date: Mon, 28 Oct 2002 15:22:31 +0100
Message-ID: <3DB5755500001056@ocpmta7.be.tiscali.com>
From: jsoe0708@tiscali.be
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] 2.4.19-pa24 (uaccess.h patch) [was: mkfs.xfs failled]
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

Randolph,

I test it this morming with evms and xfs together and it seems to works
fine (no memory default encounter so I could not check ex_table behaviour)

Thanks,
    Joel

PS: Can you explain the willy's idea on how to replace ex_table?

ps: What do think about this:
--- uaccess.h.orig	2002-10-28 14:58:13.000000000 +0100
+++ uaccess.h	2002-10-28 15:01:31.000000000 +0100
@@ -28,6 +28,11 @@
  * that put_user is the same as __put_user, etc.
  */

+extern int __get_kernel_bad(void);
+extern int __get_user_bad(void);
+extern int __put_kernel_bad(void);
+extern int __put_user_bad(void);
+
 #define access_ok(type,addr,size)   (1)
 #define verify_area(type,addr,size) (0)

@@ -35,8 +40,8 @@
 #define get_user __get_user

 #if BITS_PER_LONG == 32
-#define LDD_KERNEL(ptr)		BUG()
-#define LDD_USER(ptr)		BUG()
+#define LDD_KERNEL(ptr)		__get_kernel_bad();
+#define LDD_USER(ptr)		__get_user_bad();
 #define STD_KERNEL(x, ptr) __put_kernel_asm64(x,ptr)
 #define STD_USER(x, ptr) __put_user_asm64(x,ptr)
 #else
@@ -75,7 +80,7 @@
 	    case 2: __get_kernel_asm("ldh",ptr); break; \
 	    case 4: __get_kernel_asm("ldw",ptr); break; \
 	    case 8: LDD_KERNEL(ptr); break;		\
-	    default: BUG(); break;                      \
+	    default: __get_kernel_bad(); break;         \
 	    }                                           \
 	}                                               \
 	else {                                          \
@@ -84,7 +89,7 @@
 	    case 2: __get_user_asm("ldh",ptr); break;   \
 	    case 4: __get_user_asm("ldw",ptr); break;   \
 	    case 8: LDD_USER(ptr);  break;		\
-	    default: BUG(); break;                      \
+	    default: __get_user_bad(); break;           \
 	    }                                           \
 	}                                               \
 							\
@@ -144,7 +149,7 @@
 	    case 2: __put_kernel_asm("sth",x,ptr); break;       \
 	    case 4: __put_kernel_asm("stw",x,ptr); break;       \
 	    case 8: STD_KERNEL(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_kernel_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 	else {                                                  \
@@ -153,7 +158,7 @@
 	    case 2: __put_user_asm("sth",x,ptr); break;         \
 	    case 4: __put_user_asm("stw",x,ptr); break;         \
 	    case 8: STD_USER(x,ptr); break;			\
-	    default: BUG(); break;                              \
+	    default: __put_user_bad(); break;			\
 	    }                                                   \
 	}                                                       \
 								\
