Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA08310
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 06:54:41 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 9 Dec 2000 13:57:21 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA12853;
	Sun, 10 Dec 2000 00:57:03 +1100
Date: Sun, 10 Dec 2000 00:57:03 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Henderson <rth@redhat.com>
cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
In-Reply-To: <Pine.LNX.4.21.0012091927390.32148-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0012100011540.32148-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 9 Dec 2000, Alan Modra wrote:

> Ah.  What I had to start with was REGNO_REG_CLASS (i) != NO_REGS.
> Should have stuck with that.  Hmm, I see local_alloc uses
> HARD_REGNO_MODE_OK, so is this better?

Grrr, that allocates r1 first, which loses on 32-bit hppa.  Here's yet
another try, a little more sophisticated this time.

        * except.c (eh_regs): Save results of build_pointer_type to a temp
        as FUNCTION_VALUE macro may evaluate its args multiple times.
        When allocating registers, do so according to REG_ALLOC_ORDER and
	choose GENERAL_REGS.

I was tempted to remove the call_used_regs and fixed_regs tests when
REG_ALLOC_ORDER is defined, but on checking some targets found i860 has a
fixed reg as it's no. 1 priority reg.  Strange.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

--- gcc/except.c~	Mon Dec  4 14:55:35 2000
+++ gcc/except.c	Sun Dec 10 00:11:29 2000
@@ -2999,16 +2999,16 @@ eh_regs (pcontext, psp, pra, outgoing)
      int outgoing ATTRIBUTE_UNUSED;
 {
   rtx rcontext, rsp, rra;
-  unsigned int i;
+  unsigned int i, r;
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
@@ -3023,22 +3023,39 @@ eh_regs (pcontext, psp, pra, outgoing)
   if (rsp == NULL_RTX)
     {
       for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
-	if (call_used_regs[i] && ! fixed_regs[i] && i != REGNO (rcontext))
-	  break;
+	{
+#ifdef REG_ALLOC_ORDER
+	  r = reg_alloc_order[i];
+#else
+	  r = i;
+#endif
+	  if (call_used_regs[r] && ! fixed_regs[r]
+	      && TEST_HARD_REG_BIT (reg_class_contents[(int) GENERAL_REGS], r)
+	      && r != REGNO (rcontext))
+	    break;
+	}
       if (i == FIRST_PSEUDO_REGISTER)
 	abort();
 
-      rsp = gen_rtx_REG (Pmode, i);
+      rsp = gen_rtx_REG (Pmode, r);
     }
 
   for (i = 0; i < FIRST_PSEUDO_REGISTER; ++i)
-    if (call_used_regs[i] && ! fixed_regs[i]
-	&& i != REGNO (rcontext) && i != REGNO (rsp))
-      break;
+    {
+#ifdef REG_ALLOC_ORDER
+      r = reg_alloc_order[i];
+#else
+      r = i;
+#endif
+      if (call_used_regs[r] && ! fixed_regs[r]
+	  && TEST_HARD_REG_BIT (reg_class_contents[(int) GENERAL_REGS], r)
+	  && r != REGNO (rcontext) && r != REGNO (rsp))
+	break;
+    }
   if (i == FIRST_PSEUDO_REGISTER)
     abort();
 
-  rra = gen_rtx_REG (Pmode, i);
+  rra = gen_rtx_REG (Pmode, r);
 
   *pcontext = rcontext;
   *psp = rsp;
