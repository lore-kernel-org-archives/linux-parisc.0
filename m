From: Adrian Bunk <bunk@stusta.de>
Subject: [parisc-linux] [2.6 patch] arch/parisc/Makefile: remove GCC_VERSION
Date: Sat, 19 Aug 2006 19:19:38 +0200
Message-ID: <20060819171938.GK7813__34672.941247891$1416624596$gmane$org@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Sam Ravnborg <sam@ravnborg.org>,
 Matthew Wilcox <willy@parisc-linux.org>,
 grundler@parisc-linux.org,
 parisc-linux@parisc-linux.org,
 linux-kernel@vger.kernel.org,
 Kyle McMartin <kyle@mcmartin.ca>
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

This patch removes the usage of GCC_VERSION from arch/parisc/Makefile.

There are no functional changes, it simply makes it a bit shorter (and 
removes the last instance of GCC_VERSION in the kernel).

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Acked-by: Kyle McMartin <kyle@mcmartin.ca>

---

This patch was already sent on:
- 12 Jan 2006

--- linux-2.6.15-mm3-hppa/arch/parisc/Makefile.old	2006-01-12 03:11:45.000000000 +0100
+++ linux-2.6.15-mm3-hppa/arch/parisc/Makefile	2006-01-12 03:12:35.000000000 +0100
@@ -35,12 +35,8 @@
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
 
-GCC_VERSION     := $(call cc-version)
-ifneq ($(shell if [ -z $(GCC_VERSION) ] ; then echo "bad"; fi ;),)
-$(error Sorry, couldn't find ($(cc-version)).)
-endif
-ifneq ($(shell if [ $(GCC_VERSION) -lt 0303 ] ; then echo "bad"; fi ;),)
-$(error Sorry, your compiler is too old ($(GCC_VERSION)).  GCC v3.3 or above is required.)
+ifneq ($(shell if [ $(call cc-version) -lt 0303 ] ; then echo "bad"; fi ;),)
+$(error Sorry, your compiler is too old.  GCC v3.3 or above is required.)
 endif
 
 cflags-y	:= -pipe

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
