Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FAB04841
	for <parisc-linux@parisc-linux.org>; Sun,  9 Nov 2003 10:36:52 -0700 (MST)
Message-ID: <3FAE7B44.6020805@tiscali.be>
Date: Sun, 09 Nov 2003 17:37:08 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] 2.4 64bits MAX_ADDRESS ?
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

Hi all,

Being at the very begining of my study of the Mel Goramn' thesis and so 
comparing parisc linux vm implementation, I just try to figure out some 
cst values. I so write I small case:

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define PAGE_SHIFT 12
#define PAGE_SIZE       (1UL << PAGE_SHIFT)
#define PAGE_MASK       (~(PAGE_SIZE-1))

/* ifdef __LP64__ */
#define PT_NLEVELS 3
#define PT_INITIAL 4 /* Number of initial page tables */
/*
#else __LP64__
#define PT_NLEVELS 2
#define PT_INITIAL 2
#endif
  */

#define MAX_ADDRBITS (PAGE_SHIFT + (PT_NLEVELS)*(PAGE_SHIFT - PT_NLEVELS))
#define MAX_ADDRESS (1UL << MAX_ADDRBITS)


int main(int argc, char * * argv, char * * env) {

     printf("For remainder:\n");
     printf("Int size: %d,\n", sizeof(int));
     printf("Long size: %d,\n", sizeof(long));
     printf("LongLong size: %d.\n\n", sizeof(long long));
     printf("Some VM cst into parisc 64bits:\n");
     printf("PAGE_SHIFT: %#010x (%u)\n\n", PAGE_SHIFT, PAGE_SHIFT);
     printf("PAGE_SIZE   (1UL << PAGE_SHIFT)\n");
     printf("PAGE_SIZE: %#010x (%u)\n\n", PAGE_SIZE, PAGE_SIZE);
     printf(" PAGE_MASK  (~(PAGE_SIZE-1))\n");
     printf("PAGE_MASK: %#010x (%u) (%d)\n\n", PAGE_MASK, PAGE_MASK, 
PAGE_MASK);

     printf("PT_NLEVELS: %#010x (%u)\n\n", PT_NLEVELS, PT_NLEVELS);
     printf("PT_INITIAL: %#010x (%u)\n\n", PT_INITIAL, PT_INITIAL);
     printf("MAX_ADDRBITS (PAGE_SHIFT + (PT_NLEVELS)*(PAGE_SHIFT - 
PT_NLEVELS))\n");
     printf("MAX_ADDRBITS: %#010x (%u)\n\n", MAX_ADDRBITS, MAX_ADDRBITS);
     printf("MAX_ADDRESS (1UL << MAX_ADDRBITS)\n");
     printf("MAX_ADDRESS: %#010Lx (%ul)\n\n", MAX_ADDRESS, MAX_ADDRESS);
}

which correctly warm me about some 'overflow':

foo.c: In function `main':
foo.c:42: warning: left shift count >= width of type
foo.c:42: warning: left shift count >= width of type

afaik MAX_ADDRBITS==39 against a long contains only 32bits?

So is this patch make sense for all (I trust if we want a day managing 
the some 15 Exabytes of vm available with pa-2.0 processors):
---------><---------
--- include/asm-parisc/pgtable.h.orig	2003-11-09 18:08:10.000000000 +0100
+++ include/asm-parisc/pgtable.h	2003-11-09 18:09:01.000000000 +0100
@@ -72,7 +72,11 @@
  #endif

  #define MAX_ADDRBITS (PAGE_SHIFT + (PT_NLEVELS)*(PAGE_SHIFT - PT_NLEVELS))
+#ifdef __LP64__
+#define MAX_ADDRESS (1ULL << MAX_ADDRBITS)
+#else
  #define MAX_ADDRESS (1UL << MAX_ADDRBITS)
+#endif

  #define SPACEID_SHIFT (MAX_ADDRBITS - 32)

---------><---------

And may be is this not the only change. Please advise.

Thanks inadvance,
	Joel
