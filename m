Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F24914829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 15:01:36 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.8/8.12.8) with ESMTP id h2IM1ZsQ019016
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 17:01:36 -0500 (EST)
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.12.8/8.12.8/Submit) id h2IM1ZUJ019015
	for parisc-linux@lists.parisc-linux.org; Tue, 18 Mar 2003 17:01:35 -0500 (EST)
Message-Id: <200303182159.h2ILxZUA018885@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 18 Mar 2003 16:59:35 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
In-Reply-To: <200303181853.h2IIr53R016234@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 18, 2003 01:53:04 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I'm building glibc-2.3.1-15 and should know soon if something
> has changed.

The enclosed patch to pt-initfini.c for gcc 3.3 is missing from -15.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--- pt-initfini.c.orig	2002-08-26 21:52:36.000000000 -0700
+++ pt-initfini.c	2003-03-18 12:11:20.000000000 -0800
@@ -41,70 +41,70 @@
    and epilogues.  Therefore we write these in assembly to make sure
    they do the right thing.  */
 
-__asm__ ("
-
-#include \"defs.h\"
-
-/*@HEADER_ENDS*/
-
-/*@_init_PROLOG_BEGINS*/
-	.section .init
-	.align 4
-	.globl _init
-	.type _init,@function
-_init:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	bl	__pthread_initialize_minimal,%rp
-	copy	%r19,%r4	/* delay slot */
-	copy	%r4,%r19
-/*@_init_PROLOG_ENDS*/
-
-/*@_init_EPILOG_BEGINS*/
-/* Here is the tail end of _init.  */
-	.section .init
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_init:
-	ldwm	-64(%sp),%r4
-
-/* Our very own unwind info, because the assembler can't handle
-   functions split into two or more pieces.  */
-	.section .PARISC.unwind,\"a\",@progbits
-	.extern _init
-	.word	_init, _end_init
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_init_EPILOG_ENDS*/
-
-/*@_fini_PROLOG_BEGINS*/
-	.section .fini
-	.align 4
-	.globl _fini
-	.type _fini,@function
-_fini:
-	stw	%rp,-20(%sp)
-	stwm	%r4,64(%sp)
-	stw	%r19,-32(%sp)
-	copy	%r19,%r4
-/*@_fini_PROLOG_ENDS*/
-
-/*@_fini_EPILOG_BEGINS*/
-	.section .fini
-	ldw	-84(%sp),%rp
-	copy	%r4,%r19
-	bv	%r0(%rp)
-_end_fini:
-	ldwm	-64(%sp),%r4
-
-	.section .PARISC.unwind,\"a\",@progbits
-	.extern _fini
-	.word	_fini, _end_fini
-	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08
-
-/*@_fini_EPILOG_ENDS*/
-
-/*@TRAILER_BEGINS*/
+__asm__ ("								\n\
+									\n\
+#include \"defs.h\"							\n\
+									\n\
+/*@HEADER_ENDS*/							\n\
+									\n\
+/*@_init_PROLOG_BEGINS*/						\n\
+	.section .init							\n\
+	.align 4							\n\
+	.globl _init							\n\
+	.type _init,@function						\n\
+_init:									\n\
+	stw	%rp,-20(%sp)						\n\
+	stwm	%r4,64(%sp)						\n\
+	stw	%r19,-32(%sp)						\n\
+	bl	__pthread_initialize_minimal,%rp			\n\
+	copy	%r19,%r4	/* delay slot */			\n\
+	copy	%r4,%r19						\n\
+/*@_init_PROLOG_ENDS*/							\n\
+									\n\
+/*@_init_EPILOG_BEGINS*/						\n\
+/* Here is the tail end of _init.  */					\n\
+	.section .init							\n\
+	ldw	-84(%sp),%rp						\n\
+	copy	%r4,%r19						\n\
+	bv	%r0(%rp)						\n\
+_end_init:								\n\
+	ldwm	-64(%sp),%r4						\n\
+									\n\
+/* Our very own unwind info, because the assembler can't handle		\n\
+   functions split into two or more pieces.  */				\n\
+	.section .PARISC.unwind,\"a\",@progbits				\n\
+	.extern _init							\n\
+	.word	_init, _end_init					\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08		\n\
+									\n\
+/*@_init_EPILOG_ENDS*/							\n\
+									\n\
+/*@_fini_PROLOG_BEGINS*/						\n\
+	.section .fini							\n\
+	.align 4							\n\
+	.globl _fini							\n\
+	.type _fini,@function						\n\
+_fini:									\n\
+	stw	%rp,-20(%sp)						\n\
+	stwm	%r4,64(%sp)						\n\
+	stw	%r19,-32(%sp)						\n\
+	copy	%r19,%r4						\n\
+/*@_fini_PROLOG_ENDS*/							\n\
+									\n\
+/*@_fini_EPILOG_BEGINS*/						\n\
+	.section .fini							\n\
+	ldw	-84(%sp),%rp						\n\
+	copy	%r4,%r19						\n\
+	bv	%r0(%rp)						\n\
+_end_fini:								\n\
+	ldwm	-64(%sp),%r4						\n\
+									\n\
+	.section .PARISC.unwind,\"a\",@progbits				\n\
+	.extern _fini							\n\
+	.word	_fini, _end_fini					\n\
+	.byte	0x08, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08		\n\
+									\n\
+/*@_fini_EPILOG_ENDS*/							\n\
+									\n\
+/*@TRAILER_BEGINS*/							\n\
 ");
