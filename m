Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA00769
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 14:25:42 -0700
Date: Mon, 11 Dec 2000 16:27:22 -0500
From: Michael Meissner <meissner@cygnus.com>
To: Richard Henderson <rth@redhat.com>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, alan@linuxcare.com.au,
        law@cygnus.com, rhirst@linuxcare.com, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001211162722.D7646@cse.cygnus.com>
References: <20001206161627.C1272@redhat.com> <200012082205.RAA22208@hiauly1.hia.nrc.ca> <20001208154527.B4084@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001208154527.B4084@redhat.com>; from rth@redhat.com on Fri, Dec 08, 2000 at 03:45:27PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 08, 2000 at 03:45:27PM -0800, Richard Henderson wrote:
> On Fri, Dec 08, 2000 at 05:05:21PM -0500, John David Anglin wrote:
> > I am wondering if side_effects_p should return 1 if it encounters
> > an UNSPEC.
> 
> No, because an UNSPEC has no side effects.

To be pedantic, an UNSPEC by itself has no side effects, but obviously an
UNSPEC could have arguments that use PRE_DEC, PRE_INC, POST_MODIFY, etc.

> As I said before, the simplest thing is to check for general_operand
> before creating the REG_EQUAL note.  Any other solution requires reload
> to Do Things to the INSN_CODE during rematerialization.

-- 
Michael Meissner, Red Hat, Inc.
PMB 198, 174 Littleton Road #3, Westford, Massachusetts 01886, USA
Work:	  meissner@redhat.com		phone: +1 978-486-9304
Non-work: meissner@spectacle-pond.org	fax:   +1 978-692-4482
