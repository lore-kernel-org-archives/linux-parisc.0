Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA17873
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 09:21:08 -0700
Message-Id: <200101151624.LAA26183@hiauly1.hia.nrc.ca>
Subject: Re: Oust HPPA PIC_OFFSET_TABLE_REGNUM_SAVED
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 15 Jan 2001 11:24:22 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@redhat.com, gcc-patches@gcc.gnu.org,
        parisc-linux@puffin.external.hp.com
In-Reply-To: <Pine.LNX.4.21.0101151430350.21322-100000@front.linuxcare.com.au> from "Alan Modra" at Jan 15, 2001 10:09:30 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> This patch rids us of PIC_OFFSET_TABLE_REGNUM_SAVED, and the problems that
> go with it.  Additionally, I reload the pic offset table register before
> calls to guard against asm trashing r27/r19.  Hasn't bootstrapped yet, but
> looks promising.  One possible fly in the ointment is whether any ABI
> requires that r4 always be used to save the pic offset table reg.

At first glance, this looks like a good solution.  I don't see any requirement
that r4 be used to save the pic offset table reg in either ABI.

However, why is it necessary to guard against asms trashing r27/r19?  If
this happens, data access using gp won't work as well.  Shouldn't asms
ensure that they restore r27/r19 if they trash it?  If in fact r27/r19
needs to be restored prior to calls, it looks like it also needs to be
restored prior to each procedure return (see below).  This would prevent
the trivial return from ever being generated whenever pic code is used.
Thus, it seems necessary to ensure that r27/r19 is preserved from entry
to exit.

This is what the 64-Bit ABI says about r27:

GR 27 serves as the global pointer (gp).  This is a dedicated register with
special conventions.  Its use is subject to the following rules:

a) On entry to a procedure, gp is guaranteed valid for that procedure.

b) At any direct procedure call, gp must be valid (for the caller).  This
   guarantees that an import stub (see Section 5.2) can access the linkage
   table.

c) Any procedure call (indirect or direct) may destroy gp--unless the call
   is known to be local to the load module.

d) At procedure return, gp must be valid (for the returning procedure).
   This allows us to optimize calls known to be local (the exception to
   Rule `c').

The effect of these rules is that gp must be treated as a scratch register
at a point of call but a procedure must preserve it from entry to exit.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
