Return-Path: <sdbrady@ntlworld.com>
Received: from mta02-svc.ntlworld.com (mta02-svc.ntlworld.com [62.253.162.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5ECC4855
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 12:42:45 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta02-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040223194014.JQQY14417.mta02-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 19:40:14 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1AvLwd-0000MO-00 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 19:40:47 +0000
Date: Mon, 23 Feb 2004 19:40:47 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] include/linux/soundcard.h endian fix
Message-ID: <20040223194047.GA448@calypso>
References: <20040222070150.GA773@calypso> <20040223122458.GA6675@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040223122458.GA6675@tausq.org>
Sender: Stuart Brady <sdbrady@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Feb 23, 2004 at 04:24:58AM -0800, Randolph Chung wrote:
> > Would it be better to do the following? :
> > 
> > #ifdef(__BYTE_ORDER)
> > #  if defined(__BIG_ENDIAN)
> > #    if __BYTE_ORDER == __BIG_ENDIAN
> > #      define AFMT_S16_NE AFMT_S16_BE
> > #    endif
> > #  elif defined(__LITTLE_ENDIAN)
> > #    if __BYTE_ORDER == __LITTLE_ENDIAN
> > #      define AFMT_S16_NE AFMT_S16_LE
> > #    endif
> > #  end if
> > #endif
> 
> yes, this is much better. If you include asm/byteorder.h then this
> should always be defined. maybe add a #error to catch the (unlikely)
> case where neither is defined?

This header is used in userland - is using <asm/byteorder.h> still okay?
<endian.h> defines both __LITTLE_ENDIAN and __BIG_ENDIAN - the fact that
one of these exists means nothing - you have to look at __BYTE_ORDER.
<asm/byteorder.h> will define one but not the other, and __BYTE_ORDER is
not defined. If a user includes <endian.h> followed by <sys/soundcard.h>,
and we use <asm/byteorder.h>, then both __LITTLE_ENDIAN and __BIG_ENDIAN
will be defined at the same time. How about this? :

Index: soundcard.h
===================================================================
RCS file: /var/cvs/linux-2.4/include/linux/soundcard.h,v
retrieving revision 1.6
diff -u -r1.6 soundcard.h
--- soundcard.h	26 Jun 2003 15:08:08 -0000	1.6
+++ soundcard.h	23 Feb 2004 15:15:23 -0000
@@ -39,6 +39,13 @@
 /* In Linux we need to be prepared for cross compiling */
 #include <linux/ioctl.h>
 
+/* Endian macros. Note that they have a different meaning in the kernel.
+#ifdef __KERNEL__
+#  include <asm/byteorder.h>
+#else
+#  include <endian.h>
+#endif
+
 /*
  *	Supported card ID numbers (Should be somewhere else?)
  */
@@ -179,13 +186,28 @@
  * Some big endian/little endian handling macros
  */
 
-#if defined(_AIX) || defined(AIX) || defined(sparc) || defined(__sparc__) || defined(HPPA) || defined(PPC) || defined(__mc68000__)
-/* Big endian machines */
-#  define _PATCHKEY(id) (0xfd00|id)
-#  define AFMT_S16_NE AFMT_S16_BE
-#else
-#  define _PATCHKEY(id) ((id<<8)|0xfd)
-#  define AFMT_S16_NE AFMT_S16_LE
+#if defined(__BIG_ENDIAN)
+#  if defined(__KERNEL__) || (defined(__BYTE_ORDER) && __BYTE_ORDER == __BIG_ENDIAN)
+#    if defined(AFMT_S16_NE) || defined(_PATCHKEY)
+#      error AFMT_S16_NE (or _PATCHKEY) is already defined
+#    endif
+#    define AFMT_S16_NE AFMT_S16_BE
+#    define _PATCHKEY(id) (0xfd00|id)
+#  endif
+#endif
+
+#if defined(__LITTLE_ENDIAN)
+#  if defined(__KERNEL__) || (defined(__BYTE_ORDER) && __BYTE_ORDER == __LITTLE_ENDIAN)
+#    if defined(AFMT_S16_NE) || defined(_PATCHKEY)
+#      error AFMT_S16_NE (or _PATCHKEY) is already defined
+#    endif
+#    define AFMT_S16_NE AFMT_S16_LE
+#    define _PATCHKEY(id) ((id<<8)|0xfd)
+#  endif
+#endif
+
+#if !defined(AFMT_S16_NE)
+#  error Failed to define AFMT_S16_NE
 #endif
 
 /*

I suppose the system-specific tests aren't necessary - if you're using
our soundcard.h, then you have our <endian.h>, too. I think the #error
is a good idea for the same reason - if the #error happens, something
really is wrong, and apps might otherwise silently test for AFMT_S16_NE,
possibly even defining it themselves.

The test for AIX || _AIX strongly implies that this header was once
intended to be used on other systems. Should we just ignore that?

BTW, AFMT_S32_NE isn't defined, but it's in the specification. It might
be worth adding that. AFMT_U16_NE isn't even in the spec.
-- 
Stuart Brady
