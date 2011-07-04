From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Mon, 4 Jul 2011 14:59:44 -0400
Message-ID: <CADZpyiwkPxzakrm+8rwOOjRnfXWPowsxZfQhDU1cr_ZSBNNhWQ@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
	<CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
	<CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>
	<BLU0-SMTP765C4C4388C64F0F8BF8F8975C0@phx.gbl>
	<CADZpyiyWCa0o2Rpj_PoJLoT28G_SuV4P896Y-+Y3rWQXqmQWTQ@mail.gmail.com>
	<BLU0-SMTP5FDE70B357D278016D47B975C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP5FDE70B357D278016D47B975C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 4, 2011 at 2:50 PM, John David Anglin <dave.anglin@bell.net=
> wrote:
> The Linux man page says the mprotect addr must be a valid pointer or =
a
> multiple of PAGESIZE.
> It's not clear what the mprotect call is trying to protect but it is
> definitely not page aligned.

It's trying to protect the new stack for the thread, which is
obviously in the wrong spot.

The new stack is in the middle of the last threads guard.

I don't know what conditions triggered here, but I'm tracking it down.

The C library has a stack cache which might be the culprit, but I'd
believed all these issues fixed, I guess not.

I like easy bugs... this is simply a matter of debugging at this point.

>>> I submitted a patch to return an error if =A0but there was no comme=
nt.
>>
>> Reference?
>>
> http://www.spinics.net/lists/linux-parisc/msg03352.html

Interesting. Thanks.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
