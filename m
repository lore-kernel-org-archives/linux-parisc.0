Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA01188
	for <parisc-linux@puffin.external.hp.com>; Mon, 30 Oct 2000 15:15:37 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 30 Oct 2000 22:17:16 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA23691;
	Tue, 31 Oct 2000 09:16:43 +1100
Date: Tue, 31 Oct 2000 09:16:43 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
cc: gcc-bugs@gcc.gnu.org, gcc-patches@gcc.gnu.org,
        parisc-linux@thepuffingroup.com, law@cygnus.com
Subject: Re: testcase for hppa64 gcc bug
In-Reply-To: <200010302015.PAA05033@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.21.0010310822570.22018-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 30 Oct 2000, John David Anglin wrote:

> > 	* rtl.h (ARG_POINTER_INVARIANT): Define as 1 if undef.
> > 	* rtlanal.c (rtx_unstable_p): Qualify arg_pointer_rtx match with
> > 	ARG_POINTER_INVARIANT.
> > 	(rtx_varies_p): Likewise.
> > 	(rtx_addr_can_trap_p): Likewise.
> > 	* local-alloc.c (function_invariant_p): Likewise.
> > 	* loop.c (loop_invariant_p): Likewise.
> > 	* tm.texi (ARG_POINTER_INVARIANT): Describe.
> 
> I don't think this is the correct fix.  Isn't r29 used for 128 bit
> return values?

Yes, r29 is used for 128 bit return values, but how is that relevant to
use of r29 as the arg pointer?

I tried setting up ELIMINATE_REGS and so forth (see puffin CVS
gcc/config/pa/pa-linux64.h) but that failed badly with what looked like,
from a very cursory inspection, a use of r29 as a temporary reg being
"eliminated" to r30+const.  Oops.

Anyway, nothing in the above patch should make the situation worse.  All
it really does is let the compiler see places where arg_pointer changes,
instead of blindly assuming that arg_pointer will not change.  Take a peek
at the .lreg rtl for the test case I posted.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
