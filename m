Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA04535
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 01:32:57 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 9 Dec 2000 08:35:38 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA00325;
	Sat, 9 Dec 2000 19:35:20 +1100
Date: Sat, 9 Dec 2000 19:35:20 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Henderson <rth@redhat.com>
cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
In-Reply-To: <20001208235546.A4574@redhat.com>
Message-ID: <Pine.LNX.4.21.0012091927390.32148-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 8 Dec 2000, Richard Henderson wrote:

> On Sat, Dec 09, 2000 at 06:52:13PM +1100, Alan Modra wrote:
> >    for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
> >      if (call_used_regs[i] && ! fixed_regs[i]
> > +	&& REGNO_REG_CLASS (i) == GENERAL_REGS
> 
> This isn't what you meant.  You meant "is this register a 
> member of general regs".  What you got was "is general regs
> the most specific class for this register".

Ah.  What I had to start with was REGNO_REG_CLASS (i) != NO_REGS.
Should have stuck with that.  Hmm, I see local_alloc uses
HARD_REGNO_MODE_OK, so is this better?

        * except.c (eh_regs): Save results of build_pointer_type to a temp
        as FUNCTION_VALUE macro may evaluate its args multiple times.
        When allocating registers, check that the mode is OK.

-- 
Linuxcare.  Support for the Revolution.

--- gcc/except.c~	Mon Dec  4 14:55:35 2000
+++ gcc/except.c	Sat Dec  9 18:56:48 2000
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
+	    && HARD_REGNO_MODE_OK (i, Pmode)
+	    && i != REGNO (rcontext))
 	  break;
       if (i == FIRST_PSEUDO_REGISTER)
 	abort();
@@ -3033,6 +3035,7 @@ eh_regs (pcontext, psp, pra, outgoing)
 
   for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
     if (call_used_regs[i] && ! fixed_regs[i]
+	&& HARD_REGNO_MODE_OK (i, Pmode)
 	&& i != REGNO (rcontext) && i != REGNO (rsp))
       break;
   if (i == FIRST_PSEUDO_REGISTER)
