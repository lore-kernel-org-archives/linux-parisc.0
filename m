Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA03584
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 14:38:56 -0700
Message-Id: <200011142140.QAA19580@hiauly1.hia.nrc.ca>
Subject: Re: abort in eliminate_regs compiling glob.c from glibc
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 14 Nov 2000 16:40:52 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org,
        gcc-patches@gcc.gnu.org
In-Reply-To: <200011092357.SAA08600@hiauly1.hia.nrc.ca> from "John David Anglin" at Nov 9, 2000 06:57:13 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > Breakpoint 2, eliminate_regs_in_insn (insn=0x406a0ba0, replace=0)
> >     at ../../gcc/reload1.c:2826
> > 2826      if (! insn_is_asm && icode < 0)
> > (gdb) p debug_rtx (insn)
> > (insn/s 2711 2709 2719 (set (reg:SI 6 %r6)
> >         (reg:SI 28 %r28)) 69 {pre_ldw-4} (insn_list 2708 (insn_list:REG_DEP_ANTI 2696 (insn_list:REG_DEP_ANTI 2702 (insn_list:REG_DEP_ANTI 2697 (nil)))))
> >     (expr_list:REG_DEAD (reg:SI 28 %r28)
> >         (insn_list:REG_RETVAL 2708 (expr_list:REG_EQUAL (expr_list (use (mem:BLK (scratch) 0))
> >                     (expr_list (symbol_ref/v:SI ("@strlen"))
> >                         (expr_list (reg/v:SI 4 %r4)
> >                             (nil))))
> >                 (nil)))))
> 
> The `use' arises from the `__pure__' attribute in the prototype for strlen:
> 
> extern size_t strlen (__const char *__s) __attribute__ ((__pure__));

Here is a patch to fix the abort in eliminate_regs when it encounters a USE.
As I understand the situation, there are three conditions needed to trigger
it:

1)	A function that contains insns with an eliminable register.
2)	The function must call __builtin_alloca to change the frame size
	from its initial size.
3)	After the call to __builtin_alloca, there must be a call to a
	pure function.

With the enclosed patch, I can now build glibc for hppa-linux with -O3
optimisation.

Please review carefully because I will be the first to admit that I don't
understand why the use is there in the first place and all the details of
what eliminate_reg does.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-11-14  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* reload1.c (eliminate_regs): Don't abort on MEM USEs.

--- reload1.c.orig	Wed Sep 27 14:27:23 2000
+++ reload1.c	Tue Nov 14 16:01:56 2000
@@ -2499,6 +2499,10 @@
 	return x;
 
     case USE:
+      /* Handle insn_list USE that a call to a pure functions may generate. */
+      new = eliminate_regs (XEXP (x, 0), 0, insn);
+      if (GET_CODE (new) == MEM)
+	return XEXP (new, 0);
     case CLOBBER:
     case ASM_OPERANDS:
     case SET:
