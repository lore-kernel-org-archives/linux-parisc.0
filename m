Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA19102
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Jan 2001 13:08:51 -0700
Date: Sat, 27 Jan 2001 12:12:46 -0800
From: Richard Henderson <rth@redhat.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org,
        gcc-patches@gcc.gnu.org
Subject: Re: abort in eliminate_regs compiling glob.c from glibc
Message-ID: <20010127121246.A6654@redhat.com>
References: <200011092357.SAA08600@hiauly1.hia.nrc.ca> <200011142140.QAA19580@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011142140.QAA19580@hiauly1.hia.nrc.ca>; from John David Anglin on Tue, Nov 14, 2000 at 04:40:52PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 14, 2000 at 04:40:52PM -0500, John David Anglin wrote:
>      case USE:
> +      /* Handle insn_list USE that a call to a pure functions ...
> +      new = eliminate_regs (XEXP (x, 0), 0, insn);
> +      if (GET_CODE (new) == MEM)
> +	return XEXP (new, 0);

This is not correct.  You want to return something that still
looks like a USE.  Probably you want

	new = eliminate_regs (XEXP (x, 0), 0, insn);
	if (new != XEXP (x, 0))
	  return gen_rtx_USE (GET_MODE (x), new);
	return x;


r~
