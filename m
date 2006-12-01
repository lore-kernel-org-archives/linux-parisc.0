From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [2.6 patch] arch/parisc/Makefile: remove
	GCC_VERSION
Date: Fri, 1 Dec 2006 11:23:55 -0700
Message-ID: <20061201182355.GC10549__12204.3425021277$1416624623$gmane$org@colo.lackof.org>
References: <20061201114908.GR11084@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 Kyle McMartin <kyle@mcmartin.ca>,
 linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 parisc-linux@parisc-linux.org
To: Adrian Bunk <bunk@stusta.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061201114908.GR11084@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 01, 2006 at 12:49:08PM +0100, Adrian Bunk wrote:
> This patch removes the usage of GCC_VERSION from arch/parisc/Makefile.
> 
> There are no functional changes, it simply makes it a bit shorter (and 
> removes the last instance of GCC_VERSION in the kernel).

Thanks!
I've committed a variant of this to git://git.parisc-linux.org/git/linux-2.6.git
I didn't test the failure case - only that it doesn't trigger with
my current gcc 4.x compilers.

I expect Kyle will push parisc tree to linus in the near future.

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>


diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 9b7e424..760567a 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -35,12 +35,8 @@ FINAL_LD=$(CROSS_COMPILE)ld --warn-commo
 
 OBJCOPY_FLAGS =-O binary -R .note -R .comment -S
 
-GCC_VERSION     := $(call cc-version)
-ifneq ($(shell if [ -z $(GCC_VERSION) ] ; then echo "bad"; fi ;),)
-$(error Sorry, couldn't find ($(cc-version)).)
-endif
-ifneq ($(shell if [ $(GCC_VERSION) -lt 0303 ] ; then echo "bad"; fi ;),)
-$(error Sorry, your compiler is too old ($(GCC_VERSION)).  GCC v3.3 or above is required.)
+ifneq ($(call cc-ifversion, -lt, 0303, "bad"),)
+$(error Sorry, GCC v3.3 or above is required.)
 endif
 
 cflags-y	:= -pipe
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
