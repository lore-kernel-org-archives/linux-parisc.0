Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F1EA4891
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Nov 2003 15:15:41 -0700 (MST)
Message-ID: <3FAD6B1A.6060605@tiscali.be>
Date: Sat, 08 Nov 2003 22:15:54 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org>
In-Reply-To: <20031108194804.GA28929@colo.lackof.org>
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

Any way, should it be this stuff (I don't notice it before):
----------><----------
--- uaccess.h.orig	2004-04-20 19:58:08.000000000 +0200
+++ uaccess.h-t1	2004-04-20 20:10:09.000000000 +0200
@@ -42,8 +42,8 @@
  #if BITS_PER_LONG == 32
  #define LDD_KERNEL(ptr) __get_kernel_bad();
  #define LDD_USER(ptr) __get_user_bad();
-#define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
-#define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
+#define STD_KERNEL(x, ptr) __put_kernel_asm64(x,ptr)
+#define STD_USER(x, ptr) __put_user_asm64(x,ptr)
  #else
  #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
  #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
----------><----------

But I presume it should reuired some cast so would it be better:
----------><----------
--- uaccess.h.orig	2004-04-20 19:58:08.000000000 +0200
+++ uaccess.h-t2	2004-04-20 20:10:41.000000000 +0200
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
----------><----------

I don't test it but hth,
	Joel



Grant Grundler wrote:
> On Sat, Nov 08, 2003 at 10:59:20AM +0000, Joel Soete wrote:
> 
>>IIRC include/asm-parisc/uaccess.h
> 
> 
> get/put user stuff looks the same to me in both 2.4/2.6 cvs.
> I'm likely to forget forward porting 2.4 changes to 2.6 but I thought
> I got that in the last round. If someone trolls the parisc-linux-cvs
> archive and compares my commits for the past 2-3 monthes...
> 
> thanks,
> grant
> 
