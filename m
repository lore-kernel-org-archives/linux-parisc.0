From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Mon, 22 Mar 2010 10:26:17 -0400
Message-ID: <119aab441003220726q68e2ff6cwfce105f5cf068ab8@mail.gmail.com>
References: <20100307171207.GA22856@hiauly1.hia.nrc.ca>
	 <20100307203230.CAC964E77@hiauly1.hia.nrc.ca>
	 <20100311032049.GA14312@hiauly1.hia.nrc.ca>
	 <20100311135418.GA22698@bombadil.infradead.org>
	 <20100311224044.GA18789@hiauly1.hia.nrc.ca>
	 <20100313020647.GA26384@hiauly1.hia.nrc.ca>
	 <20100315011024.GA7309@hiauly1.hia.nrc.ca>
	 <119aab441003160449n11cf5272qb9d15fa97625dd7d@mail.gmail.com>
	 <20100321181935.GA19525@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100321181935.GA19525@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 21, 2010 at 2:19 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> I added an illegal instruction abort to the child. =A0In this case,
> the thread_run loop counter was 48085 when the page was copied and
> the before value was zero.
>
> One thought that has crossed my mind is that the memory pages allocat=
ed
> for the stack region used by the thread are somehow getting interchan=
ged
> between parent and child by the fork operation. =A0This happens fairl=
y
> late as both the parent and thread are executing post fork at the tim=
e
> this happens. =A0Possibly, this is part of the bug.
>
> I have looked at entry.S and pacache.S quite a bit and it's not obvio=
us
> how this could happen, although I must admit to not fully understandi=
ng
> the tmp alias code. =A0I tend to think the bug is in the core mm code=
=2E
>
> I see a few cleanups to entry.S. =A0We didn't kill the misnamed macro=
s
> (DEP, DEPI and EXTR) for example. =A0But I don't think these are the =
problem.

Dave,

Thank you for another test case. I agree, I also think the bug is in
the core mm code, which I am also trying to review and understand. I
haven't been able to make much progress in this area though. I'll keep
you updated when I spot something I think is wrong.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
