Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA13815
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 00:03:42 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 30 Oct 2000 07:05:13 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA03853;
	Mon, 30 Oct 2000 18:04:44 +1100
Date: Mon, 30 Oct 2000 18:04:44 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: gcc-bugs@gcc.gnu.org
cc: gcc-patches@gcc.gnu.org, parisc-linux@thepuffingroup.com,
        Jeffrey A Law <law@cygnus.com>
Subject: Re: testcase for hppa64 gcc bug
In-Reply-To: <Pine.LNX.4.21.0010270024230.31251-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0010301335000.25085-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 27 Oct 2000, Alan Modra wrote:

> char *f3 (char *a, char *b)
> {
>   char *c = 0;
> 
>   if (f1 (&b) != 0)
>     goto out;
> 
>   /* hppa64 passes bogus value for b */
>   f2 (b, &c);
> 
> out:
>   return c;
> }

I think I know what's going on here.  The root of the problem is that
pa-64.h defines an ARG_POINTER_REGNUM that isn't a fixed reg, and isn't
eliminable.  The arg_pointer isn't even a call-saved reg.  That breaks a
number of places in the compiler.

So I went down the path of trying to fix things properly by defining
ELIMINABLE_REGS and so on, but I ended in a maze of twisty little passages
labelled "Unrecognizable instruction", like this one:

/src/parisc/gcc/gcc/libgcc2.c: In function `__moddi3':
/src/parisc/gcc/gcc/libgcc2.c:601: Unrecognizable insn:
(insn 1289 209 1298 (set (reg:SI 50 %fr22)
        (subreg:SI (plus:DI (reg:DI 30 %r30)
                (const_int -272 [0xfffffef0])) 0)) -1 (nil)
    (nil))
/src/parisc/gcc/gcc/libgcc2.c:601: Internal compiler error in
extract_insn, at recog.c:2134

Anyway, this hack seems to fix it for me.

	* rtl.h (ARG_POINTER_INVARIANT): Define as 1 if undef.
	* rtlanal.c (rtx_unstable_p): Qualify arg_pointer_rtx match with
	ARG_POINTER_INVARIANT.
	(rtx_varies_p): Likewise.
	(rtx_addr_can_trap_p): Likewise.
	* local-alloc.c (function_invariant_p): Likewise.
	* loop.c (loop_invariant_p): Likewise.
	* tm.texi (ARG_POINTER_INVARIANT): Describe.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

Index: gcc/local-alloc.c
===================================================================
RCS file: /cvs/gcc/egcs/gcc/local-alloc.c,v
retrieving revision 1.72
diff -u -p -r1.72 local-alloc.c
--- gcc/local-alloc.c	2000/10/23 18:42:52	1.72
+++ gcc/local-alloc.c	2000/10/30 03:57:35
@@ -780,10 +780,12 @@ function_invariant_p (x)
 {
   if (CONSTANT_P (x))
     return 1;
-  if (x == frame_pointer_rtx || x == arg_pointer_rtx)
+  if (x == frame_pointer_rtx
+      || (ARG_POINTER_INVARIANT && x == arg_pointer_rtx))
     return 1;
   if (GET_CODE (x) == PLUS
-      && (XEXP (x, 0) == frame_pointer_rtx || XEXP (x, 0) == arg_pointer_rtx)
+      && (XEXP (x, 0) == frame_pointer_rtx
+	  || (ARG_POINTER_INVARIANT && XEXP (x, 0) == arg_pointer_rtx))
       && CONSTANT_P (XEXP (x, 1)))
     return 1;
   return 0;
Index: gcc/loop.c
===================================================================
RCS file: /cvs/gcc/egcs/gcc/loop.c,v
retrieving revision 1.293
diff -u -p -r1.293 loop.c
--- gcc/loop.c	2000/10/21 12:12:07	1.293
+++ gcc/loop.c	2000/10/30 03:58:24
@@ -3038,7 +3038,7 @@ loop_invariant_p (loop, x)
 	 since the reg might be set by initialization within the loop.  */
 
       if ((x == frame_pointer_rtx || x == hard_frame_pointer_rtx
-	   || x == arg_pointer_rtx)
+	   || (ARG_POINTER_INVARIANT && x == arg_pointer_rtx))
 	  && ! current_function_has_nonlocal_goto)
 	return 1;
 
Index: gcc/rtl.h
===================================================================
RCS file: /cvs/gcc/egcs/gcc/rtl.h,v
retrieving revision 1.228
diff -u -p -r1.228 rtl.h
--- gcc/rtl.h	2000/10/16 16:24:54	1.228
+++ gcc/rtl.h	2000/10/30 04:03:31
@@ -1504,6 +1504,10 @@ extern rtx global_rtl[GR_MAX];
 #define hard_frame_pointer_rtx	(global_rtl[GR_HARD_FRAME_POINTER])
 #define arg_pointer_rtx		(global_rtl[GR_ARG_POINTER])
 
+#ifndef ARG_POINTER_INVARIANT
+#define ARG_POINTER_INVARIANT 1
+#endif
+
 extern rtx pic_offset_table_rtx;
 extern rtx struct_value_rtx;
 extern rtx struct_value_incoming_rtx;
Index: gcc/rtlanal.c
===================================================================
RCS file: /cvs/gcc/egcs/gcc/rtlanal.c,v
retrieving revision 1.74
diff -u -p -r1.74 rtlanal.c
--- gcc/rtlanal.c	2000/10/24 23:01:11	1.74
+++ gcc/rtlanal.c	2000/10/30 04:03:51
@@ -71,7 +71,8 @@ rtx_unstable_p (x)
     case REG:
       /* As in rtx_varies_p, we have to use the actual rtx, not reg number.  */
       if (x == frame_pointer_rtx || x == hard_frame_pointer_rtx
-	  || x == arg_pointer_rtx || RTX_UNCHANGING_P (x))
+	  || (ARG_POINTER_INVARIANT && x == arg_pointer_rtx)
+	  || RTX_UNCHANGING_P (x))
 	return 0;
 #ifndef PIC_OFFSET_TABLE_REG_CALL_CLOBBERED
       /* ??? When call-clobbered, the value is stable modulo the restore
@@ -144,7 +145,7 @@ rtx_varies_p (x)
 	 eliminated the frame and/or arg pointer and are using it
 	 for pseudos.  */
       if (x == frame_pointer_rtx || x == hard_frame_pointer_rtx
-	  || x == arg_pointer_rtx)
+	  || (ARG_POINTER_INVARIANT && x == arg_pointer_rtx))
 	return 0;
 #ifndef PIC_OFFSET_TABLE_REG_CALL_CLOBBERED
       /* ??? When call-clobbered, the value is stable modulo the restore
@@ -209,7 +210,8 @@ rtx_addr_can_trap_p (x)
     case REG:
       /* As in rtx_varies_p, we have to use the actual rtx, not reg number.  */
       return ! (x == frame_pointer_rtx || x == hard_frame_pointer_rtx
-		|| x == stack_pointer_rtx || x == arg_pointer_rtx);
+		|| (ARG_POINTER_INVARIANT && x == arg_pointer_rtx)
+		|| x == stack_pointer_rtx);
 
     case CONST:
       return rtx_addr_can_trap_p (XEXP (x, 0));
Index: gcc/tm.texi
===================================================================
RCS file: /cvs/gcc/egcs/gcc/tm.texi,v
retrieving revision 1.149
diff -u -p -r1.149 tm.texi
--- gcc/tm.texi	2000/10/18 17:51:54	1.149
+++ gcc/tm.texi	2000/10/30 04:06:49
@@ -2564,7 +2564,12 @@ register this is.  On other machines, yo
 wish for this purpose.  If this is not the same register as the frame
 pointer register, then you must mark it as a fixed register according to
 @code{FIXED_REGISTERS}, or arrange to be able to eliminate it
-(@pxref{Elimination}).
+(@pxref{Elimination}), or clear ARG_POINTER_INVARIANT
+
+@findex ARG_POINTER_INVARIANT
+@item ARG_POINTER_INVARIANT
+ARG_POINTER_INVARIANT allows the compiler to assume that
+ARG_POINTER_REGNUM is unchanging over the life of a function.
 
 @findex RETURN_ADDRESS_POINTER_REGNUM
 @item RETURN_ADDRESS_POINTER_REGNUM
Index: gcc/config/pa/pa-64.h
===================================================================
RCS file: /cvs/gcc/egcs/gcc/config/pa/pa-64.h,v
retrieving revision 1.3
diff -u -p -r1.3 pa-64.h
--- gcc/config/pa/pa-64.h	2000/09/25 13:39:45	1.3
+++ gcc/config/pa/pa-64.h	2000/10/30 04:30:51
@@ -129,6 +129,7 @@ do {  \
 #undef ARGS_GROW_DOWNWARD
 #undef ARG_POINTER_REGNUM
 #define ARG_POINTER_REGNUM 29
+#define ARG_POINTER_INVARIANT 0
 #undef STATIC_CHAIN_REGNUM
 #define STATIC_CHAIN_REGNUM 31
 
