Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1766A4841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 11:59:32 -0700 (MST)
Message-ID: <3FAE8EA4.3050208@tiscali.be>
Date: Sun, 09 Nov 2003 18:59:48 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org,
	Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org> <3FAD6B1A.6060605@tiscali.be> <3FAE4639.6030200@tiscali.be> <20031109175735.GE2014@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20031109175735.GE2014@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Just for remainder here is the alignement of uaccess.h (i just finished 
to test on my c110 :)):
----------><----------
--- uaccess.h.orig      2004-04-20 21:03:59.000000000 +0200
+++ uaccess.h   2003-11-09 18:47:06.000000000 +0100
@@ -42,8 +42,8 @@
  #if BITS_PER_LONG == 32
  #define LDD_KERNEL(ptr) __get_kernel_bad();
  #define LDD_USER(ptr) __get_user_bad();
-#define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
-#define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
+#define STD_KERNEL(x, ptr) __put_kernel_asm64((u64)x,ptr)
+#define STD_USER(x, ptr) __put_user_asm64((u64)x,ptr)
  #else
  #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
  #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
@@ -213,41 +213,33 @@
                 : "=r"(__pu_err)                            \
                 : "r"(ptr), "r"(x), "0"(__pu_err))

-static inline void __put_kernel_asm64(u64 x, void *ptr)
-{
-       u32 hi = x>>32;
-       u32 lo = x&0xffffffff;
-       __asm__ __volatile__ (
-               "\n1:\tstw %1,0(%0)\n"
-               "\n2:\tstw %2,4(%0)\n"
-               "3:\n"
-               "\t.section __ex_table,\"a\"\n"
-                "\t.word\t1b\n"
-                "\t.word\t(3b-1b)+1\n"
-                "\t.word\t2b\n"
-                "\t.word\t(3b-2b)+1\n"
-                "\t.previous"
-               : : "r"(ptr), "r"(hi), "r"(lo));
-
-}
-
-static inline void __put_user_asm64(u64 x, void *ptr)
-{
-       u32 hi = x>>32;
-       u32 lo = x&0xffffffff;
-       __asm__ __volatile__ (
-               "\n1:\tstw %1,0(%%sr3,%0)\n"
-               "\n2:\tstw %2,4(%%sr3,%0)\n"
-               "3:\n"
-               "\t.section __ex_table,\"a\"\n"
-                "\t.word\t1b\n"
-                "\t.word\t(3b-1b)+1\n"
-                "\t.word\t2b\n"
-                "\t.word\t(3b-2b)+1\n"
-                "\t.previous"
-               : : "r"(ptr), "r"(hi), "r"(lo));
+#define __put_kernel_asm64(x, ptr)                         \
+       __asm__ __volatile__ (                              \
+               "\n1:\tstw\t%2,0(%1)\n"                     \
+               "2:\tstw\t%R2,4(%1)\n"                      \
+               "3:\n"                                      \
+               "\t.section __ex_table,\"a\"\n"             \
+                "\t.word\t1b\n"                            \
+                "\t.word\t(3b-1b)+1\n"                     \
+                "\t.word\t2b\n"                            \
+                "\t.word\t(3b-2b)+1\n"                     \
+                "\t.previous"                              \
+               : "=r"(__pu_err)                            \
+               : "r"(ptr), "r"(x), "0"(__pu_err))

-}
+#define __put_user_asm64(x, ptr)                           \
+       __asm__ __volatile__ (                              \
+               "\n1:\tstw\t%2,0(%%sr3,%1)\n"               \
+               "2:\tstw\t%R2,4(%%sr3,%1)\n"                \
+               "3:\n"                                      \
+               "\t.section __ex_table,\"a\"\n"             \
+                "\t.word\t1b\n"                            \
+                "\t.word\t(3b-1b)+1\n"                     \
+                "\t.word\t2b\n"                            \
+                "\t.word\t(3b-2b)+1\n"                     \
+                "\t.previous"                              \
+               : "=r"(__pu_err)                            \
+               : "r"(ptr), "r"(x), "0"(__pu_err))

  #endif

----------><----------

Cheers,
	Joel

PS: I also attach the patch for easy apply
and here I need the cast.



Matthew Wilcox wrote:
> On Sun, Nov 09, 2003 at 01:50:49PM +0000, Joel Soete wrote:
> 
>>Joel Soete wrote:
>>
>>>----------><----------
>>>--- uaccess.h.orig    2004-04-20 19:58:08.000000000 +0200
>>>+++ uaccess.h-t2    2004-04-20 20:10:41.000000000 +0200
>>>@@ -42,8 +42,8 @@
>>>#if BITS_PER_LONG == 32
>>>#define LDD_KERNEL(ptr) __get_kernel_bad();
>>>#define LDD_USER(ptr) __get_user_bad();
>>>-#define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
>>>-#define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
>>>+#define STD_KERNEL(x, ptr) __put_kernel_asm64((u64)x,ptr)
>>>+#define STD_USER(x, ptr) __put_user_asm64((u64)x,ptr)
>>>#else
>>>#define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
>>>#define LDD_USER(ptr) __get_user_asm("ldd",ptr)
>>>----------><----------
>>
>>I just test it and it seems to be a fix (among others):
> 
> 
> I figured this out in Chicago airport yesterday.  Grant just pointed
> me to this mail after I checked in the fix deleting the cast entirely.
> Thanks for testing though.
> 
