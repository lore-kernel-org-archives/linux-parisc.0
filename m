From: Keith Owens <kaos@ocs.com.au>
Subject: [parisc-linux] Re: [Linux-ia64] Announce: modutils 2.4.24 is available
Date: Sun, 23 Mar 2003 14:29:05 +1100
Message-ID: <8755.1048390145__42730.7716258385$1416622319$gmane$org@ocs3.intra.ocs.com.au>
References: <20030323032318.GD31008@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-reply-to: Your message of "Sun, 23 Mar 2003 03:23:18 -0000."
             <20030323032318.GD31008@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 23 Mar 2003 03:23:18 +0000, 
Matthew Wilcox <willy@debian.org> wrote:
>On Sun, Mar 23, 2003 at 02:16:01PM +1100, Keith Owens wrote:
>> This version of modutils is functionally identical to 2.4.23 except for
>> those architectures that have function descriptors, i.e. ia64 and
>> ppc64.
>
>parisc also has function descriptors.  what needs to happen for us?

Index: 24.3/include/util.h
--- 24.3/include/util.h Sun, 23 Mar 2003 13:34:28 +1100 kaos (modutils-2.4/51_util.h 1.4 644)
+++ 24.3(w)/include/util.h Sun, 23 Mar 2003 14:28:36 +1100 kaos (modutils-2.4/51_util.h 1.4 644)
@@ -96,7 +96,7 @@ void gzf_close(int fd);
 #define SYMPREFIX "__insmod_";
 extern const char symprefix[10];	/* Must be sizeof(SYMPREFIX), including nul */
 
-#if defined(ARCH_ia64) || defined(ARCH_ppc64)
+#if defined(ARCH_ia64) || defined(ARCH_ppc64) || defined(ARCH_hppa64)
 #define HAS_FUNCTION_DESCRIPTORS
 #endif
 
