Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA31404
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Dec 2000 18:37:55 -0700
Date: Fri, 8 Dec 2000 17:39:48 -0800
From: Richard Henderson <rth@redhat.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, law@cygnus.com, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001208173948.B4198@redhat.com>
References: <20001208154527.B4084@redhat.com> <200012090107.UAA28226@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200012090107.UAA28226@hiauly1.hia.nrc.ca>; from John David Anglin on Fri, Dec 08, 2000 at 08:07:23PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 08, 2000 at 08:07:23PM -0500, John David Anglin wrote:
> It is my impression that the MEM would pass as a general_operand unless
> the volatile flag is set.  It will pass GO_IF_LEGITIMATE_ADDRESS.  Thus,
> the general_operand test doesn't look like it will work.

Your GO_IF_LEGITIMATE_ADDRESS will accept the UNSPEC?
The mind boggles.  Why, then, is this strange beast its own insn?

Perhaps that is part of the bug...


r~
