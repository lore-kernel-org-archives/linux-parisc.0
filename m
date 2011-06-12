From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: eglibc_2.13-5 on hppa
Date: Sun, 12 Jun 2011 15:57:06 -0400
Message-ID: <BANLkTi=ntF31tACKcowCtLDL728N3hNcvA@mail.gmail.com>
References: <20110608013308.GA15282@hiauly1.hia.nrc.ca>
	<BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
	<20110612184719.GA13337@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110612184719.GA13337@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 12, 2011 at 2:47 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> There seems to be a problem with this futex call:
> futex(0xfdffb2c8, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 0) =
> -1 EINVAL (Invalid argument)
>
> and the clock_gettime return seems wierd.

Thanks, can you construct a test case from this that I can use to
debug the problem? If not, then I'll look at this after I look at the
testsuite failures.

Cheers,
Carlos.
