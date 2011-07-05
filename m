From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Tue, 5 Jul 2011 18:17:03 -0400
Message-ID: <CADZpyiyi8=FY-2ihDq0RnXt5BZ3H09pSN1bYCHvQuFTvroCyrQ@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<CADZpyiwkPxzakrm+8rwOOjRnfXWPowsxZfQhDU1cr_ZSBNNhWQ@mail.gmail.com>
	<CADZpyiyZjaW3HnXJdvVCS+5SSbLmYtXXne6gkWu0KzcmASFUQg@mail.gmail.com>
	<201107051951.16931.eike@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike@sf-mail.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201107051951.16931.eike@sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 5, 2011 at 1:51 PM, Rolf Eike Beer <eike@sf-mail.de> wrote:
> Am Dienstag 05 Juli 2011, 19:28:35 schrieben Sie:
>> On Mon, Jul 4, 2011 at 2:59 PM, Carlos O'Donell <carlos@systemhalted.org>
> wrote:
>> > On Mon, Jul 4, 2011 at 2:50 PM, John David Anglin <dave.anglin@bell.net>
> wrote:
>> >> The Linux man page says the mprotect addr must be a valid pointer or a
>> >> multiple of PAGESIZE.
>> >> It's not clear what the mprotect call is trying to protect but it is
>> >> definitely not page aligned.
>> >
>> > It's trying to protect the new stack for the thread, which is
>> > obviously in the wrong spot.
>>
>> Good news.
>>
>> I have fixed tst-cputimer1.
>
> You also wrote "OK, fixed the kernel." So where an when will these fixes show
> up?

Unfortunately I hosed my setup and I didn't have git installed to make
a proper diff so here's a diff versus a somewhat recent tree.

 WIP patch: http://www.parisc-linux.org/~carlos/futex.diff

Cheers,
Carlos.
