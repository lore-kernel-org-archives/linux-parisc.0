Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA26190
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 17:55:51 -0700
Message-Id: <200012070057.TAA28741@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: rth@redhat.com (Richard Henderson)
Date: Wed, 6 Dec 2000 19:57:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <20001206161627.C1272@redhat.com> from "Richard Henderson" at Dec 6, 2000 04:16:27 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Wed, Dec 06, 2000 at 03:41:06PM -0500, John David Anglin wrote:
> > >     (expr_list:REG_EQUIV (mem/u:SI (lo_sum:SI (reg/f:SI 309)
> > > 		(unspec:SI[
> > > 			(symbol_ref:SI ("constructor_max_index"))
> > > 		    ]  0)) 0)
> 
> This appears to be the same sort of bug as in compile/20001205-1.c
> except that an unspec is involved instead of an asm_operands.
> 
> I wonder if the best solution is to avoid local-alloc creating
> REG_EQUIV notes for every little thing under the sun.  Allow
> only general_operand or something.

I am testing the following.  The bootstrap has gone well past the above
point.  Maybe some generalization of this would work in general or
some similar control could be added to local-alloc regarding the creation
of REG_EQUIV notes.  This method works well here because there are no
valid substitutions of PIC mem's on the PA as far as I am aware.  Another
method might be to scan the insn list and check that the substitution is
valid for all the insns that use the register before deciding that a
REG_EQUIV note should be added.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-12-06  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa.h (PIC_ADDRESS_P): Define macro to recognize PIC address.
	* reload1.c (reload): Don't set reg_equiv_mem if PIC_ADDRESS_P
	is defined and true.

--- config/pa/pa.h.orig	Sat Dec  2 02:43:02 2000
+++ config/pa/pa.h	Wed Dec  6 17:27:21 2000
@@ -1091,6 +1091,14 @@
    || GET_CODE (X) == HIGH) 						\
    && (reload_in_progress || reload_completed || ! symbolic_expression_p (X)))
 
+/* Recognize a PIC address.  */
+
+#define PIC_ADDRESS_P(X)			\
+   (GET_CODE (X) == LO_SUM			\
+    && GET_CODE (XEXP (X, 0)) == REG            \
+    && REG_OK_FOR_BASE_P (XEXP (X, 0))		\
+    && GET_CODE (XEXP (X, 1)) == UNSPEC)	\
+
 /* Include all constant integers and constant doubles, but not
    floating-point, except for floating-point zero.
 
--- reload1.c.orig	Thu Nov 30 17:39:21 2000
+++ reload1.c	Wed Dec  6 17:18:27 2000
@@ -881,8 +881,14 @@
 	  {
 	    rtx x = eliminate_regs (reg_equiv_memory_loc[i], 0, NULL_RTX);
 
+#ifndef PIC_ADDRESS_P
 	    if (strict_memory_address_p (GET_MODE (regno_reg_rtx[i]),
 					 XEXP (x, 0)))
+#else
+	    if (strict_memory_address_p (GET_MODE (regno_reg_rtx[i]),
+					 XEXP (x, 0))
+		&& ! PIC_ADDRESS_P (XEXP (x, 0)))
+#endif
 	      reg_equiv_mem[i] = x, reg_equiv_address[i] = 0;
 	    else if (CONSTANT_P (XEXP (x, 0))
 		     || (GET_CODE (XEXP (x, 0)) == REG
