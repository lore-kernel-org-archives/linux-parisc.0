Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA16531
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Nov 2000 17:35:16 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 10 Nov 2000 00:37:11 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA05720;
	Fri, 10 Nov 2000 11:36:56 +1100
Date: Fri, 10 Nov 2000 11:36:56 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: parisc-linux@thepuffingroup.com
Subject: Re: abort in eliminate_regs compiling glob.c from glibc
In-Reply-To: <200011092357.SAA08600@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0011101123290.1107-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 9 Nov 2000, John David Anglin wrote:

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

I don't see this problem using current puffin CVS hppa64-linux gcc.  Was
this with your REG_ELIMINATE patch?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
