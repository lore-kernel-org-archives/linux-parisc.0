Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA29631
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 16:43:07 -0700
Date: Fri, 8 Dec 2000 15:45:27 -0800
From: Richard Henderson <rth@redhat.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001208154527.B4084@redhat.com>
References: <20001206161627.C1272@redhat.com> <200012082205.RAA22208@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012082205.RAA22208@hiauly1.hia.nrc.ca>; from John David Anglin on Fri, Dec 08, 2000 at 05:05:21PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 08, 2000 at 05:05:21PM -0500, John David Anglin wrote:
> I am wondering if side_effects_p should return 1 if it encounters
> an UNSPEC.

No, because an UNSPEC has no side effects.

As I said before, the simplest thing is to check for general_operand
before creating the REG_EQUAL note.  Any other solution requires reload
to Do Things to the INSN_CODE during rematerialization.


r~
