From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Fri, 21 Oct 2011 14:15:59 -0400
Message-ID: <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca>
	<20111017152358.GA3518@glitch>
	<CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com>
	<4E9C6F9E.5000605@bell.net>
	<BLU0-SMTP701E485C5A8DBAF113D35E97EB0@phx.gbl>
	<CADZpyizJx5fHwv5aHqoN-u1D95ph6dw8S+cAHKRS=MR6Y0WaPQ@mail.gmail.com>
	<4EA1AF18.9010605@bell.net>
	<4EA1B5C8.7050301@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4EA1B5C8.7050301@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 21, 2011 at 2:11 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> On 10/21/2011 1:42 PM, John David Anglin wrote:
>>
>> Yes. =A0The issue here is expand_call doesn't appear to be aware tha=
t
>> loading the
>> address of a __thread variable may require a call. =A0Thus, it just =
emits an
>> insn to
>> load r26. =A0This load is dead because r26 is reloaded for the call =
to
>> __tls_get_addr.
>
> It appears this may be caused by treating TLS symbols as legitimate
> constants.

Which they are not in any of the *_DYNAMIC modes, because the dynamic
linker is involved in their placement.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
