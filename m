Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA25339
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 17:13:58 -0700
Date: Wed, 6 Dec 2000 16:16:27 -0800
From: Richard Henderson <rth@redhat.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001206161627.C1272@redhat.com>
References: <200012051942.OAA24760@hiauly1.hia.nrc.ca> <200012062041.PAA21573@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012062041.PAA21573@hiauly1.hia.nrc.ca>; from John David Anglin on Wed, Dec 06, 2000 at 03:41:06PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Dec 06, 2000 at 03:41:06PM -0500, John David Anglin wrote:
> >     (expr_list:REG_EQUIV (mem/u:SI (lo_sum:SI (reg/f:SI 309)
> > 		(unspec:SI[
> > 			(symbol_ref:SI ("constructor_max_index"))
> > 		    ]  0)) 0)

This appears to be the same sort of bug as in compile/20001205-1.c
except that an unspec is involved instead of an asm_operands.

I wonder if the best solution is to avoid local-alloc creating
REG_EQUIV notes for every little thing under the sun.  Allow
only general_operand or something.


r~
