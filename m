Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA28489
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 15:04:10 -0700
Message-Id: <200012082205.RAA22208@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: rth@redhat.com (Richard Henderson)
Date: Fri, 8 Dec 2000 17:05:21 -0500 (EST)
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

I am wondering if side_effects_p should return 1 if it encounters
an UNSPEC.  Currently, it just ignores it.  This would prevent the
generation of the REG_EQUIV notes and I think resolve the problem.
However, it might have other side effects.  Any thoughts on this?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
