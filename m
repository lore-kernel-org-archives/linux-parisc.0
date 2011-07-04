From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Inequivalent aliases when stracing tst-cputimer1.
Date: Mon, 4 Jul 2011 11:17:32 -0400
Message-ID: <CADZpyixokUw9EP_sZgTBbDY6PLEr389vkw5vxUppAUyFoZS0Pg@mail.gmail.com>
References: <CADZpyixbjoptakCZrdF2_X3twOMtr=Jsh__Dx3A_98=D_XZneA@mail.gmail.com>
	<BLU0-SMTP9794777FA894A72C335DF0975C0@phx.gbl>
	<BLU0-SMTP414C3D96581B1FAED8EE23975C0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP414C3D96581B1FAED8EE23975C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 4, 2011 at 10:21 AM, John David Anglin <dave.anglin@bell.ne=
t> wrote:
> On 7/4/2011 9:28 AM, John David Anglin wrote:
>>
>> On 7/3/2011 10:39 PM, Carlos O'Donell wrote:
>>>
>>> This is a binutils head, building glibc head, with gcc 4.4.4. You n=
eed to
>>> update binutils to get new linker (actually, it's the default linke=
r script
>>> that's changed).
>>> The new linker script starts the data section on a page boundary.
>
> Depending on how GCC is configured, it may or may not use your binuti=
ls head
> linker. =A0gcc -v should show
> what's going on.

You are correct, that was my mistake. I had rebuilt this particular
test without using binutils head, once I rebuilt with the newer linker
script, the two load segments have the correct alignment and the
application no longer exhibits these inequivalent aliases under
strace.

Thanks, that's one problem fixed.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
