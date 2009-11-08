From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: gcj port to hppa...
Date: Sun, 8 Nov 2009 13:45:10 -0500
Message-ID: <119aab440911081045j32cf37base2aa9d08f713effc@mail.gmail.com>
References: <119aab440911071348t16198843q37757d25dc6a4691@mail.gmail.com>
	 <20091108184052.43E3A4E38@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	dave.anglin@nrc-cnrc.gc.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091108184052.43E3A4E38@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Nov 8, 2009 at 1:40 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> The gcj port to hppa uses a locking implementation
>> (libjava/sysdeps/pa/locks.h) which is not signal safe.
>
> Yes. =A0Is this the gcj problem that you were seeing with nptl?

No it is not, but I noticed this during my investigations. I might as
well fix it while I'm poking about.

>> The assembly can be interrupted by a signal which if it calls
>> compare_and_swap again will deadlock. However, I can't tell if this
>> will ever happen.
>>
>> The fix for this is to port the lock implementation to use the
>> light-weight in-kernel compare-and-swap, which is thread-safe and
>> signal-safe. However, this is only available for Linux.
>
> I would say the linux implementation should uses the gcc atomic built=
ins.
> They are based on the kernel compare-and-swap.

Oh, that's a perefect idea, I wasn't sure that libjava could make use
of those atomic builtins.

Doesn't this restrict the gcc version you can use to rebuild libjava?
Is that OK?

>> Does locks.h also need to work for HPUX?
>
> Yes.

OK, how do I write conditional code for HPUX vs. Linux?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
