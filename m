Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E8FF4835
	for <parisc-linux@parisc-linux.org>; Sun,  6 Jan 2002 10:26:34 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id znvdkaaa for parisc-linux@parisc-linux.org; Sun, 6 Jan 2002 10:20:49 -0700
Date: Sun, 6 Jan 2002 09:26:19 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020106172619.GD14884@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="lCAWRPmW1mITcIfM"
Subject: [parisc-linux] PIC assembly
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

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is bug in the libgcrypt package in Debian where one of the
assembly routines was not written for PIC linking. The bug is:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=127863&repeatmerged=yes

I'ved filed a possible patch for this in the bug report, but I'm not
100% convinced I understand this correctly. Can someone please take a
look and let me know? 

the original .S file and the patch are also attached

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="udiv-qrnnd.S"

/* HP-PA  __udiv_qrnnd division support, used from longlong.h.
 *	  This version runs fast on PA 7000 and later.
 *
 *      Copyright (C) 1993, 1994, 1998, 
 *                    2001 Free Software Foundation, Inc.
 *
 * This file is part of GnuPG.
 *
 * GnuPG is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * GnuPG is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 *
 * Note: This code is heavily based on the GNU MP Library.
 *	 Actually it's the same code with only minor changes in the
 *	 way the data is stored; this is to support the abstraction
 *	 of an optional secure memory allocation which may be used
 *	 to avoid revealing of sensitive data due to paging etc.
 *	 The GNU MP Library itself is published under the LGPL;
 *	 however I decided to publish this code under the plain GPL.
 */



/* INPUT PARAMETERS
 *   rem_ptr	   gr26
 *   n1 	   gr25
 *   n0 	   gr24
 *   d		   gr23
 */

	.code
	.label L$0000
	.word		0x43f00000
	.word		0x0
	.export 	__udiv_qrnnd
	.label		__udiv_qrnnd
	.proc
	.callinfo	frame=64,no_calls
	.entry
	ldo		64(%r30),%r30

	stws		%r25,-16(0,%r30)	; n_hi
	stws		%r24,-12(0,%r30)	; n_lo
	ldil		L'L$0000,%r19           ; '
	ldo		R'L$0000(%r19),%r19     ; '
	fldds		-16(0,%r30),%fr5
	stws		%r23,-12(0,%r30)
	comib,<=	0,%r25,L$1
	fcnvxf,dbl,dbl	%fr5,%fr5
	fldds		0(0,%r19),%fr4
	fadd,dbl	%fr4,%fr5,%fr5
	.label	L$1
	fcpy,sgl	%fr0,%fr6L
	fldws		-12(0,%r30),%fr6R
	fcnvxf,dbl,dbl	%fr6,%fr4

	fdiv,dbl	%fr5,%fr4,%fr5

	fcnvfx,dbl,dbl	%fr5,%fr4
	fstws		%fr4R,-16(%r30)
	xmpyu		%fr4R,%fr6R,%fr6
	ldws		-16(%r30),%r28
	fstds		%fr6,-16(0,%r30)
	ldws		-12(0,%r30),%r21
	ldws		-16(0,%r30),%r20
	sub		%r24,%r21,%r22
	subb		%r25,%r20,%r19
	comib,= 	0,%r19,L$2
	ldo		-64(%r30),%r30

	add		%r22,%r23,%r22
	ldo		-1(%r28),%r28
	.label	L$2
	bv		0(%r2)
	stws		%r22,0(0,%r26)

	.exit
	.procend



--lCAWRPmW1mITcIfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="udiv-qrnnd.diff"

--- udiv-qrnnd.S.orig	Thu May 31 03:14:12 2001
+++ udiv-qrnnd.S	Sat Jan  5 23:27:02 2002
@@ -51,8 +51,11 @@
 
 	stws		%r25,-16(0,%r30)	; n_hi
 	stws		%r24,-12(0,%r30)	; n_lo
-	ldil		L'L$0000,%r19           ; '
-	ldo		R'L$0000(%r19),%r19     ; '
+
+	stw             %r19,-32(%r30)
+	addil		LT%L$0000,%r19
+	ldw		RT%L$0000(%r1),%r1
+	ldw		0(%r1), %r19
 	fldds		-16(0,%r30),%fr5
 	stws		%r23,-12(0,%r30)
 	comib,<=	0,%r25,L$1

--lCAWRPmW1mITcIfM--
