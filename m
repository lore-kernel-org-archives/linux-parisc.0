Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA17716
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Nov 2000 19:48:59 -0700
Message-Id: <200011100250.VAA08742@hiauly1.hia.nrc.ca>
Subject: Re: abort in eliminate_regs compiling glob.c from glibc
To: alan@linuxcare.com.au (Alan Modra)
Date: Thu, 9 Nov 2000 21:50:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0011101123290.1107-100000@front.linuxcare.com.au> from "Alan Modra" at Nov 10, 2000 11:36:56 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > > 2826      if (! insn_is_asm && icode < 0)
> > > (gdb) p debug_rtx (insn)
> > > (insn/s 2711 2709 2719 (set (reg:SI 6 %r6)
> > >         (reg:SI 28 %r28)) 69 {pre_ldw-4} (insn_list 2708 (insn_list:REG_DEP_ANTI 2696 (insn_list:REG_DEP_ANTI 2702 (insn_list:REG_DEP_ANTI 2697 (nil)))))
> > >     (expr_list:REG_DEAD (reg:SI 28 %r28)
> > >         (insn_list:REG_RETVAL 2708 (expr_list:REG_EQUAL (expr_list (use (mem:BLK (scratch) 0))
> > >                     (expr_list (symbol_ref/v:SI ("@strlen"))
> > >                         (expr_list (reg/v:SI 4 %r4)
> > >                             (nil))))
> > >                 (nil)))))
> > 
> > The `use' arises from the `__pure__' attribute in the prototype for strlen:
> > 
> > extern size_t strlen (__const char *__s) __attribute__ ((__pure__));
> 
> I don't see this problem using current puffin CVS hppa64-linux gcc.  Was
> this with your REG_ELIMINATE patch?

No.  Well actually I saw it first with the patch.  I see this with the
32 bit compiler.  The only elimination with the 32 bit compiler is the
default frame pointer elimination.

I just tried the hppa64-linux-gcc compiler with the source that I posted
and it didn't abort.  There were lots of warnings about int to pointer
conversions though.

Make sure you compile with -O2 or -O3?  Register elimination only occurs
at -O2 or above.  I see the problem both with a i686-linux cross compiler
and a fairly recent native hpux compiler under hpux 10.20.  The problem is
not present in 2.95.2 but it doesn't support the pure atribute.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
