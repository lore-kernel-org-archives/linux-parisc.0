Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA03273
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 00:50:01 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 9 Dec 2000 07:52:41 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA31286;
	Sat, 9 Dec 2000 18:52:13 +1100
Date: Sat, 9 Dec 2000 18:52:13 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Jeffrey A Law <law@redhat.com>
cc: Richard Henderson <rth@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem 
In-Reply-To: <23471.976334727@upchuck>
Message-ID: <Pine.LNX.4.21.0012091544270.17519-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 8 Dec 2000, Jeffrey A Law wrote:

> Ironic that this is the hack that I ripped out (for basically the same reasons)
> when I started working on V3.

Talking of hacks, and changing the subject, I've been hacking the pa
prologue and epilogue code for dwarf2 unwind support.  Still at the
head-scratching stage (danger of splinters), with aborts in
dwarf2out_frame_debug_expr, but here's a fix for a couple of problems in
except.c:eh_regs.

	* except.c (eh_regs): Save results of build_pointer_type to a temp
	as FUNCTION_VALUE macro may evaluate its args multiple times.
	When allocating registers, check for GENERAL_REGS class.

On hppa, we tried to allocate r0 :-(

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

--- gcc/except.c~	Mon Dec  4 14:55:35 2000
+++ gcc/except.c	Sat Dec  9 17:48:21 2000
@@ -3000,15 +3000,15 @@ eh_regs (pcontext, psp, pra, outgoing)
 {
   rtx rcontext, rsp, rra;
   unsigned int i;
+  tree t;
 
+  t = build_pointer_type (void_type_node);
 #ifdef FUNCTION_OUTGOING_VALUE
   if (outgoing)
-    rcontext = FUNCTION_OUTGOING_VALUE (build_pointer_type (void_type_node),
-				        current_function_decl);
+    rcontext = FUNCTION_OUTGOING_VALUE (t, current_function_decl);
   else
 #endif
-    rcontext = FUNCTION_VALUE (build_pointer_type (void_type_node),
-			       current_function_decl);
+    rcontext = FUNCTION_VALUE (t, current_function_decl);
 
 #ifdef STATIC_CHAIN_REGNUM
   if (outgoing)
@@ -3023,7 +3023,9 @@ eh_regs (pcontext, psp, pra, outgoing)
   if (rsp == NULL_RTX)
     {
       for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
-	if (call_used_regs[i] && ! fixed_regs[i] && i != REGNO (rcontext))
+	if (call_used_regs[i] && ! fixed_regs[i]
+	    && REGNO_REG_CLASS (i) == GENERAL_REGS
+	    && i != REGNO (rcontext))
 	  break;
       if (i == FIRST_PSEUDO_REGISTER)
 	abort();
@@ -3033,6 +3035,7 @@ eh_regs (pcontext, psp, pra, outgoing)
 
   for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
     if (call_used_regs[i] && ! fixed_regs[i]
+	&& REGNO_REG_CLASS (i) == GENERAL_REGS
 	&& i != REGNO (rcontext) && i != REGNO (rsp))
       break;
   if (i == FIRST_PSEUDO_REGISTER)
