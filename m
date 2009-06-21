From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 17:37:23 -0400
Message-ID: <119aab440906211437y60ad647ax6ec4d1d9890fe997@mail.gmail.com>
References: <119aab440906211301sf3b549dtd2a29839e86d4bfe@mail.gmail.com>
	 <20090621202129.69B214F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090621202129.69B214F19@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 21, 2009 at 4:21 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> Sorry, this turns out not to be correct, after tracing the assembly
>> completely (including loads in delayed branches) it looks like the
>> location read from the pid through ptrace might be wrong. I'll have =
to
>> keep debugging this.
>
> Delayed branches are a nasty invention. =A0I am testing a patch to
> fix a problem that appeared last week.

Interesting.

> When a conditional branch with an unfilled delay slot is followed
> by an asm, bad things may end up in the delay slot. =A0Even worse,
> the branch may branch into the delay slot. =A0GCC has no idea what's
> in an asm. =A0So, I'm trying to add a nop in the delay slot when a
> conditional branch is followed by an asm.

There is an on-and-off-again bug in glibc's vfprintf.c implementation
that causes DBR to miscompile that file, but it comes and goes
depending on the gcc version. I filed a bug once, but because I
couldn't produce a reduced testcase Pinski closed it. If I see it
again I'll try again to produce a reduced testcase.

How's 4.4 on hppa?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
