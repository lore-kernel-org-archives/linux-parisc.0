Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA31941
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 13:14:26 -0700
Message-Id: <200010302015.PAA05033@hiauly1.hia.nrc.ca>
Subject: Re: testcase for hppa64 gcc bug
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 30 Oct 2000 15:15:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com, law@cygnus.com
In-Reply-To: <Pine.LNX.4.21.0010301335000.25085-100000@front.linuxcare.com.au> from "Alan Modra" at Oct 30, 2000 06:04:44 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I think I know what's going on here.  The root of the problem is that
> pa-64.h defines an ARG_POINTER_REGNUM that isn't a fixed reg, and isn't
> eliminable.  The arg_pointer isn't even a call-saved reg.  That breaks a
> number of places in the compiler.
> 
> So I went down the path of trying to fix things properly by defining
> ELIMINABLE_REGS and so on, but I ended in a maze of twisty little passages
> labelled "Unrecognizable instruction", like this one:
> 
> /src/parisc/gcc/gcc/libgcc2.c: In function `__moddi3':
> /src/parisc/gcc/gcc/libgcc2.c:601: Unrecognizable insn:
> (insn 1289 209 1298 (set (reg:SI 50 %fr22)
>         (subreg:SI (plus:DI (reg:DI 30 %r30)
>                 (const_int -272 [0xfffffef0])) 0)) -1 (nil)
>     (nil))
> /src/parisc/gcc/gcc/libgcc2.c:601: Internal compiler error in
> extract_insn, at recog.c:2134
> 
> Anyway, this hack seems to fix it for me.
> 
> 	* rtl.h (ARG_POINTER_INVARIANT): Define as 1 if undef.
> 	* rtlanal.c (rtx_unstable_p): Qualify arg_pointer_rtx match with
> 	ARG_POINTER_INVARIANT.
> 	(rtx_varies_p): Likewise.
> 	(rtx_addr_can_trap_p): Likewise.
> 	* local-alloc.c (function_invariant_p): Likewise.
> 	* loop.c (loop_invariant_p): Likewise.
> 	* tm.texi (ARG_POINTER_INVARIANT): Describe.

I don't think this is the correct fix.  Isn't r29 used for 128 bit
return values?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
