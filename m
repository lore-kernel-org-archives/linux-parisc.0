Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA30556
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 12:59:58 -0700
Message-Id: <200011032001.PAA27415@hiauly1.hia.nrc.ca>
Subject: Re: testcase for hppa64 gcc bug
To: alan@linuxcare.com.au (Alan Modra)
Date: Fri, 3 Nov 2000 15:01:17 -0500 (EST)
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

I am making progress in trying to make the arg_pointer register eliminable.
I have fixed the above problem.  What was happening was that reload_as_needed
was incorrectly trying to eliminate the return from millicode calls which
is also register r29.  I have figured out how to hide it from reload with
unspec.

However, the compiler is now too good at eliminating the arg_pointer.  At
-O3, it completely eliminates the arg_pointer.  However, as I read the ABI,
the call must always set the arg_pointer before calls.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
