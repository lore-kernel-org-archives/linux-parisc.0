Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26048
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Dec 2000 10:19:28 -0700
Message-Id: <200012221721.MAA00889@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: rth@redhat.com (Richard Henderson)
Date: Fri, 22 Dec 2000 12:21:54 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <20001208173948.B4198@redhat.com> from "Richard Henderson" at Dec 8, 2000 05:39:48 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> On Fri, Dec 08, 2000 at 08:07:23PM -0500, John David Anglin wrote:
> > It is my impression that the MEM would pass as a general_operand unless
> > the volatile flag is set.  It will pass GO_IF_LEGITIMATE_ADDRESS.  Thus,
> > the general_operand test doesn't look like it will work.
> 
> Your GO_IF_LEGITIMATE_ADDRESS will accept the UNSPEC?
> The mind boggles.  Why, then, is this strange beast its own insn?

I have done some more testing.

Modifying GO_IF_LEGITIMATE_ADDRESS and adding a general_operand test
to validate_equiv_mem doesn't look like it will work.  The fundamental
problem is that the MEM must pass the GO_IF_LEGITIMATE_ADDRESS test during
reload.  However, this is when we would like the UNSPEC to fail the
general_operand test.

Preventing the substitution of equivalent MEMs increases register pressure. 
Thus, it is desirable to allow substitutions where possible.  On the other
hand, the PA instruction can't handle all substitution possibilities.
Thus, even if all the different insns that handle MEMs in one way or
another were combined into a single insn, reload could still produce
something that wouldn't work.

For a given mode, pa.md has several different insns that for example
load memory to a register.  These exist as different insns because
the predicates (and code) differ.  Thus, it is not possible to substitute
the MEM from one insn into another.

I was able to modify print_operand to handle the UNSPEC beast and delete
the `ldw RT' insns for loading a PIC address.  However, I am not certain
that I can work all the insns into a single insn.  I am most concerned
about the index insns `{ldwx|ldw}'.

The simplest solution that I can think of is not to allow equivalent
MEMs on the PA at all (DONT_ALLOW_EQUIV_MEM?).  Since the problem doesn't
seem to happen that frequently given the number of registers available,
possibly this this is a reasonable approach.  What do you think?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
