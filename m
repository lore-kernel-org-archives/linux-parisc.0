Return-Path: <sdbrady@ntlworld.com>
Received: from mta04-svc.ntlworld.com (mta04-svc.ntlworld.com [62.253.162.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26AEF488A
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 00:01:51 -0700 (MST)
Received: from calypso ([62.254.21.7]) by mta04-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040222070139.BWPE20489.mta04-svc.ntlworld.com@calypso>
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 07:01:39 +0000
Received: from sdb by calypso with local (Exim 3.36 #1 (Debian))
	id 1Auncc-0000ef-00 for <parisc-linux@lists.parisc-linux.org>;
	Sun, 22 Feb 2004 07:01:50 +0000
Date: Sun, 22 Feb 2004 07:01:50 +0000
From: Stuart Brady <sdbrady@ntlworld.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040222070150.GA773@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] include/linux/soundcard.h endian fix
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

It seems that <linux/soundcard.h> defines AFMT_S16_NE as AFMT_S16_LE on
hppa. Both GCC 3.0 and 3.3 predefine __hppa__, but not HPPA. IMO, the
bug is in soundcard.h, not GCC.

Index: soundcard.h
===================================================================
RCS file: /var/cvs/linux-2.4/include/linux/soundcard.h,v
retrieving revision 1.6
diff -u -r1.6 soundcard.h
--- soundcard.h	26 Jun 2003 15:08:08 -0000	1.6
+++ soundcard.h	21 Feb 2004 16:04:12 -0000
@@ -179,7 +179,7 @@
  * Some big endian/little endian handling macros
  */
 
-#if defined(_AIX) || defined(AIX) || defined(sparc) || defined(__sparc__) || defined(HPPA) || defined(PPC) || defined(__mc68000__)
+#if defined(_AIX) || defined(AIX) || defined(sparc) || defined(__sparc__) || defined(HPPA) || defined(__hppa__) || defined(PPC) || defined(__powerpc__) || defined(__mc68000__)
 /* Big endian machines */
 #  define _PATCHKEY(id) (0xfd00|id)
 #  define AFMT_S16_NE AFMT_S16_BE

I've added __powerpc__ too, because PPC won't be defined if you compiled
with -ansi.

I noticed this problem when looking at Timidity, which was writing big
endian data with AFMT_S16_NE. The OSS 1.1 API Spec[1] (page 38) states:

"The AFMT_S16_NE format can be used when a program wants to encode or
decode 16-bit samples locally. It automatically selects the right format
for the CPU architecture being compiled for. In this way it's usually
possible to simply use signed short format to store the samples."

This doesn't really seem to make _solid_ promises that the format
matches the architecture's endianness - "Right format?" "Usually?"
I wonder whether Timidity is making an incorrect assumption?

Would it be better to do the following? :

#ifdef(__BYTE_ORDER)
#  if defined(__BIG_ENDIAN)
#    if __BYTE_ORDER == __BIG_ENDIAN
#      define AFMT_S16_NE AFMT_S16_BE
#    endif
#  elif defined(__LITTLE_ENDIAN)
#    if __BYTE_ORDER == __LITTLE_ENDIAN
#      define AFMT_S16_NE AFMT_S16_LE
#    endif
#  end if
#endif

After this, if AFMT_S16_NE is not defined, it might be worth checking
the appropriate system-specific predefined macros[2]. If it's still not
defined, I think is that it's better _not_ to assume little endian. I've
left out __PDP_ENDIAN - I doubt anything uses it these days.


[1] http://www.opensound.com/pguide/oss.pdf

[2] Big endian: _AIX, AIX, sparc, __sparc__, __mc68000__, __m68k__,
MIPSEB, __MIPSEB__, __ARMEB, HPPA, __hppa__, PPC, __ppc_, __PPC__,
__powerpc__. Little endian: i386, __i386__, __x86_64__, __amd64__,
__sh__, __vax__ (yes, really!), MIPSEL, __MIPSEL__, and __ARMEL__,
__alpha, __alpha__, __ia64__. It seems that ppc, hppa, ia64, alpha,
sparc, mips, arm and superh have both big and little endian modes.
-- 
Stuart Brady
