From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: eglibc_2.13-5 on hppa
Date: Wed, 8 Jun 2011 16:04:16 -0400
Message-ID: <BANLkTimXa6TF7a5QxEh=MZcbmyU+4XywdA@mail.gmail.com>
References: <20110608013308.GA15282@hiauly1.hia.nrc.ca>
	<BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
	<20110608162029.GB12658@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110608162029.GB12658@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jun 8, 2011 at 12:20 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> No timeouts? =A0The testsuite doesn't hang as it eventually kills the
> tasks. =A0My run was on rp3440 with 2.6.39.1 with James' last two
> cache fixes.

Yes, I do see timeouts. Specifically these nine tests tst-cancel22,
tst-cancel23, tst-cancelx4, tst-cancelx5, tst-timer4, tst-timer5,
tst-cputimer1, tst-cputimer2, and tst-cputimer3.

I need to investigate why they timeout.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
