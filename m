From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 17 Oct 2011 11:47:06 -0400
Message-ID: <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<20111017152358.GA3518@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org, jejb@parisc-linux.org,
	kyle@mcmartin.ca, deller@gmx.de, carlos@systemhalted.org,
	debian-hppa@lists.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111017152358.GA3518@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 17, 2011 at 11:23 AM, Domenico Andreoli <cavokz@gmail.com> =
wrote:
> Hi John,
>
> On Sun, Oct 09, 2011 at 04:40:10PM -0400, John David Anglin wrote:
>> In debugging the failure of the glibc tst-cond18 test on parisc, I r=
ealized
>> that futexes need to use the same locks the lws calls. =A0This fixes=
 all the
>> pthread 'cond' tests. =A0Sadly, there are still problems with thread=
 cancellation.
>
> I applied your patch to 3.1-rc9 and tried to build Debian eglibc 2.13=
-21. It
> passed tst-cond18 but is hanging on tst-fork1. Is it where you see th=
e thread
> cancellation issue?
>
> Thank you for having looked at it.

The test-fork1 failure is still unexplained and happens intermittently.

The cancellation issues happen in tst-cancel*.

I believe the cancellation issues are toolchain issues and I need to
look into them.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
