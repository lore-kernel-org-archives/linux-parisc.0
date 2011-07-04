From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Mon, 4 Jul 2011 13:49:27 -0400
Message-ID: <CADZpyiyWCa0o2Rpj_PoJLoT28G_SuV4P896Y-+Y3rWQXqmQWTQ@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
	<CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
	<CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>
	<BLU0-SMTP765C4C4388C64F0F8BF8F8975C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP765C4C4388C64F0F8BF8F8975C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 4, 2011 at 12:58 PM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
>> Why would this mprotect fail with -EINVAL? It's not page aligned?
>>
>> You can see the earlier mmap/mprotect from thread one's stack looks
>> page aligned.
>
> I believe that the stack value needs to be aligned. =A0See comment in
> arch_get_unmapped_area. =A0Not sure if this will fix mprotect.

What needs to be aligned, the stack value or the addr in a call to mpro=
tect?

The latter, yes, that appears to be the case.

The stack will be at least aligned to the target requirement.

> I submitted a patch to return an error if =A0but there was no comment=
=2E

Reference?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
