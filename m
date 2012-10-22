From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Machine stuck when userspace 100% busy
Date: Mon, 22 Oct 2012 10:15:16 -0400
Message-ID: <CAE2sS1j6Pg6Hks97NCRNmN40vPvVbfZ+h5Y=s7tETOrT7s_FTA@mail.gmail.com>
References: <35fd660c364b9a45770b17a5bd0ecbaf@sf-mail.de>
	<CAE2sS1jmDauox09o6YNin7c4KCdBEt8FuXRadroFxkfAp_ynvQ@mail.gmail.com>
	<0fe1c205e1be1760e357bcfe4f91f593@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0fe1c205e1be1760e357bcfe4f91f593@sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 22, 2012 at 10:07 AM, Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
>> Get on the serial console and see if you can login?
>
>
> Was not possible, but because of something I broke on the other side of the
> serial line (i.e. no fault of the C3600).
>
>
>> Then issue a magic-sysrq+t? What's userspace doing?
>
>
> I went down to the machine and it was happily heartbeating as expected when
> the kernel still is able to send out ping replies. I pushed the power button
> and it shut down cleanly in something like half a minute. Poweron did work
> fine.
>
> I see in the logs one OOM event during the CMake tests. Afterwards I see for
> another 10 minutes some nagios events, so it took a while after the OOM for
> the machine to freak out, and things like creating new processes was no
> problem until then.
>
> I have no deeper insight in what happened later beyond what I already have
> written.

Without more information it's hard to determine what went wrong.

Cheers,
Carlos.
