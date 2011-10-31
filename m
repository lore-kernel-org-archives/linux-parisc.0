From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Sun, 30 Oct 2011 20:21:31 -0400
Message-ID: <CADZpyizsC-eSgCSyK52-Ns12z+mWUpFB8JH2dC2C7J_3EnGR5Q@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com>
	<BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl>
	<2746859.nK5NlKbf2R@donald.sf-tec.de>
	<BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Oct 30, 2011 at 12:13 PM, John David Anglin
<dave.anglin@bell.net> wrote:
> On 30-Oct-11, at 11:31 AM, Rolf Eike Beer wrote:
>
>> John David Anglin wrote:
>>
>>> This problem is fixed in the GCC trunk and 4.4, 4.5 and 4.6 branche=
s.
>>> libmpfr4-3.1.0 now passes all tests.
>>
>> Can we get a link to a bug or a commit so we could easily put this i=
nto
>> the
>> gentoo patchset for local usage until a new version is released?
>
>
> The trunk patch is on the gcc-patches list:
> http://gcc.gnu.org/ml/gcc-patches/2011-10/msg02758.html
>
> There are two variants of the patch:
> http://gcc.gnu.org/viewcvs?view=3Drevision&revision=3D180655
> http://gcc.gnu.org/viewcvs?view=3Drevision&revision=3D180662
>
> The first is for 4.7. =A0The latter applies to 4.4, 4.5 and 4.6.

Awesome! Great work Dave! :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
