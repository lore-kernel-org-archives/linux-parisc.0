From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sun, 12 Mar 2006 15:15:09 -0500 (EST)
Message-ID: <200603122015.k2CKF93h017275@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Mar 12, 2006 10:10:53 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>  83c:   6b d3 3f c1     stw r19,-20(sp)
>  840:   e8 5f 1f bd     b,l 824 <_init-0x10>,rp
>  844:   08 13 02 44     copy r19,r4
>  848:   08 04 02 53     copy r4,r19
>  84c:   e8 40 01 f0     b,l 94c <frame_dummy>,rp
>  850:   08 00 02 40     nop
>  854:   e8 40 05 c0     b,l b3c <__do_global_ctors_aux>,rp
>  858:   08 00 02 40     nop
>  85c:   4b c2 3f 59     ldw -54(sp),rp
>  860:   08 04 02 53     copy r4,r19
>  864:   e8 40 c0 00     bv r0(rp)

I'm testing the attached fix.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: config/pa/pa32-linux.h
===================================================================
--- config/pa/pa32-linux.h	(revision 111979)
+++ config/pa/pa32-linux.h	(working copy)
@@ -1,5 +1,5 @@
 /* Definitions for PA_RISC with ELF-32 format
-   Copyright (C) 2000, 2002, 2004 Free Software Foundation, Inc.
+   Copyright (C) 2000, 2002, 2004, 2006 Free Software Foundation, Inc.
 
 This file is part of GCC.
 
@@ -36,4 +36,29 @@
 		    aligned(sizeof(func_ptr))))				\
     = { (func_ptr) (-1) }
 
+/* This is a PIC version of CRT_CALL_STATIC_FUNCTION.  The PIC
+   register has to be saved before the call and restored after
+   the call.  We assume that register %r4 is available for this
+   purpose.  The hack prevents GCC from deleting the restore.  */
+#ifdef CRTSTUFFS_O
+#undef CRT_CALL_STATIC_FUNCTION
+#define CRT_CALL_STATIC_FUNCTION(SECTION_OP, FUNC)	\
+static void __attribute__((__used__))			\
+call_ ## FUNC (void)					\
+{							\
+  asm (SECTION_OP);					\
+  asm volatile (".call\n\t"				\
+		"bl " #FUNC ",%%r2\n\t"			\
+		"copy %%r19,%%r4\n\t"			\
+		"copy %%r4,%%r19\n"			\
+		:					\
+		:					\
+		: "r1", "r2", "r4", "r20", "r21",	\
+		  "r22", "r24", "r24", "r25", "r26",	\
+		  "r27", "r28", "r29", "r31");		\
+  FORCE_CODE_SECTION_ALIGN				\
+  asm (TEXT_SECTION_ASM_OP);				\
+}
+#endif
+
 #define MD_UNWIND_SUPPORT "config/pa/linux-unwind.h"
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
