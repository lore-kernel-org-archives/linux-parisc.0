Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D2784829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Nov 2002 11:58:38 -0700 (MST)
Date: Mon, 11 Nov 2002 13:58:47 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Message-ID: <20021111185847.GA9607@systemhalted>
References: <20021111171255.GI8848@systemhalted> <200211111736.gABHaP7E002352@hiauly1.hia.nrc.ca> <20021111180016.D29998@parcelfarce.linux.theplanet.co.uk> <20021111182012.GN8848@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021111182012.GN8848@systemhalted>
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

> > 
> > > +	stw	%rp,-20(%sp)\n\
> > > +	stwm	%r4,64(%sp)\n\
> > > +	stw	%r19,-32(%sp)\n\
> > 
> > By and large we've preferred the following style which is less ugly, IMO:
> > 
> > "	stw	%rp,-20(%sp)\n"
> > "	stwm	%r4,64(%sp)\n"
> > "	stw	%r19,-32(%sp)\n"
> > 
> 
> All of Uli's fixes have been the ugly way, though I'll change
> pt-initfini the nice and pretty way and hope they take the patch :)
> 

Either way is pretty if you space it nicely...
I think the following patch is correct, it's currently building...

c.


diff -urN glibc-2.3.1.orig/linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c glibc-2.3.1/linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c
--- glibc-2.3.1.orig/linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c	2002-08-26 18:39:29.000000000 -0400
+++ glibc-2.3.1/linuxthreads/sysdeps/unix/sysv/linux/hppa/pt-initfini.c	2002-11-11 13:36:31.000000000 -0500
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
