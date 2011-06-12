From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: eglibc_2.13-5 on hppa
Date: Sun, 12 Jun 2011 16:52:57 -0400
Message-ID: <BANLkTik1kovLFG54LHom7Q8hpQugbXneVQ@mail.gmail.com>
References: <BANLkTi=ntF31tACKcowCtLDL728N3hNcvA@mail.gmail.com>
	<20110612203835.A675F5372@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110612203835.A675F5372@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 12, 2011 at 4:38 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> On Sun, Jun 12, 2011 at 2:47 PM, John David Anglin
>> <dave@hiauly1.hia.nrc.ca> wrote:
>> > There seems to be a problem with this futex call:
>> > futex(0xfdffb2c8, FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 0) =
>> > -1 EINVAL (Invalid argument)
>> >
>> > and the clock_gettime return seems wierd.
>>
>> Thanks, can you construct a test case from this that I can use to
>> debug the problem? If not, then I'll look at this after I look at the
>> testsuite failures.
>
> This is one of the testsuite failures (tst-timer4.c).

Perfect, I'll have a look then.

Cheers,
Carlos.
