Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA30710
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 18:05:03 -0700
Message-Id: <200012090107.UAA28226@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: rth@redhat.com (Richard Henderson)
Date: Fri, 8 Dec 2000 20:07:23 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <20001208154527.B4084@redhat.com> from "Richard Henderson" at Dec 8, 2000 03:45:27 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Fri, Dec 08, 2000 at 05:05:21PM -0500, John David Anglin wrote:
> > I am wondering if side_effects_p should return 1 if it encounters
> > an UNSPEC.
> 
> No, because an UNSPEC has no side effects.
> 
> As I said before, the simplest thing is to check for general_operand
> before creating the REG_EQUAL note.  Any other solution requires reload
> to Do Things to the INSN_CODE during rematerialization.

It is my impression that the MEM would pass as a general_operand unless
the volatile flag is set.  It will pass GO_IF_LEGITIMATE_ADDRESS.  Thus,
the general_operand test doesn't look like it will work.

Currently, the unchanging bit is set for the MEM.  The comments in
rtl.h say that the bit in a SYMBOL_REF is used for machine specific
purposes.  Could it be used to add machine dependent side effects to
a SYMBOL_REF (or possibly an UNSPEC)?

I think Doing Things to the INSN_CODE during rematerialization is too
late unless there is an initial check to determine whether this is possible.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
